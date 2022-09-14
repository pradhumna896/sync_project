import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/widget/custom_textfield.dart';

import '../components/custom_logo_container.dart';

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
                    fontSize: 34),
                CustomText(
                    title: "Login to see who's new in your area",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 16),
                Gap(20),
                CustomTextField(label: "UserName", keybordType: TextInputType.name,),
                Gap(10),
                CustomTextField(label: "Password", keybordType: TextInputType.visiblePassword,),
                Gap(10),
                TextButton(
                    onPressed: () {},
                    child: CustomText(
                      title: "Forgot Password ?",
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    )),
                CustomButton(title: "Login", onclick: () {}),
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
