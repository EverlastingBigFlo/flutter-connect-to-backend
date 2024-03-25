import 'package:connectingtobackend/service/state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;
  var refs;

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
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusnode1.dispose();
    focusnode2.dispose();
    focusnode3.dispose();
    focusnode4.dispose();
  }

  void submit() {
    final pin1 = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text;
    refs.read(txPinProvider.notifier).state = {"pin1": pin1};
    Navigator.pushNamed(context, "confirmPin");
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Consumer(builder: (context, ref, _) {
                refs = ref;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.lock_person,
                          size: 60,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create Transaction pin",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Set your private 4-digit PIN to secure your account. Never disclose this to anyone!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PasswordInputBox(
                                textController: controller1,
                                focusnode: focusnode1,
                                nextfocusnode: focusnode2),
                            const SizedBox(
                              width: 20,
                            ),
                            PasswordInputBox(
                                textController: controller2,
                                focusnode: focusnode2,
                                nextfocusnode: focusnode3),
                            const SizedBox(
                              width: 20,
                            ),
                            PasswordInputBox(
                                textController: controller3,
                                focusnode: focusnode3,
                                nextfocusnode: focusnode4),
                            const SizedBox(
                              width: 20,
                            ),
                            PasswordInputBox(
                              textController: controller4,
                              focusnode: focusnode4,
                              func: submit,
                              isLast: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              })),
        ),
      ),
    );
  }
}

class PasswordInputBox extends StatelessWidget {
  PasswordInputBox(
      {super.key,
      required this.textController,
      required this.focusnode,
      this.nextfocusnode,
      this.func,
      this.isLast = false});

  late final TextEditingController textController;
  late final FocusNode focusnode;
  late final FocusNode? nextfocusnode;
  late final VoidCallback? func;
  late final bool? isLast;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 45,
        child: Consumer(
          builder: (context, ref, _) {
            return TextFormField(
              controller: textController,
              focusNode: focusnode,
              maxLength: 1,
              onChanged: (value) {
                if (value != "" && nextfocusnode != null) {
                  nextfocusnode!.requestFocus();
                }
                if (isLast == true && value != "") {
                  func!();
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10, // Adjust vertical padding as needed
                  horizontal: 10, // Adjust horizontal padding as needed
                ),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                fillColor: Colors.grey.shade200,
                counter: const SizedBox.shrink(), // removes the counter
              ),
            );
          },
        ));
  }
}
