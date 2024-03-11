// import 'package:connectingtobackend/otp.dart';
import 'package:connectingtobackend/pin-input-screen.dart';
import 'package:connectingtobackend/registrationform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: '/',
routes: {
  // '/': (context) => PinInputScreen(),
  '/': (context) => MyForm(),

},

    );
  }
}



