import 'package:flutter/material.dart';
import 'package:flutterclass/todoappthunder/todowithoutmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          hintColor: Colors.orange,
          brightness: Brightness.light,
          fontFamily: 'Arial',
        ),
        debugShowCheckedModeBanner: false,
        home: const Todowithoutmodel());
  }
}





// Center(
//             child: Container(
//               color: Colors.yellow,
//               width: 360,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   div(message: "COntainer1"),
//                   const Counter(),
//                   div(message: "COntainer2")
//                 ],
//               ),
//             ),
//           ),