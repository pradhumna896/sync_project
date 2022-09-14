import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncdating/helper/constants.dart';

class CustomLogoContainer extends StatelessWidget {
  VoidCallback onclick;
  String image;
   CustomLogoContainer({
    Key? key,required this.image, required this.onclick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onclick,
      child: Container(
        height: height*0.084,
        width: height*0.084,
        decoration: BoxDecoration(border: Border.all(color: kgreyColor),
            borderRadius: BorderRadius.circular(15)),

        child: Center(child: SvgPicture.asset(image),),),
    );
  }
}