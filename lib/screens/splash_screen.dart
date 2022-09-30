import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncdating/Screens/on_board_screen.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';

import 'onboard_screen_second.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds:3 ), () {
      Navigator.push(context, MaterialPageRoute(builder: (builder)=> OnboardScreenSecond()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage("assets/images/synclogo.png",),height: MediaQuery.of(context).size.height*0.4,
          width: MediaQuery.of(context).size.width*0.4,)
      ),
    );
  }
}
