import 'package:connectingtobackend/components/my-text.dart';
import 'package:flutter/material.dart';

class PinInputScreen extends StatefulWidget {
  PinInputScreen({Key? key}) : super(key: key);

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();

  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;
}

class _PinInputScreenState extends State<PinInputScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller1 = TextEditingController();
    widget.controller2 = TextEditingController();
    widget.controller3 = TextEditingController();
    widget.controller4 = TextEditingController();

    widget.focusnode1 = FocusNode();
    widget.focusnode2 = FocusNode();
    widget.focusnode3 = FocusNode();
    widget.focusnode4 = FocusNode();

    widget.focusnode1.requestFocus();
  }

  void dispose() {
    widget.controller1.dispose();
    widget.controller2.dispose();
    widget.controller3.dispose();
    widget.controller4.dispose();

    widget.focusnode1.dispose();
    widget.focusnode2.dispose();
    widget.focusnode3.dispose();
    widget.focusnode4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: MyText(
            color: Color(0xFF470037),
            fontSize: 1.2,
            fontWeight: FontWeight.bold,
            text: 'PIN',
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinInput(
              controllers: widget.controller1,
              focusnode: widget.focusnode1,
              nextFocusnode: widget.focusnode2,
            ),
            const SizedBox(
              width: 30,
            ),
            PinInput(
              controllers: widget.controller2,
              focusnode: widget.focusnode2,
              nextFocusnode: widget.focusnode3,
            ),
            const SizedBox(
              width: 30,
            ),
            PinInput(
              controllers: widget.controller3,
              focusnode: widget.focusnode3,
              nextFocusnode: widget.focusnode4,
            ),
            const SizedBox(
              width: 30,
            ),
            PinInput(
              controllers: widget.controller4,
              focusnode: widget.focusnode4,
              isLast: true,
              func: () {},
            ),
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
            fillColor: const Color(0xFF470037),
            counter: const SizedBox.shrink()),
      ),
    );
  }
}
