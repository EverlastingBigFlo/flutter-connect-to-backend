// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:connectingtobackend/components/my-text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class MyForm extends StatefulWidget {
  TextEditingController? firstnameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? dateOfBirthController;
  TextEditingController? genderController;
  MyForm({
    super.key,
    this.firstnameController,
    this.emailController,
    this.phoneController,
    this.passwordController,
    this.confirmPasswordController,
    this.dateOfBirthController,
    this.genderController,
  });

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    widget.firstnameController = TextEditingController();
    widget.emailController = TextEditingController();
    widget.emailController = TextEditingController();
    widget.phoneController = TextEditingController();
    widget.passwordController = TextEditingController();
    widget.confirmPasswordController = TextEditingController();
    widget.dateOfBirthController = TextEditingController();
    widget.genderController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    widget.firstnameController!.dispose();
    widget.emailController!.dispose();
    widget.phoneController!.dispose();
    widget.passwordController!.dispose();
    widget.confirmPasswordController!.dispose();
    widget.dateOfBirthController!.dispose();
    widget.genderController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // textfield area
                const Column(
                  children: [],
                ),

                // agree to terms and condition
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
                        // agreement text
                        child: Row(
                          children: [
                            Text(
                              'I have read and agree to the',
                              style: TextStyle(
                                fontSize: 12,
                                color: _agreeToTerms
                                    ? Colors.blue
                                    : const Color(0xFF470037),
                                decoration: _agreeToTerms
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Terms of conditions',
                              style: TextStyle(
                                fontSize: 12,
                                color: _agreeToTerms
                                    ? Colors.blue
                                    : const Color.fromARGB(255, 7, 84, 151),
                                decoration: _agreeToTerms
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'and',
                              style: TextStyle(
                                fontSize: 12,
                                color: _agreeToTerms
                                    ? Colors.blue
                                    : const Color(0xFF470037),
                                decoration: _agreeToTerms
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'Privacy policy',
                    style: TextStyle(
                      fontSize: 12,
                      color: _agreeToTerms
                          ? Colors.blue
                          : const Color.fromARGB(255, 7, 84, 151),
                      decoration:
                          _agreeToTerms ? TextDecoration.underline : null,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // sign up button
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_agreeToTerms) {
                      String fullname = widget.firstnameController!.text;
                      String email = widget.emailController!.text;
                      // int phone =
                      // int.tryParse(widget.phoneController!.text) ?? 0;
                      String phone = widget.phoneController!.text;
                      String password = widget.passwordController!.text;
                      String confirmPassword =
                          widget.confirmPasswordController!.text;

                      print('Fullname: $fullname');
                      print('Email: $email');
                      print('Phone: $phone');
                      print('Password: $password');
                      print('Confirm Password: $confirmPassword');
                    } else {
                      print('Please agree to the terms and conditions');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF600852),
                    fixedSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Set border radius
                    ),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // already have an account
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65),
                  child: Row(
                    children: [
                      const MyText(
                          color: Color(0xFF470037),
                          fontSize: 1.0,
                          fontWeight: FontWeight.normal,
                          text: 'Already have an Account?'),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text('Sign In',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF470037))),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
