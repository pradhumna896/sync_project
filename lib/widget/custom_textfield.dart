import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';
import '../helper/dimentions/dimentions.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType keybordType;
  CustomTextField({required this.label,required this.keybordType,required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: Dimentions.height44,
      child: TextFormField(
        controller: controller,

        keyboardType: keybordType,
        style: TextStyle(
            fontSize: height*0.020,
            fontWeight: FontWeight.w400,
            fontFamily: "Sk-Modernist",
            color: kBlackColor),
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: label,
            labelStyle: TextStyle(
                fontSize: height*0.020,
                fontWeight: FontWeight.w400,
                fontFamily: "Sk-Modernist",
                color: kBlackColor),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: kgreyColor),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}