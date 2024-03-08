// import 'package:flutter/material.dart';

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   final TextEditingController _controller1 = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();
//   final TextEditingController _controller3 = TextEditingController();
//   final TextEditingController _controller4 = TextEditingController();
//   @override
//   void dispose() {
//     super.dispose();
//     _controller1.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     _controller4.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(
//             controller: _controller1,
//             decoration: InputDecoration(
//               labelText: 'Text Field 1',
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: _controller2,
//             decoration: InputDecoration(
//               labelText: 'Text Field 2',
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: _controller3,
//             decoration: InputDecoration(
//               labelText: 'Text Field 3',
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: _controller4,
//             decoration: InputDecoration(
//               labelText: 'Text Field 4',
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (_controller1.text.isNotEmpty &&
//                   _controller2.text.isNotEmpty &&
//                   _controller3.text.isNotEmpty &&
//                   _controller4.text.isNotEmpty) {
//                 // All fields have at least one input
//                 // You can perform further actions here
//                 print('All fields have at least one input');
//               } else {
//                 // At least one field is empty
//                 print('At least one field is empty');
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
