import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final double fontSize;
  final bool isBold;
  final bool isDull;

  MyText({this.title, this.fontSize, this.isBold, this.isDull = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: (isDull == false) ? Colors.black87 : Colors.grey[400],
          fontSize: fontSize,
          fontWeight: (isBold == true) ? FontWeight.bold : FontWeight.normal),
    );
  }
}
