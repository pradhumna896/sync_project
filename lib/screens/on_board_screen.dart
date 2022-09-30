import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/onboard_model.dart';
import 'package:syncdating/screens/login_screen.dart';
import 'package:syncdating/screens/my_gmail_screen.dart';
import 'package:syncdating/screens/signup_screen.dart';
import 'package:syncdating/widget/home_slider.dart';

import '../components/custom_button.dart';
import '../components/custom_logo_container.dart';
import '../components/custom_text.dart';
import '../helper/style.dart';
import '../provider/app_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.7),
                    onPageChanged: (index){
                      data.homeSliderIndexStatus(index);
                    },
                    itemCount: OnBoardModal.onBoardModalList.length,
                    itemBuilder: (BuildContext contex, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: height*0.040,),
                            Image.asset(
                                OnBoardModal.onBoardModalList[index].image,),
                            SizedBox(height: height*0.012,),
                            CustomText(
                                title: OnBoardModal.onBoardModalList[index].title,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                                fontSize: height*0.030),

                            CustomText(textAlign: TextAlign.center,title: OnBoardModal.onBoardModalList[index].subTitle, fontWeight: FontWeight.w400,
                                color: kSecondaryColor,
                                fontSize: height*0.018)
                          ],
                        ),
                      );
                    })),
            HomeSlider(),
            Gap(30),
            CustomText(title: "Sign In With", fontWeight: FontWeight.w700, color: kBlackColor, fontSize: 18),
            Gap(10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gap(5),

                  CustomLogoContainer(
                    image: 'assets/svg/facebook.svg', onclick: () {  },
                  ),
                  Gap(20),
                  CustomLogoContainer(
                    image: 'assets/svg/google.svg', onclick: () {  },
                  ),
                  Gap(20),
                  CustomLogoContainer(
                    image: 'assets/svg/apple.svg', onclick: () {  },
                  ),
                  Gap(5)
                ],
              ),
            ),
             Gap(10),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(onclick: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGmailScreen()));
              }, title: 'Or Email',),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: CustomText(
                    title: "Terms of use",
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                    fontSize: height*0.018)),
                Gap(20),
                TextButton(
                    onPressed: (){}, child: CustomText(
                    title: "Privacy Policy",
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                    fontSize:height*0.018))
              ],
            ),
            Gap(20)
          ],
        ),
      ),
    );
  }
}
