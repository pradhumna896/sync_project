import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/screens/profile_details_screen.dart';
import 'package:syncdating/screens/profile_screen.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';

class GmailNewUserScreen extends StatelessWidget {
  const GmailNewUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(128),
                CustomText(
                    title: "My email",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 34),
                CustomText(
                    title:
                    "Please enter your valid email. We will send you a 4-digit code to verify your account. ",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
                Gap(32),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    return value!.contains('@') && value.length>=6? null:"Please Enter A Valid Email";
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Gap(10),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,

                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Gap(10),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,

                  decoration: InputDecoration(
                      hintText: "Re-Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),



                Gap(50),
                CustomButton(
                    title: "Continue",
                    onclick: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProfileDetailsScreen(email: "email",)));


                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
