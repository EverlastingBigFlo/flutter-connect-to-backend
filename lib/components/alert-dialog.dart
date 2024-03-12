import 'package:flutter/material.dart';
import 'package:connectingtobackend/components/my-text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xFF470037),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class DialogBox {
  static void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 200,
            width: 350,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                  color: Color(0xFF470037),
                  fontSize: 1,
                  fontWeight: FontWeight.bold,
                  text: 'Loading.....',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void dismissDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
