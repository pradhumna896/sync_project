import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:syncdating/screens/change_number_screen.dart';
import 'package:syncdating/screens/invite_screen.dart';
import 'package:syncdating/screens/privacy_policy.dart';
import 'package:syncdating/screens/settings_screen.dart';
import 'package:syncdating/screens/subscription_screen.dart';
import 'package:syncdating/screens/vip_screen.dart';

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
        page: const SubscriptionScreen()),
    UserProfileDetailsModal(
        title: "VIP",
        icon: "assets/svg/workspace_premium_FILL0_wght400_GRAD0_opsz48.svg",
        page: const VipScreens()),
    // UserProfileDetailsModal(
    //     title: "About Me", icon: "assets/svg/info.svg", page: Container()),
    UserProfileDetailsModal(
        title: "Invite Friends And Share",
        icon: "assets/svg/share.svg",
        page: const InviteScreen()),
    // UserProfileDetailsModal(
    //     title: "Privacy Policy",
    //     icon: "assets/svg/lock.svg",
    //     page: const PrivacyPolicy()),
    // UserProfileDetailsModal(
    //     title: "Account Recovery",
    //     icon: "assets/svg/mobile.svg",
    //     page: const AccountRecoveryScreen()),
    UserProfileDetailsModal(
        title: "Settings",
        icon: "assets/svg/settings.svg",
        page: SettingsScreen())
  ];
}
