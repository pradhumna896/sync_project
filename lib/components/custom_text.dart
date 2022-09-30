import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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

      style:GoogleFonts.nunito(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,

          ),
      textScaleFactor: 1,
      textAlign: textAlign,
    );
  }
}
