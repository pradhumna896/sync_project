import 'dart:convert';
import 'dart:math';

import 'package:expandable_slider/expandable_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/api_network.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/sessionmanager.dart';
import 'package:syncdating/model/privacy_policy_model.dart';
import 'package:syncdating/screens/onboard_screen_second.dart';
import 'package:syncdating/screens/privacy_policy.dart';
import 'package:syncdating/settingsScreen/email_notification_screen.dart';
import 'package:syncdating/settingsScreen/push_notification.dart';
import 'package:syncdating/settingsScreen/show_me_screen.dart';
import 'package:syncdating/settingsScreen/term_Condition_screen.dart';
import 'package:syncdating/settingsScreen/username_screen.dart';

import '../settingsScreen/payment_history.dart';
import '../widget/custom_appbar_title.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitch = false;
  RangeValues currentRangeValues = const RangeValues(21, 45);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
        title: CustomAppbarTitle(
          title: "Settings",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showMe(context),
              const Gap(10),
              ageRange(context),
              const Gap(10),
              webProfile(context),
              const Gap(10),
              CustomText(
                  title: "App Settings",
                  fontWeight: FontWeight.w800,
                  color: Colors.black54,
                  fontSize: 20),
              appNotification(context),
              const Gap(10),
              payment(),
              const Gap(10),
              privacyPolicy(context),
              const Gap(10),
              const Gap(10),
              deleteAccount(),
              legalWidget(context),
              const Gap(10),
              logout(),
            ],
          ),
        ),
      ),
    );
  }

  Card deleteAccount() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                title: "Delete Account",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 18),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: ChooseDeleteAcount(),
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: "If away for",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                  CustomText(
                      title: "3 Month",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell logout() {
    return InkWell(
      onTap: (){
        SessionManager.logout();
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=>OnboardScreenSecond()), (
            route) => false);

      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
              const Gap(5),
              CustomText(
                  title: "Logout",
                  fontWeight: FontWeight.w800,
                  color: kBlackColor,
                  fontSize: 20),
            ],
          ),
        ),
      ),
    );
  }

  InkWell legalWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => TermConditionScreen()));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                      title: "Legal",
                      fontWeight: FontWeight.w800,
                      color: kBlackColor,
                      fontSize: 18),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: "Terms & Conditions",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                  Gap(5),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Card privacyPolicy(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                    title: "Privacy",
                    fontWeight: FontWeight.w800,
                    color: kBlackColor,
                    fontSize: 18),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PrivacyPolicy()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: "Privacy Policy",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                  const Gap(5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Card payment() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                    title: "Payment",
                    fontWeight: FontWeight.w800,
                    color: kBlackColor,
                    fontSize: 18),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentHistory()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: "Payment History",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                  Gap(5),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Card appNotification(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: "Notification",
                    fontWeight: FontWeight.w800,
                    color: kBlackColor,
                    fontSize: 18),
              ],
            ),
            Gap(5),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EmailNotificationScreen()));
              },
              child: Row(
                children: [
                  CustomText(
                      title: "Email",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                ],
              ),
            ),
            const Gap(5),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => PushNotificationScreen()));
              },
              child: Row(
                children: [
                  CustomText(
                      title: "Push Notification",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell webProfile(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => UserNameScreen()));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: "Web Profile",
                      fontWeight: FontWeight.w800,
                      color: kBlackColor,
                      fontSize: 18),
                ],
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: "Username",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                  CustomText(
                      title: "Naman",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Card ageRange(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: "Age Range",
                    fontWeight: FontWeight.w800,
                    color: kBlackColor,
                    fontSize: 18),
                CustomText(
                    title:
                        "${currentRangeValues.start.toInt()}-${currentRangeValues.end.toInt()}",
                    fontWeight: FontWeight.w800,
                    color: kBlackColor,
                    fontSize: 18),
              ],
            ),
            Gap(5),
            SizedBox(
              height: 20,
              child: RangeSlider(
                onChanged: (RangeValues values) {
                  print(
                      "START: ${currentRangeValues.start.toInt()}, End: ${currentRangeValues.end.toInt()}");
                  setState(() {
                    currentRangeValues = values;
                  });
                },
                labels: RangeLabels(
                  currentRangeValues.start.round().toString(),
                  currentRangeValues.end.round().toString(),
                ),
                values: currentRangeValues,
                max: 70,
                min: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: "Only show people in this range",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
                Switch(
                    activeColor: kPrimaryColor,
                    value: isSwitch,
                    onChanged: (value) {
                      setState(() {
                        isSwitch = !isSwitch;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell showMe(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ShoweMeScreen()));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                      title: "Show Me",
                      fontWeight: FontWeight.w800,
                      color: kBlackColor,
                      fontSize: 18),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: "Female",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseDeleteAcount extends StatelessWidget {
  const ChooseDeleteAcount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
                title: "Self-Destruct if inactive for...",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 18),
            Column(
                children: List.generate(
                    4,
                    (index) => InkWell(
                      onTap: (){},
                      child: Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: true,
                                  onChanged: (value) {}),
                              CustomText(
                                  title: "1 Month",
                                  fontWeight: FontWeight.w500,
                                  color: kBlackColor,
                                  fontSize: 16)
                            ],
                          ),
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {Navigator.pop(context);},
                    child: CustomText(
                      title: "Cancel",
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
