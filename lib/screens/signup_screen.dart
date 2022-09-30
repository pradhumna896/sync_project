import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/mobile_number_screen.dart';
import 'package:syncdating/screens/my_gmail_screen.dart';

import '../components/custom_logo_container.dart';
import '../components/custom_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(50),
                    Image.asset(
                      "assets/images/synclogo.png",
                      height: height*0.12,
                      width: height*0.12,
                    ),
                    Gap(height*0.060),
                    CustomText(
                        title: "Sign up to continue",
                        fontWeight: FontWeight.w700,
                        color: kBlackColor,
                        fontSize: 18),
                    Gap(height*0.032),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomButton(
                          title: "Continue with email", onclick: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGmailScreen()));
                      }),
                    ),
                    SizedBox(
                      height:height*0.020,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomButton(
                          titleColor: kPrimaryColor,
                          buttonColor: Colors.white,
                          borderColor: kgreyColor,
                          title: "Use phone number",
                          onclick: () {Navigator.push(context, MaterialPageRoute(builder: (builder)=>MobileNumberScreen()));}),
                    ),
                    SizedBox(
                      height: height*0.050,
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Divider(
                                
                            height: 0.5,
                            color: Colors.grey,
                          )),
                          Gap(10),
                          CustomText(
                              title: "or sign up with",
                              fontWeight: FontWeight.w400,
                              color: kBlackColor,
                              fontSize: 12),
                          Gap(10),
                          Expanded(
                              child: const Divider(
                            height: 0.5,
                            color: Colors.grey,
                          ))
                        ],
                      ),
                    ),
                    Gap(height*0.050),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                           CustomLogoContainer(
                            image: 'assets/svg/facebook.svg', onclick: () {  },
                        ),
                        Gap(20),
                        CustomLogoContainer(
                          image: 'assets/svg/google.svg', onclick: () {  },
                        ),
                        Gap(20),
                        CustomLogoContainer(
                          image: 'assets/svg/apple.svg', onclick: () {  },
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child: CustomText(
                            title: "Terms of use",
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                            fontSize: height*0.018)),
                        Gap(20),
                        TextButton(
                            onPressed: (){}, child: CustomText(
                            title: "Privacy Policy",
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                            fontSize:height*0.018))
                      ],
                    ),
                    Gap(height*0.048)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
