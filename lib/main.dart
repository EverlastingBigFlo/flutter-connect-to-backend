// import 'package:connectingtobackend/otp.dart';
import 'package:connectingtobackend/pin-input-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: PinInputScreen(),
    initialRoute: '/',
routes: {
  '/': (context) => PinInputScreen(),
  // Add more routes here if needed
},

    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MyForm();
//   }
// }
