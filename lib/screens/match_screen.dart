import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Center(
        child: Column(

          children: [
            Gap(height*0.10),
            Expanded(

                child: Image.asset("assets/images/matchPhoto.png",)),
            Expanded(

                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    title: "It’s a match, Jake!",
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                    fontSize:34),
                CustomText(
                    title: "Start a conversation now with each other",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize:14),
                Gap(height*0.083),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(title: "Say hello", onclick: (){}),
                ),
                Gap(height*0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(titleColor: kPrimaryColor,borderColor: Color(0xffFDECEE),buttonColor: Color(0xffFDECEE),title: "Keep swiping", onclick: (){}),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
