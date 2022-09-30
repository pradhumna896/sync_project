import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';

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

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
           ),
        child: Center(child: Icon(Icons.arrow_back_ios,color: iconColor,size: Dimentions.size18,)),
      ),
    );
  }
}