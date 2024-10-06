// import 'package:flutter/material.dart';

// class MyContainerWidget extends StatelessWidget {
//   const MyContainerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 100,
//             width: 100,
//             decoration: const BoxDecoration(
//               color: Colors.amber,
//               shape: BoxShape.circle,
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 40, bottom: 10, left: 30),
//             margin: const EdgeInsets.only(left: 50, top: 50),
//             height: 100,
//             width: 100,
//             decoration: const BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(50),
//                 topRight: Radius.circular(50),
//                 bottomRight: Radius.circular(50),
//                 bottomLeft: Radius.circular(50),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 20,
//                   spreadRadius: 2,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//             child: const Text(
//               'hello',
//               style: TextStyle(fontSize: 30),
//             ),
//           ),
//           const SizedBox(
//             height: 100,
//             width: 300,
//             child: Text(
//               'Sized Box',
//               style: TextStyle(fontSize: 30, color: Colors.blue),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class div extends StatelessWidget {
  String message = "";
  div({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: Text(message),
    );
  }
}
