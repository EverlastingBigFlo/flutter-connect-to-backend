import 'package:connectingtobackend/components/my-text.dart';
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
                    MyText(
                        color: Color(0xFF470037),
                        fontSize: 2.5,
                        fontWeight: FontWeight.bold,
                        text: 'Welcome')
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                        color: Color(0xFF470037),
                        fontSize: 1,
                        fontWeight: FontWeight.normal,
                        text: 'Sign up to get start with your first task'),
                  ],
                ),
                const SizedBox(height: 35),
                TextField(
                  controller: firstname,
                  decoration: InputDecoration(
                    hintText: 'First and Last Name',
                    hintStyle: const TextStyle(color: Color(0xFF470037)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          )),
    );
  }
}
