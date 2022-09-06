import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/notifications_screen.dart';

import '../components/custom_skip_button.dart';
import '../components/custom_text.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

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
                children: [CustomSkipButton(onclick: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (builder) => NotificationScreen()));
                },)
                ],
              ),
              Gap(40),
              Image.asset("assets/images/people.png"),
              Gap(50),
              CustomText(
                  title: "Search friend’s",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 24),
              Gap(10),
              CustomText(
                  title:
                  "You can find friends from your contact liststo connected",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color: kBlackColor,
                  fontSize: 14),
              Spacer(),
              CustomButton(title: " Invite friends and Share", onclick: (){}),
              Gap(20),

              CustomButton(title: "Access to a contact list", onclick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => NotificationScreen()));
              }),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
