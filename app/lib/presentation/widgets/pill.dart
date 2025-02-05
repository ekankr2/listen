import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final dynamic color;
  final double paddingX;
  final double paddingY;
  final String text;
  final double fontSize;
  final Color textColor;

  const Pill({
    super.key,
    this.color = CupertinoColors.systemGrey,
    this.paddingX = 10,
    this.paddingY = 6,
    required this.text,
    this.fontSize = 12,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50), // Large radius for pill shape
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
