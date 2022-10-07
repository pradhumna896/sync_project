import 'package:flutter/material.dart';

import '../helper/constants.dart';

class CustomEditText extends StatelessWidget {
  const CustomEditText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: TextFormField(
        textInputAction: TextInputAction.next,

        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: "Sk-Modernist",
            color: kBlackColor),
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(

          filled: true,
            fillColor: Colors.grey.shade200,
            disabledBorder:OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ) ,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ) ,

            labelStyle: TextStyle(
                fontSize: 20,
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
