// import 'package:connectingtobackend/otp.dart';
// import 'package:connectingtobackend/registrationform.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         // '/': (context) => PinInputScreen(),
//         // '/': (context) => MyForm(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agree to Terms and Conditions',
      home: AgreementScreen(),
    );
  }
}

class AgreementScreen extends StatefulWidget {
  @override
  _AgreementScreenState createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agree to Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please read and agree to the terms and conditions:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _agreeToTerms = !_agreeToTerms;
                      });
                    },
                    child: Text(
                      'I agree to the terms and conditions',
                      style: TextStyle(
                        fontSize: 16,
                        color: _agreeToTerms ? Colors.blue : Colors.black,
                        decoration:
                            _agreeToTerms ? TextDecoration.underline : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Perform action after agreeing to terms and conditions
                if (_agreeToTerms) {
                  // Agreement is accepted, proceed with the action
                  print('Agreement accepted');
                } else {
                  // Agreement is not accepted, show an error message or prompt
                  print('Please agree to the terms and conditions');
                }
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
