import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/widget/custom_textfield.dart';

import '../components/custom_logo_container.dart';
import 'mobile_number_screen.dart';
import 'my_gmail_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/synclogo.png",
                  height: 100,
                  width: 100,
                ),
                Gap(20),
                CustomText(
                    title: "Login",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 24),
                CustomText(
                    title: "Login to continue",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 16),
                Gap(20),
                CustomButton(
                    title: "Continue with email", onclick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGmailScreen()));
                }),
                SizedBox(
                  height:20,
                ),
                CustomButton(
                    titleColor: kPrimaryColor,
                    buttonColor: Colors.white,
                    borderColor: kgreyColor,
                    title: "Use phone number",
                    onclick: () {Navigator.push(context, MaterialPageRoute(builder: (builder)=>MobileNumberScreen()));}),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          title: "Forgot Password ?",
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),

                Gap(20),
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
                          title: "Or Login With",
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
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomLogoContainer(
                      image: 'assets/svg/facebook.svg',
                      onclick: () {},
                    ),
                    Gap(20),
                    CustomLogoContainer(
                      image: 'assets/svg/google.svg',
                      onclick: () {},
                    ),
                    Gap(20),
                    CustomLogoContainer(
                      image: 'assets/svg/apple.svg',
                      onclick: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
