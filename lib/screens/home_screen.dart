import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/fragments/main_screen.dart';
import 'package:syncdating/fragments/masseges_screen.dart';
import 'package:syncdating/fragments/matches_screen.dart';
import 'package:syncdating/fragments/profile_page.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/provider/app_controller.dart';
import 'package:syncdating/screens/profile_details_screen.dart';

import '../widget/home_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Widget> widgetList = [MainScreen(),MatchesScreen(),MassegesScreen(),ProfileDetailsScreen()];

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:
        const EdgeInsets.symmetric(
            horizontal: 0,vertical: 0),
        child: widgetList[data.bottomNavIndex],
      )),
      bottomNavigationBar: HomeBottomNavigation(
        onTap: (int value) {
          data.bottomNavStatus(value);
        },
      ),
    );
  }
}
