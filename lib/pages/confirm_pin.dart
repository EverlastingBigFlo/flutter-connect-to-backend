import 'package:connectingtobackend/components/alerts/alert_info.dart';
import 'package:connectingtobackend/components/alerts/alert_loading.dart';
import 'package:connectingtobackend/components/pin_inputs.dart';
import 'package:connectingtobackend/controllers/auth_controller.dart';
import 'package:connectingtobackend/service/state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ConfirmTxPin extends StatefulWidget {
  const ConfirmTxPin({super.key});

  @override
  State<ConfirmTxPin> createState() => _ConfirmTxPinState();
}

class _ConfirmTxPinState extends State<ConfirmTxPin> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;
  AlertLoading loading = AlertLoading();
  AlertInfo info = AlertInfo();
  var refs;
  var pins;

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

  void submit() async {
    final pin1 = refs.watch(txPinProvider);
    // get the value of the inputbox
    final pin2 = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text;
    // check if the first pin is the samme as this same pin
    if (pin2 != pin1['pin1']) {
      info.message = 'Pin not match';
      pin1['pin1'];
      info.showAlertDialog(context);
      return;
    }
    loading.showAlertDialog(context);
    // create the transaction pin if the first pin meet with the same pin
    final response = await AuthController().createTxPin({'pin': pin2});
    loading.closeDialog(context);
    // display error messages if the request encounter error
    if (response['status'] == 'error') {
      info.message = response['message'];
      info.showAlertDialog(context);
    }

    Navigator.pushNamed(context, "dashboard");
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              child: Consumer(builder: (context, ref, _) {
                pins = ref.watch(txPinProvider);
                refs = ref;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.lock_person,
                          size: 60,
                          color: Color(0xFF470037),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Confirm the pin ",
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
                              "Just to be sure. Kindly re-enter your 4-digit PIN to confirm it.",
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
