import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/custom_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import 'otp_screen.dart';

class MyGmailScreen extends StatelessWidget {
   MyGmailScreen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formkey,
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
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                return value!.contains('@') && value.length>=6? null:"Please Enter A Valid Email";
                },
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              Gap(64),
              CustomButton(
                  title: "Continue",
                  onclick: () {
                    if(_formkey.currentState!.validate()){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
