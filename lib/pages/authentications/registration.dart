// ignore_for_file: use_build_context_synchronously

import 'package:connectingtobackend/components/alerts/alert_info.dart';
import 'package:connectingtobackend/components/alerts/alert_loading.dart';
import 'package:connectingtobackend/controllers/auth_controller.dart';
import 'package:connectingtobackend/models/user_model.dart';
import 'package:connectingtobackend/service/shared_preference.dart';
import 'package:connectingtobackend/service/state_provider.dart';
import 'package:connectingtobackend/service/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../components/my-text.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({
    super.key,
  });

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final List<String> Items = [
    "Password must be number",
    "Password must be 6 in length",
    // "A special character  (@#^%)",
    // "A number(1)",
    // "8 characters minimum"
  ];
  bool _isObscured = true;
  bool _agreeToTerms = false;
  TextEditingController? firstnameController;
  TextEditingController? lastNameController;
  TextEditingController? userNameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? dateOfBirthController;
  TextEditingController? genderController;

  late Map? formData;
  bool submitted = false;
  AlertInfo alertInfo = AlertInfo();
  AlertLoading alertLoading = AlertLoading();
  CustomSharedPreference pref = CustomSharedPreference();

// create function submit here
  void submit(ref) async {
    AuthController axios = AuthController();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    alertLoading.showAlertDialog(context);
    final response = await axios.register(formData!);
    alertLoading.closeDialog(context);
    // print(response);

    if (response['status'] == "error") {
      alertInfo.message = response['message'];
      alertInfo.showAlertDialog(context);
      return;
    }

    ref.read(userProvider.notifier).state =
        UserModel.fromJson(response['user']);
    pref.setString('token', response['token']);
    ref.read(goToProvider.notifier).state = "createPin";

    Navigator.pushNamed(context, 'verify');
  }

  @override
  void initState() {
    super.initState();
    firstnameController = TextEditingController();
    lastNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    dateOfBirthController = TextEditingController();
    genderController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    firstnameController!.dispose();
    lastNameController!.dispose();
    userNameController!.dispose();
    emailController!.dispose();
    phoneController!.dispose();
    passwordController!.dispose();
    confirmPasswordController!.dispose();
    dateOfBirthController!.dispose();
    genderController!.dispose();
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
        child: Consumer(builder: (context, ref, _) {
          return SingleChildScrollView(
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
                    controller: firstnameController,
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
                    controller: lastNameController,
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
                    controller: userNameController,
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
                    controller: emailController,
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
                    controller: phoneController,
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
                      keyboardType: TextInputType.number,
                      obscureText: _isObscured,
                      controller: passwordController,
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
                      keyboardType: TextInputType.number,
                      obscureText: _isObscured,
                      controller: confirmPasswordController,
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

                const SizedBox(height: 20.0),

                // date picker section
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
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoTextField(
                          controller: dateOfBirthController,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFF470037)),
                          ),
                          placeholder: 'mm-dd-yyyy',
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              'Date of Birth',
                              style: TextStyle(
                                  color: Color(0xFF470037),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          suffix: GestureDetector(
                            onTap: () {
                              showCupertinoModalPopup<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    height: 200.0,
                                    color: CupertinoColors.white,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: DateTime.now(),
                                      minimumDate: DateTime(1960),
                                      maximumDate: DateTime.now(),
                                      onDateTimeChanged:
                                          (DateTime newDateTime) {
                                        String formattedDate =
                                            DateFormat('MM-dd-yyyy')
                                                .format(newDateTime);
                                        dateOfBirthController!.text =
                                            formattedDate;
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.calendar_today,
                                color: Color(0xFF470037),
                              ),
                            ),
                          ),
                          onTap: () {
                            showCupertinoModalPopup<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200.0,
                                  color: CupertinoColors.white,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    minimumDate: DateTime(1960),
                                    maximumDate: DateTime.now(),
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      String formattedDate =
                                          DateFormat('MM/dd/yyyy')
                                              .format(newDateTime);
                                      dateOfBirthController!.text =
                                          formattedDate;
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),

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
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: genderController!.text.isEmpty
                            ? null
                            : genderController!.text,
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            genderController!.text = value!;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'Gender',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ],
                  ),
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
                  onPressed: () async {
                    if (_agreeToTerms) {
                      AlertInfo alert = AlertInfo();
                      if (emailController!.text == '' ||
                          passwordController!.text == '' ||
                          confirmPasswordController!.text == '' ||
                          phoneController!.text == '' ||
                          userNameController!.text == '') {
                        alert.message = "Fill all required fields";
                        alert.showAlertDialog(context);
                        return;
                      }
                      if (confirmPasswordController!.text !=
                          passwordController!.text) {
                        alert.message = "Passwords not match";
                        alert.showAlertDialog(context);
                        return;
                      }
                      Utilities device = Utilities();
                      var deviceinfo = await device.devicePlatform;
                      Map data = ref.watch(signUpProvider.notifier).state;

                      data['first_name'] = firstnameController!.text;
                      data['last_name'] = lastNameController!.text;
                      data['username'] = userNameController!.text;
                      data['email'] = emailController!.text;
                      data['phone'] = phoneController!.text;
                      data['password'] = passwordController!.text;
                      data['password_confirmation'] =
                          confirmPasswordController!.text;
                      data['date_of_birth'] = dateOfBirthController!.text;
                      data['gender'] = genderController!.text;
                      data['device_id'] = deviceinfo['id'];
                      data['device_model'] = deviceinfo['model'];
                      ref.read(signUpProvider.notifier).state = data;
                      setState(() {
                        formData = data;
                      });
                      submit(ref);
                    } else {
                      print('Please agree to the terms and conditions');
                      return;
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
                        onTap: () {
                          Navigator.pushNamed(context, 'signin');
                        },
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
          );
        }),
      ),
    );
  }
}
