import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../helper/constants.dart';
import '../provider/app_controller.dart';

class HomeBottomNavigation extends StatelessWidget {
  final ValueChanged<int> onTap;

  const HomeBottomNavigation({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return BottomNavigationBar(
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                data.bottomNavIndex == 0
                    ? "assets/svg/cards.svg"
                    : "assets/svg/cardsgrey.svg",
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                data.bottomNavIndex == 1
                    ? "assets/svg/matchicon_red.svg"
                    : "assets/svg/matchesicon.svg",
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                data.bottomNavIndex == 2
                    ? "assets/svg/message_red.svg"
                    : "assets/svg/message.svg",
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/profileicon.svg",
                color:
                data.bottomNavIndex == 3 ? kPrimaryColor : Colors.black26,
              ),
              label: ""),
        ]);
  }
}