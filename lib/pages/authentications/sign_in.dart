import 'package:connectingtobackend/components/alerts/alert_info.dart';
import 'package:connectingtobackend/components/alerts/alert_loading.dart';
import 'package:connectingtobackend/components/my-text.dart';
import 'package:connectingtobackend/controllers/auth_controller.dart';
import 'package:connectingtobackend/service/state_provider.dart';
import 'package:connectingtobackend/service/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  TextEditingController? emailNumController;
  TextEditingController? passwordController;
  void setLogin(ref) async {
    AlertInfo alertInfo = AlertInfo();
    AlertLoading alertLoading = AlertLoading();

    Utilities utilities = Utilities();

    Map info = await utilities.devicePlatform;

    // Map data = ref.watch(signUpProvider.notifier).state;

    String? goto = ref.read(goToProvider.notifier).state = 'dashboard';

    ref.read(bvnProvider.notifier).state = false;

    alertLoading.showAlertDialog(context);

    final response = await AuthController().login({
      "email_or_phone": emailNumController!.text,
      "password": passwordController!.text,
      "device_model": info['model'],
      "device_id": info['id']
    });
    alertLoading.closeDialog(context);

    if (response['status'] == 'error' && response['otp'] == false) {
      alertInfo.message = response['message'];
      alertInfo.showAlertDialog(context);
      return;
    } else if (response['status'] == 'error' && response['otp'] == true) {
      // data['phone']=response['user']['phone'];
      // data['email']=response['user']['email'];
      // ref.refresh(userProvider.notifier).state = 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
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
                          text: 'Sign in your credientials'),
                    ],
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
                      controller: emailNumController,
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
                  const SizedBox(height: 20.0),

                  const SizedBox(height: 12.0),
                  // sign up button
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setLogin(ref);
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
                      'SIGN IN',
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
                            text: 'Don`t have an Account?'),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'signup');
                          },
                          child: const Text('Sign Up',
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
      ),
    );
  }
}
