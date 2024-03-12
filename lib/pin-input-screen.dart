import 'package:flutter/material.dart';

class PinInputScreen extends StatefulWidget {
  @override
  _PinInputScreenState createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  late FocusNode nextFocusnode;

  @override
  void initState() {
    super.initState();
    nextFocusnode = FocusNode();
  }

  @override
  void dispose() {
    nextFocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('PIN Input')),
        ),
        body: SizedBox(
          width: 45,
          child: TextFormField(
            maxLength: 1,
          ),
        ));
  }
}
