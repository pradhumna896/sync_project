import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/otp_screen.dart';

import '../components/custom_text.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(128),
            CustomText(
                title: "My mobile",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 34),
            CustomText(
                title:
                    "Please enter your valid phone number. We will send you a 4-digit code to verify your account. ",
                fontWeight: FontWeight.w400,
                color: kBlackColor,
                fontSize: 14),
            Gap(32),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Gap(64),
            CustomButton(
                title: "Continue",
                onclick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
