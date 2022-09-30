import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/widget/custom_appbar_title.dart';

class PushNotificationScreen extends StatelessWidget {
  const PushNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
        backgroundColor: Colors.white,
        title: CustomAppbarTitle(title: "Push Notifications"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Gap(20),
          ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (BuildContext contex, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                title: "New Matches",
                                fontWeight: FontWeight.w600,
                                color: kBlackColor,
                                fontSize: 16),
                            CustomText(
                                title: "You just got a new match",
                                fontWeight: FontWeight.w400,
                                color: kBlackColor,
                                fontSize: 14),
                          ],
                        ),
                        Switch(
                          
                            activeColor: kPrimaryColor,
                            value: true, onChanged: (value){})
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
