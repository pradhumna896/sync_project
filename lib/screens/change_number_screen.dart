import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/widget/custom_textfield.dart';

class AccountRecoveryScreen extends StatelessWidget {
  const AccountRecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
        title: CustomText(
            color: kBlackColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            title: "Account Recovery"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Gap(height * 0.1),
              Image.asset(
                "assets/images/synclogo.png",
                height: height * 0.12,
                width: height * 0.12,
              ),
              Gap(20),
              CustomText(
                  title:
                      "Change your phone Number, or lost access to your Facebook Account? we can help you login with your email. ",
                  fontWeight: FontWeight.w400,
                  color: kBlackColor,
                  fontSize: 14,textAlign: TextAlign.center,),
              Gap(40),
              CustomButton(title: "Login with Email", onclick: () {}),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
