import 'package:flutter/material.dart';
import 'package:connectingtobackend/components/my-text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton(
      {super.key, Key? required, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xFF470037),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  void showDialogg(BuildContext context) {
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
                const MyText(
                  color: Color(0xFF470037),
                  fontSize: 1,
                  fontWeight: FontWeight.bold,
                  text: 'Pin Confirmed',
                ),

                // Cancel and Save buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     MyButton(
                //       text: 'YES',
                //       onPressed: onSave,
                //       // Setting text color to white
                //     ),
                //     const SizedBox(width: 15),
                //     MyButton(
                //       text: 'NO',
                //       onPressed: onCancel,
                //       // Setting text color to white
                //     ),
                //   ],
                // ),
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
        showDialogg(context);
      },
    );
  }
}
