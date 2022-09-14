import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/profile_details_screen.dart';

import '../components/custom_back_button.dart';
import '../components/custom_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 44),
        child: Column(
          children: [
            Row(
              children: [
                CustomBackButoon(
                  onclick: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            Gap(32),
            Expanded(child: SingleChildScrollView(
              child: Column(children: [
                CustomText(
                    title: "00:42",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 34),
                Gap(8),
                CustomText(
                    title: "Type the verification code we’ve sent you",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 18,
                    textAlign: TextAlign.center),
                Gap(48),
                OtpTextField(
                  // fillColor: kPrimaryColor,
                  // filled: true,
                  autoFocus: true,

                  onSubmit: (val){
                    if(val.length==4){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetailsScreen()));
                    }
                  },

                  borderColor: kgreyColor,
                  borderRadius: BorderRadius.circular(15),
                  showFieldAsBox: true,
                  fieldWidth: 60,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(15)),
                      hintText: "0",
                      hintStyle: TextStyle(color: kgreyColor),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(15))),
                ),
                Gap(20),
                TextButton(
                    onPressed: () {
                      toastMessage(" We have sent you OTP again on your registered number");
                    },
                    child: CustomText(
                      title: "Send again",
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ))
              ],),
            ))
          ],
        ),
      ),
    );
  }
  void toastMessage(message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
