import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/profile_modal.dart';

import '../components/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [CustomBackButoon(onclick: () {})],
            ),
            Gap(30),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(1),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/photo6.png"),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                    right: 5,
                    bottom: 2,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kPrimaryColor),
                          child: Icon(Icons.edit)),
                    ))
              ],
            ),
            Gap(5),
            CustomText(
                title: "Jessica Parker",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 24),
            CustomText(
                title: "Professional model",
                fontWeight: FontWeight.w400,
                color: kBlackColor,
                fontSize: 14),
            Gap(30),
            Column(
              children: List.generate(
                  ProfileModal.profileModalList.length,
                  (index) => Column(
                    children: [
                      Row(
                            children: [
                              SvgPicture.asset(ProfileModal.profileModalList[index].image),
                              Gap(10),
                              CustomText(title: ProfileModal.profileModalList[index].title, fontWeight: FontWeight.w700, color: kBlackColor, fontSize: 16)
                            ],
                          ),
                      Gap(5),
                      Divider(thickness: 1,)
                    ],
                  )),
            ),
            Row(children: [
              SvgPicture.asset("assets/svg/logout.svg"),
              Gap(10),
              CustomText(title: "Logout", fontWeight: FontWeight.w600, color: Color.fromRGBO(0, 0, 0, 0.4), fontSize: 16)
            ],)
          ],
        ),
      ),
    );
  }
}
