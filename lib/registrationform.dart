import 'package:connectingtobackend/components/my-text.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  TextEditingController? firstnameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  MyForm({
    super.key,
    this.firstnameController,
    this.emailController,
    this.phoneController,
    this.passwordController,
    this.confirmPasswordController,
  });

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool _agreeToTerms = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    widget.firstnameController = TextEditingController();
    widget.emailController = TextEditingController();
    widget.phoneController = TextEditingController();
    widget.passwordController = TextEditingController();
    widget.confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    widget.firstnameController!.dispose();
    widget.emailController!.dispose();
    widget.phoneController!.dispose();
    widget.passwordController!.dispose();
    widget.confirmPasswordController!.dispose();
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
                const SizedBox(height: 35),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // intro section
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Color(0xFF470037),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up to get start with your first task',
                      style: TextStyle(
                        color: Color(0xFF470037),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),

                // textfield area
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.09),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: widget.firstnameController,
                        decoration: InputDecoration(
                          hintText: 'First and Last Name',
                          hintStyle: TextStyle(color: Color(0xFF470037)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Add email, phone, and other text fields here...

                    // Password field
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.09),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: widget.passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Color(0xFF470037)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Add confirm password and other text fields here...
                  ],
                ),

                // Agree to terms and condition
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
                        child: Row(
                          children: [
                            Text(
                              'I have read and agree to the',
                              style: TextStyle(
                                fontSize: 12,
                                color: _agreeToTerms
                                    ? Colors.blue
                                    : Color(0xFF470037),
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
                                    : Color.fromARGB(255, 7, 84, 151),
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
                                    : Color(0xFF470037),
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
                          : Color.fromARGB(255, 7, 84, 151),
                      decoration:
                          _agreeToTerms ? TextDecoration.underline : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Sign up button
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_agreeToTerms) {
                      String fullname = widget.firstnameController!.text;
                      String email = widget.emailController!.text;
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
                    backgroundColor: Color(0xFF600852),
                    fixedSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
