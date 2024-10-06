import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController addcontroller = TextEditingController();
  TextEditingController updatecontroller = TextEditingController();

  void _showAlertDialog(BuildContext context, String title, String content) {
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

  void _showupdateDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update Task"),
          content: TextField(
            controller: updatecontroller,
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
                names[index] = updatecontroller.text;
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  List names = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text("Todo App"),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Wrap(children: [
                TextField(
                  controller: addcontroller,
                  decoration: const InputDecoration(
                    labelText: "Enter new task",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.task),
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Expanded(
                child: names.isEmpty
                    ? const Center(
                        child: Text("No Item exist!!"),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 20),
                            child: ListTile(
                              tileColor: Colors.teal,
                              leading: Text(
                                "${index + 1}",
                                style: const TextStyle(fontSize: 20),
                              ),
                              title: Text(
                                "${names[index]}",
                                style: const TextStyle(fontSize: 20),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        names.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {
                                        _showupdateDialog(context, index);
                                        setState(() {});
                                        updatecontroller.clear();
                                      },
                                      icon: const Icon(Icons.update)),
                                ],
                              ),
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (addcontroller.text == "") {
            _showAlertDialog(context, "Error", "Please enter a value!!!");
          } else {
            names.add(addcontroller.text);
            setState(() {});
            addcontroller.clear();
          }
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}




// Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: add,
//               decoration: InputDecoration(
//                   labelText: "Enter Task",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   prefixIcon: Icon(Icons.task)),
//             ),
//             ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 2,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text("data"),
//                 );
//               },
//             )
//           ],
//         ),
//       ),