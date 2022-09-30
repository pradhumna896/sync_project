import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/screens/home_screen.dart';
import 'package:syncdating/screens/password_screen.dart';
import 'package:syncdating/screens/profile_details_screen.dart';
import 'package:syncdating/widget/custom_textfield.dart';

import '../components/custom_back_button.dart';
import '../components/custom_button.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import 'gmail_new_user_screen.dart';
import 'otp_screen.dart';

class MyGmailScreen extends StatefulWidget {
  MyGmailScreen({Key? key}) : super(key: key);

  @override
  State<MyGmailScreen> createState() => _MyGmailScreenState();
}

class _MyGmailScreenState extends State<MyGmailScreen> {
  final _formkey = GlobalKey<FormState>();

  var email;
  var isNotExsit;

  var isEmail = "pradhumna@gmail.com";
  var isNot = "@";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:Dimentions.width40 ),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Gap(Dimentions.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButoon(onclick: () {
                      Navigator.pop(context);
                    }),
                  ],
                ),

                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(Dimentions.height120),
                      CustomText(
                          title: "My email",
                          fontWeight: FontWeight.w700,
                          color: kBlackColor,
                          fontSize: Dimentions.font34),
                      CustomText(
                          title:
                              "Please enter your valid email. We will send you a 4-digit code to verify your account. ",
                          fontWeight: FontWeight.w400,
                          color: kBlackColor,
                          fontSize: Dimentions.font14),
                      Gap(Dimentions.height33),
                      TextFormField(
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {
                          setState(() {
                            email = value;
                            isNot = value;
                          });
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return value!.contains('@') && value.length >= 6
                              ? null
                              : "Please Enter A Valid Email";
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                      Gap(Dimentions.height10),
                      Visibility(
                        visible: email == isEmail ? true : false,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => PasswordScreen()));
                                    },
                                    child: CustomText(
                                        title: "Forgot Password ?",
                                        fontWeight: FontWeight.w700,
                                        color: kPrimaryColor,
                                        fontSize: Dimentions.font16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible:
                              isNot != isEmail && isNot != "@" ? true : false,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15))),
                              ),
                              Gap(Dimentions.height10),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    hintText: "Re-Enter Password",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15))),
                              ),
                            ],
                          )),

                    ],
                  ),
                )),
                CustomButton(
                    title: "Continue",
                    onclick: () {
                      print(email);
                      if (isEmail == email) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileDetailsScreen()));
                      }
                    }),
                Gap(Dimentions.height39)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
