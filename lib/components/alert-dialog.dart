import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'NO'),
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'YES'),
              child: const Text('YES'),
            ),
          ],
        ),
      ),
      child: const Text('Are you sure you want to proceed?'),
    );
  }
}
