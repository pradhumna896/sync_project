import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_skip_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

import 'friends_screen.dart';

class PassionsScreen extends StatelessWidget {
  const PassionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButoon(onclick: () {}),
                  CustomSkipButton(onclick: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (builder) => FriendsScreen()));
                  },)
                ],
              ),
              Gap(30),
              CustomText(
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                title: 'Your interests',
                fontSize: 34,
              ),
              CustomText(
                fontWeight: FontWeight.w400,
                color: kBlackColor,
                title:
                'Select a few of your interests and let everyone know what you’re passionate about.',
                fontSize: 14,
              ),
              Gap(30),
              Expanded(
                child: GridView.builder(
                    itemCount: 100, shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 2,
                        mainAxisExtent: 45),
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset("assets/svg/camera2.svg"),
                              CustomText(title: "Photography",
                                  fontWeight: FontWeight.w400,
                                  color: kBlackColor,
                                  fontSize: 14)
                            ],),
                        ),
                      );
                    }),
              ),
              Gap(10),
              CustomButton(title: "Continue", onclick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => FriendsScreen()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
