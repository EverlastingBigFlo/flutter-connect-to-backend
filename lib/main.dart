// import 'package:connectingtobackend/otp.dart';
import 'package:connectingtobackend/registration.dart';
import 'package:connectingtobackend/registration_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        // '/': (context) => const RegistrationForm(),
        // 'pininput': (context) => const PinInputScreen(),
        '/': (context) => const PinInputScreen(),
      },
    );
  }
}
