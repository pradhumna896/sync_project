import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/user_profile_detals_modal.dart';
import 'package:syncdating/screens/change_number_screen.dart';
import 'package:syncdating/screens/multi_image_picker_screen.dart';
import 'package:syncdating/screens/notification_screen_first.dart';
import 'package:syncdating/screens/notifications_screen.dart';
import 'package:syncdating/screens/privacy_policy.dart';

import '../screens/invite_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: CustomText(
                  title: "Profile",
                  color: kBlackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
              actions: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (CTX) => NotificationScreenFirst()));
                },
                  child: Icon(
                    Icons.notifications,
                    color: kBlackColor,
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                )
              ],
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              color: kPrimaryColor,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                          Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  title: "Naman, 28",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 18),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                  CustomText(
                                      title: "Bhopal, India",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                Gap(5),
                                CustomText(
                                    title: "View",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 14)
                              ],
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(5),
                          //   decoration: BoxDecoration(
                          //       color: Colors.red.shade300, shape: BoxShape.circle),
                          //   child: Icon(
                          //     Icons.settings,
                          //     color: Colors.white,
                          //     size: 35,
                          //   ),
                          // ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (ctx) => MultiImagePickerScreen()));
                            },
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: kPrimaryColor,
                                    size: 14,
                                  ),
                                  Gap(5),
                                  CustomText(
                                      title: "Edit",
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryColor,
                                      fontSize: 14)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Gap(50),
            Card(

              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Column(
                  children: List.generate(
                      UserProfileDetailsModal.userProfileDetailsList.length,
                          (index) =>
                          Container(
                            child: Column(children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (ctx) =>
                                      UserProfileDetailsModal
                                          .userProfileDetailsList[index].page!));
                                },
                                child: Row(children: [
                                  SvgPicture.asset(UserProfileDetailsModal
                                      .userProfileDetailsList[index].icon,
                                    height: 18, width: 18,),
                                  Gap(10),

                                  CustomText(title: UserProfileDetailsModal
                                      .userProfileDetailsList[index].title,
                                      fontWeight: FontWeight.w600,
                                      color: kBlackColor,
                                      fontSize: 18)
                                ],),
                              ),
                              Gap(5),
                              Divider(color: Colors.grey.shade300,)
                            ],),
                          )
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: kBlackColor,
                    ),
                    Gap(10),
                    CustomText(
                        title: "Sign Out",
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                        fontSize: 18),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: kBlackColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
