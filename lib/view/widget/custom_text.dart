import 'package:flutter/material.dart';

class CusomText extends StatelessWidget {
  const CusomText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.white,
    this.alignment = Alignment.topLeft,
    this.height = 1,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
