import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/lookingforimage.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  title: "welcome to",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 34),
              CustomText(
                  title: "Sync Dating",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 34),
              Gap(10),
              CustomText(
                  title:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 14),
              Gap(30),
              ElevatedButton(



                  style: ElevatedButton.styleFrom(
                    onPrimary: kPrimaryColor,



                    minimumSize: Size(100, 40),
                      primary: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => HomeScreen()));
                  },
                  child: CustomText(
                      title: "let’s start",
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                      fontSize: 14)),
              Gap(60),
            ],
          ),
        ),
      ),
    ));
  }
}
