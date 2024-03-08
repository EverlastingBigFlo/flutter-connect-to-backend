import 'package:connectingtobackend/otp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: 'form',
//       routes: {
//         'form': (context) => MyForm(),
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Field Example'),
        ),
        body: Center(
          child: MyForm(),
        ),
      ),
    );
  }
}
