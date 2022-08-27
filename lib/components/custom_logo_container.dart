import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncdating/helper/constants.dart';

class CustomLogoContainer extends StatelessWidget {
  VoidCallback onclick;
  String image;
   CustomLogoContainer({
    Key? key,required this.image, required this.onclick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(border: Border.all(color: kgreyColor),
            borderRadius: BorderRadius.circular(15)),

        child: Center(child: SvgPicture.asset(image),),),
    );
  }
}