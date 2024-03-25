import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
