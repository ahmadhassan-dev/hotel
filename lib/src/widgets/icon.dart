import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  MyIcon({this.icon, this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
