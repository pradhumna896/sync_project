import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String title;
  double fontSize;
  Color color;
  FontWeight fontWeight;
  TextAlign textAlign;

  CustomText(
      {Key? key,
      required this.title,
      required this.fontWeight,
      required this.color,
      required this.fontSize,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: "Sk-Modernist"),
      textScaleFactor: 1,
      textAlign: textAlign,
    );
  }
}
