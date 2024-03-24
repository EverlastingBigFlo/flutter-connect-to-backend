import 'dart:async';

import 'package:connectingtobackend/components/alert-dialog.dart';
import 'package:connectingtobackend/service/state_provider.dart';
import 'package:connectingtobackend/service/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  var goTo;

  Utilities utilities = Utilities();

  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;
  bool isButtonEnabled = true;
  int remainingSeconds = 0;
  var user;
  var email;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();

    focusnode1 = FocusNode();
    focusnode2 = FocusNode();
    focusnode3 = FocusNode();
    focusnode4 = FocusNode();

    focusnode1.requestFocus();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();

    focusnode1.dispose();
    focusnode2.dispose();
    focusnode3.dispose();
    focusnode4.dispose();

    super.dispose();
  }

  void submit() async {
    String pin1 = controller1.text;
    String pin2 = controller2.text;
    String pin3 = controller3.text;
    String pin4 = controller4.text;

    DialogBox.showConfirmationDialog(context);
    Future.delayed(const Duration(milliseconds: 3000), () {
      DialogBox.dismissDialog(context);

      print('PIN Input: $pin1$pin2$pin3$pin4');
    });
  }

  void sendAgain() async {
    setState(() {
      isButtonEnabled = false;
      remainingSeconds = 50;
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingSeconds--;
      });

      if (remainingSeconds == 0) {
        timer.cancel();
        setState(() {
          isButtonEnabled = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            child: Consumer(builder: (context, ref, _) {
              goTo = ref.watch(goToProvider);
              user = ref.watch(userProvider);
              email = ref.watch(signUpProvider)['email'];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.phone_android_rounded,
                    size: 60,
                    color: Color(0xFF470037),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Verify Phone number",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter the 4-digit code sent to ${utilities.hidePhoneNumber(user.phone)} and ${utilities.hideEmailAddress(user.email)}. Never disclose this to anyone!",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PinInput(
                        controllers: controller1,
                        focusnode: focusnode1,
                        nextFocusnode: focusnode2,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      PinInput(
                        controllers: controller2,
                        focusnode: focusnode2,
                        nextFocusnode: focusnode3,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      PinInput(
                        controllers: controller3,
                        focusnode: focusnode3,
                        nextFocusnode: focusnode4,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      PinInput(
                        controllers: controller4,
                        focusnode: focusnode4,
                        isLast: true,
                        func: submit,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: isButtonEnabled ? sendAgain : null,
                        child: Text(
                          isButtonEnabled
                              ? 'Send again'
                              : 'Send again in $remainingSeconds seconds',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF470037)),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            })),
      ),
    );
  }
}

// the pininpus logic
class PinInput extends StatelessWidget {
  late TextEditingController? controllers;
  late FocusNode? focusnode;
  late FocusNode? nextFocusnode;
  late bool? isLast = false;
  final VoidCallback? func;

  PinInput(
      {super.key,
      this.func,
      required this.controllers,
      required this.focusnode,
      this.nextFocusnode,
      this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      child: TextFormField(
        controller: controllers,
        focusNode: focusnode,
        maxLength: 1,
        onChanged: (value) => {
          if (value != '' && nextFocusnode != null)
            {nextFocusnode!.requestFocus()},
          if (isLast == true && value != '') {func!()}
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding: const EdgeInsetsDirectional.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          // fillColor: const Color(0xFF470037),
          counter: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
