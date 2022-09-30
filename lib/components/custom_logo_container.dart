import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';

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
        height: Dimentions.height44,
        width: Dimentions.width44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),

        child: Center(child: SvgPicture.asset(image),),),
    );
  }
}