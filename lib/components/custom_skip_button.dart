import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'custom_text.dart';

class CustomSkipButton extends StatelessWidget {
  VoidCallback onclick;
  CustomSkipButton({ required this.onclick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onclick,
        child: CustomText(
          title: "Skip",
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor,
        ));
  }
}