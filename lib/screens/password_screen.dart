import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/screens/home_screen.dart';
import 'package:syncdating/screens/my_gmail_screen.dart';
import 'package:syncdating/widget/custom_textfield.dart';

import '../components/custom_button.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import 'gmail_new_user_screen.dart';
import 'otp_screen.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formkey,
          child:Column(children: [
            Expanded(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(128),
                  CustomText(
                      title: "Email",
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                      fontSize: 34),
                  CustomText(
                      title:
                      "Please enter your valid email. We will send you a 4-digit code to verify your account. ",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                  Gap(10),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Gap(5),

                  Gap(50),

                ],
              ),
            ),
            CustomButton(
                title: "Continue",
                onclick: () {
                  Navigator.push(
                      context,
                  MaterialPageRoute(
                  builder: (context) => MyGmailScreen()));
                }),
            Gap(40)
          ],),
        ),
      ),
    );
  }
}
