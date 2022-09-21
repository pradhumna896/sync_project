import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:syncdating/screens/change_number_screen.dart';
import 'package:syncdating/screens/invite_screen.dart';
import 'package:syncdating/screens/privacy_policy.dart';
import 'package:syncdating/screens/subscription_screen.dart';

class UserProfileDetailsModal {
  String icon;
  String title;
  Widget? page;

  UserProfileDetailsModal(
      {required this.title, required this.icon, required this.page});

  static List<UserProfileDetailsModal> userProfileDetailsList = [
    UserProfileDetailsModal(
        title: "Subscription",
        icon: "assets/svg/subscription.svg",
        page: SubscriptionScreen()),
    UserProfileDetailsModal(
        title: "About Me",
        icon: "assets/svg/info.svg",
        page: Container()),
    UserProfileDetailsModal(
        title: "Invite Friends And Share",
        icon: "assets/svg/share.svg",
        page: InviteScreen()),
    UserProfileDetailsModal(
        title: "Privacy Policy",
        icon: "assets/svg/lock.svg",
        page: PrivacyPolicy()),
    UserProfileDetailsModal(
        title: "Change Number",
        icon: "assets/svg/mobile.svg",
        page: ChangeNumberScreen()),
  ];
}
