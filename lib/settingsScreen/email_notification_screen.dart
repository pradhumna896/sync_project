import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/widget/custom_appbar_title.dart';

class EmailNotificationScreen extends StatelessWidget {
  const EmailNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const CustomAppbarTitle(title: "Email"),
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(Dimentions.height20),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:Dimentions.width15 ),
            child: CustomText(
                title:
                    "Control the emails you want to get - all of them ,just the important stuff or the bare minimum. You can always unsubscribe from the bottom of any email",
                fontWeight: FontWeight.w400,
                color: kBlackColor,
                fontSize: Dimentions.font14),
          ),
          Gap(Dimentions.height20),
          Container(
            height: 45,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Example@gmail.com",
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                 disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                filled: true,
                focusColor: Colors.white,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                )
              ),
            ),
          ),
          Gap(Dimentions.height10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomText(title: "Verified Email Address", fontWeight: FontWeight.w400 , color: Colors.blueAccent ,
                fontSize: Dimentions.font14),
          )
        ],
      ),
    );
  }
}
