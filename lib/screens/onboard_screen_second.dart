import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_skip_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/widget/home_slider.dart';

import '../helper/dimentions/dimentions.dart';
import '../model/onboard_second_screen_model.dart';
import '../provider/app_controller.dart';
import 'new_login_screen.dart';

class OnboardScreenSecond extends StatelessWidget {
  OnboardScreenSecond({Key? key}) : super(key: key);

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButoon(onclick: () {}),
                  CustomSkipButton(onclick: () {})
                ],
              ),
            ),
            Gap(10),
            Expanded(
              child: PageView.builder(
                  itemCount:
                      OnboardSecondScreenModel.onboardSecondScreenList.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    data.homeSliderIndexStatus(index);
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomText(textAlign: TextAlign.start,
                              title: OnboardSecondScreenModel
                                  .onboardSecondScreenList[index].title,
                              fontWeight: FontWeight.w500,
                              color: kBlackColor,
                              fontSize: 34),
                        ),
                        Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomText(
                              title: OnboardSecondScreenModel
                                  .onboardSecondScreenList[index].subTitle,
                              fontWeight: FontWeight.w400,
                              color: kBlackColor,
                              fontSize: 24),
                        ),
                        Gap(20),
                        SvgPicture.asset(OnboardSecondScreenModel
                            .onboardSecondScreenList[index].image)
                      ],
                    );
                  }),
            ),
            HomeSlider(),
            Gap(20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 44,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            if(data.homeSliderIndex==OnboardSecondScreenModel.onboardSecondScreenList.length-1){
                              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NewLoginScreen()));
                            }else{
                              pageController.animateToPage(pageController.page!.toInt()+1, duration: Duration(seconds: 1),
                                  curve: Curves.ease);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: CustomText(
                              title: "Next",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    )
                  ],
                )),
            Gap(40)
          ],
        ),
      ),
    );
  }
}
