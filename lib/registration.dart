import 'package:flutter/material.dart';

import 'components/my-text.dart';

class RegistrationForm extends StatefulWidget {
  TextEditingController? firstnameController;
  TextEditingController? lastNameController;
  TextEditingController? userNameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  RegistrationForm(
      {super.key,
      this.firstnameController,
      this.lastNameController,
      this.userNameController,
      this.emailController,
      this.phoneController,
      this.passwordController,
      this.confirmPasswordController});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isObscured = true;
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    widget.firstnameController = TextEditingController();
    widget.lastNameController = TextEditingController();
    widget.userNameController = TextEditingController();
    widget.emailController = TextEditingController();
    widget.phoneController = TextEditingController();
    widget.passwordController = TextEditingController();
    widget.confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    widget.firstnameController!.dispose();
    widget.lastNameController!.dispose();
    widget.userNameController!.dispose();
    widget.emailController!.dispose();
    widget.phoneController!.dispose();
    widget.passwordController!.dispose();
    widget.confirmPasswordController!.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 35),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // intro section
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

              // TextFormField area
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
                    hintText: 'First Name',
                    hintStyle: const TextStyle(color: Color(0xFF470037)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
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
                  controller: widget.lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: const TextStyle(color: Color(0xFF470037)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

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
                  controller: widget.userNameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: Color(0xFF470037)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

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
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Color(0xFF470037)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
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
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: widget.phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(color: Color(0xFF470037)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
// password section

              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.09),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: TextFormField(
                    obscureText: _isObscured,
                    controller: widget.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Color(0xFF470037)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              // confirm password
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.09),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: TextFormField(
                    obscureText: _isObscured,
                    controller: widget.confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(color: Color(0xFF470037)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  )),

              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Date of Birth'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      // Show date picker or custom date selection widget
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                value: 'Male',
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    // Update selected gender
                  });
                },
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              const SizedBox(height: 12.0),

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
                    decoration: _agreeToTerms ? TextDecoration.underline : null,
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
                    String firstname = widget.firstnameController!.text;
                    String lastname = widget.lastNameController!.text;
                    String username = widget.userNameController!.text;
                    String email = widget.emailController!.text;
                    String phone = widget.phoneController!.text;
                    String password = widget.passwordController!.text;
                    String confirmPassword =
                        widget.confirmPasswordController!.text;

                    print('Firstname: $firstname');
                    print('Lastname: $lastname');
                    print('Username: $username');
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
                    borderRadius: BorderRadius.circular(8), // Set border radius
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
        ),
      ),
    );
  }
}
