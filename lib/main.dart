// import 'package:connectingtobackend/otp.dart';
import 'package:connectingtobackend/registration.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => MyForm(),
        '/': (context) => RegistrationForm(),
        'pininput': (context) => const PinInputScreen(),
      },
    );
  }
}
