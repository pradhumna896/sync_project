import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';

import '../helper/constants.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
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
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(

        style: ElevatedButton.styleFrom(

            minimumSize: Size(double.maxFinite, Dimentions.height44),primary: buttonColor,
            shape: RoundedRectangleBorder(side: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(8))),
        onPressed: onclick,
        child: CustomText(
          title: title,
          fontSize: height*0.020,
          color: titleColor,
          fontWeight: FontWeight.w700,
        ));
  }
}