import 'package:flutter/material.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('PIN Input')),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinInput(),
            const SizedBox(
              width: 30,
            ),
            PinInput(),
            const SizedBox(
              width: 30,
            ),
            PinInput(),
            const SizedBox(
              width: 30,
            ),
            PinInput(),
          ],
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
  bool? isLast = false;
  final VoidCallback? func;

  PinInput(
      {super.key,
      this.func,
      this.controllers,
      this.focusnode,
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
            fillColor: Colors.blueGrey,
            counter: const SizedBox.shrink()),
      ),
    );
  }
}
