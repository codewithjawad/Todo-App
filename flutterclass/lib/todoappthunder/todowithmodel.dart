import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterclass/model/usermodel.dart';
import 'package:http/http.dart' as http;

class TodoT extends StatefulWidget {
  const TodoT({super.key});

  @override
  State<TodoT> createState() => _TodoState();
}

class _TodoState extends State<TodoT> {
  TextEditingController addController = TextEditingController();
  TextEditingController updateController = TextEditingController();
  List<usermodel> tasks = [];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final response = await http.get(Uri.parse(
          "https://crudcrud.com/api/48a88569a6df42168a743d3ced8ef8c8/unicorns"));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          tasks = data.map((item) => usermodel.fromJson(item)).toList();
        });
      } else {
        _showAlertDialog("Error", "Failed to fetch tasks");
      }
    } catch (e) {
      _showAlertDialog("Error", "Failed to load tasks: $e");
    }
  }

  Future<void> postData(usermodel userModel) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://crudcrud.com/api/48a88569a6df42168a743d3ced8ef8c8/unicorns'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userModel.toJson()),
      );
      if (response.statusCode == 201) {
        fetchTasks(); // Refresh the data after adding
        addController.clear();
      } else {
        _showAlertDialog("Error", "Failed to add task");
      }
    } catch (e) {
      _showAlertDialog("Error", "Failed to add task: $e");
    }
  }

  Future<void> updateData(String id, Map<String, dynamic> userdata) async {
    try {
      final response = await http.put(
        Uri.parse(
            'https://crudcrud.com/api/48a88569a6df42168a743d3ced8ef8c8/unicorns/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userdata),
      );
      if (response.statusCode == 200) {
        fetchTasks(); // Refresh the data after updating
      } else {
        _showAlertDialog("Error", "Failed to update task");
      }
    } catch (e) {
      _showAlertDialog("Error", "Failed to update task: $e");
    }
  }

  Future<void> deleteData(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(
            'https://crudcrud.com/api/48a88569a6df42168a743d3ced8ef8c8/unicorns/$id'),
      );
      if (response.statusCode == 200) {
        fetchTasks(); // Refresh the data after deleting
      } else {
        _showAlertDialog("Error", "Failed to delete task");
      }
    } catch (e) {
      _showAlertDialog("Error", "Failed to delete task: $e");
    }
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context, String id) {
    updateController.text = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update Task"),
          content: TextField(
            controller: updateController,
            decoration: const InputDecoration(hintText: "Enter task name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                if (updateController.text.isNotEmpty) {
                  updateData(
                      id, usermodel(name: updateController.text).toJson());
                  Navigator.of(context).pop();
                  updateController.clear();
                } else {
                  _showAlertDialog("Error", "Please enter a task name.");
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Center(
          child: Text("Todo App"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: addController,
              decoration: const InputDecoration(
                labelText: "Enter Task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                prefixIcon: Icon(Icons.task),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(child: Text('No tasks created yet!'))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: Colors.grey[50],
                          title: Text(tasks[index].name ?? ''),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _showUpdateDialog(context, tasks[index].sId!);
                                },
                                icon: const Icon(Icons.update),
                              ),
                              IconButton(
                                onPressed: () {
                                  deleteData(tasks[index].sId!);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          if (addController.text.isEmpty) {
            _showAlertDialog("Error", "Please enter a task!");
          } else {
            postData(usermodel(name: addController.text));
          }
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
