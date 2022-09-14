import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/otp_screen.dart';

import '../components/custom_text.dart';

class MobileNumberScreen extends StatelessWidget {
MobileNumberScreen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final phoneControlller = TextEditingController();
bool isValidPhoneNumber(String? value) =>
    RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)').hasMatch(value ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                  controller: phoneControlller,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Gap(64),
                CustomButton(
                    title: "Continue",
                    onclick: () {

                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>OtpScreen()));



                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
void toastMassege(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
}
