import 'package:flutter/material.dart';

class OTPTextField extends StatefulWidget {
  const OTPTextField({super.key});

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (index) => TextEditingController());
    focusNodes = List.generate(4, (index) => FocusNode());
    for (int i = 0; i < controllers.length - 1; i++) {
      controllers[i].addListener(() {
        if (controllers[i].text.isNotEmpty) {
          FocusScope.of(context).requestFocus(focusNodes[i + 1]);
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        controllers.length,
        (index) => SizedBox(
          width: 50,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty && index < controllers.length - 1) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }
            },
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('OTP TextField Example'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: OTPTextField(),
//         ),
//       ),
//     ),
//   ));
// }
