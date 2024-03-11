
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    firstname.dispose();
    lastname.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 35),
          
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome')
                ],
              ),
           TextField(
                controller: firstname,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        )
      ),
    );
  }
}


