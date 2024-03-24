import 'package:connectingtobackend/components/alert-dialog.dart';
import 'package:connectingtobackend/components/my-text.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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

  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;
// declare dio
  final dio = Dio();

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

    // final response = await dio.get('http://10.0.2.2:8000/api/hello');

    // DialogBox.dismissDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
          child: Row(
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
        ),
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
          contentPadding: const EdgeInsetsDirectional.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          fillColor: const Color(0xFF470037),
          counter: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
