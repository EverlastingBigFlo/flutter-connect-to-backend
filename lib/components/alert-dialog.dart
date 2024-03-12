import 'package:connectingtobackend/components/my-text.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xFF8FE1D7),
      child: Text(text),
    );
  }
}

class DialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const MyText(
                color: Color(0xFF470037),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                text: '"Are you sure you want to proceed?"'),

            //cancel button and save button below
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: 'YES', onPressed: onSave),
                const SizedBox(
                  width: 8,
                ),
                //cancel button
                MyButton(text: 'NO', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
