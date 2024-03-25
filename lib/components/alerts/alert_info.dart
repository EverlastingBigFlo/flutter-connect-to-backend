import 'package:flutter/material.dart';

class AlertInfo {
  String? title;
  String? message;

  AlertInfo();

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text(
        "OK",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      insetPadding: const EdgeInsets.all(0),
      content: Text(
        message ?? '',
        textAlign: TextAlign.center,
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
