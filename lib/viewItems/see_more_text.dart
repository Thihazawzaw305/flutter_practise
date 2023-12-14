import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeMoreText extends StatelessWidget {
  final String text ;
  final Color textColor;
  const SeeMoreText({super.key, required this.text, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return  Text(text,style:
    TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline
    ),);
  }
}
