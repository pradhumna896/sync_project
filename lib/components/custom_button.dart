import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  String title;
  VoidCallback onclick;

  Color borderColor;
  Color buttonColor;
  Color titleColor;

   CustomButton({
    Key? key,
     this.titleColor = Colors.white,
     this.buttonColor = kPrimaryColor,
     this.borderColor = kPrimaryColor,
     required this.title,
     required this.onclick,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        style: ElevatedButton.styleFrom(
            maximumSize: Size(double.maxFinite, MediaQuery.of(context).size.height*0.060),
            minimumSize: Size(double.maxFinite, MediaQuery.of(context).size.height*0.060),
            primary: buttonColor,
            shape: RoundedRectangleBorder(side: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(15))),
        onPressed: onclick,
        child: CustomText(
          title: title,
          fontSize: 16,
          color: titleColor,
          fontWeight: FontWeight.w700,
        ));
  }
}