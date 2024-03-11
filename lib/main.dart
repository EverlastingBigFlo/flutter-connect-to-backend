// import 'package:connectingtobackend/otp.dart';
import 'package:connectingtobackend/pin-input-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: PinInputScreen(),
    initialRoute: '/',
routes: {
  '/': (context) => PinInputScreen(),

},

    );
  }
}
