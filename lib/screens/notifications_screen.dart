import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/screens/home_screen.dart';
import 'package:syncdating/screens/welcom_screen.dart';

import '../components/custom_button.dart';
import '../components/custom_skip_button.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomSkipButton(
                    onclick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => HomeScreen()));
                    },
                  )
                ],
              ),
              Gap(40),
              Image.asset("assets/images/chat.png"),
              Gap(50),
              CustomText(
                  title: "Enable notification’s",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 24),
              Gap(10),
              CustomText(
                  title:
                  "Get push-notification when you get the match or receive a message.",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color: kBlackColor,
                  fontSize: 14),
              Spacer(),
              CustomButton(
                  title: "I want to be notified",
                  onclick: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationOptions();
                        });
                  }),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }


}
enum SingingCharacter { lafayette, jefferson }

class NotificationOptions extends StatefulWidget {
  NotificationOptions({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationOptions> createState() => _NotificationOptionsState();
}

class _NotificationOptionsState extends State<NotificationOptions> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  List notification = ["New Matches", "Receive Messages", "Like & Super Like"];
  bool isSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(


            children: [
            Gap(20),
        Column(
          children: List.generate(
            notification.length,
                (index) =>
                ListTile(
                    title: CustomText(title: notification[index],
                      color: kBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,),
                    trailing: Switch(
                        activeColor: kPrimaryColor,
                        value:isSwitch, onChanged: (value) {
                          setState((){
                            isSwitch=!isSwitch;
                          });
                }),
          ),),
      ),
      Spacer(),
      CustomButton(
          onclick: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => WelcomeScreen()));
          },
          title: "Continue"),
      Gap(30)
      ],
    ),)
    ,
    );
  }
}
