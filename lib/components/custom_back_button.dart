import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';

class CustomBackButoon extends StatelessWidget {
  VoidCallback onclick;
  Color iconColor;
  CustomBackButoon({
    Key? key,required this.onclick, this.iconColor =kPrimaryColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onclick,
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: kgreyColor)),
        child: Center(child: Icon(Icons.arrow_back_ios,color: iconColor,size: 18,)),
      ),
    );
  }
}