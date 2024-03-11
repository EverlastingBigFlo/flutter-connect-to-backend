import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const MyText({super.key, required this.color, required this.fontSize, required this.fontWeight, required this.text});

  @override
 Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Color(0xFF470037)),
      // ignore: deprecated_member_use
      textScaleFactor: fontSize,
    );
  }
}