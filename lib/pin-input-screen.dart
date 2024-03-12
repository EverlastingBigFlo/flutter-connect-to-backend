import 'package:flutter/material.dart';

class PinInputScreen extends StatefulWidget {
  @override
  _PinInputScreenState createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PIN Input'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PinField(
                controller: controller1,
                onChanged: (String value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
              PinField(
                controller: controller2,
                onChanged: (String value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
              PinField(
                controller: controller3,
                onChanged: (String value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
              PinField(
                controller: controller4,
                onChanged: (String value) {
                  if (value.length == 1) {
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PinField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const PinField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          hintText: '*',
        ),
        onChanged: onChanged,
      ),
    );
  }
}
