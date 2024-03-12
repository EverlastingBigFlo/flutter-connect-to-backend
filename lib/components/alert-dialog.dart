import 'package:flutter/material.dart';
import 'package:connectingtobackend/components/my-text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.text, required this.onPressed});

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
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                  color: const Color(0xFF470037),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: '"Are you sure you want to proceed?"',
                ),

                // Cancel and Save buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(text: 'YES', onPressed: onSave),
                    const SizedBox(width: 8),
                    MyButton(text: 'NO', onPressed: onCancel),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyButton(
      text: 'Show Dialog',
      onPressed: () {
        _showDialog(context);
      },
    );
  }
}
