// import 'package:connectingtobackend/otp.dart';
import 'package:connectingtobackend/pages/authentications/registration.dart';
import 'package:connectingtobackend/pages/authentications/registration_pin.dart';
import 'package:connectingtobackend/pages/authentications/sign_in.dart';
import 'package:connectingtobackend/pages/confirm_pin.dart';
import 'package:connectingtobackend/pages/create_pin.dart';
import 'package:connectingtobackend/pages/dashboard.dart';
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
        'signup': (context) => const RegistrationForm(),
        '/': (context) => const SignIn(),
        // 'signin': (context) => const SignIn(),
        'verify': (context) => const EmailPinVerification(),
        'setpin': (context) => const CreateTxPin(),
        'confirmPin': (context) => const ConfirmTxPin(),
        'dashboard': (context) => const Dashboard(),
      },
    );
  }
}
