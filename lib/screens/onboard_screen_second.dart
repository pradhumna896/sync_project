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
import 'my_gmail_screen.dart';
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
              padding: EdgeInsets.symmetric(horizontal: Dimentions.width40, vertical:Dimentions.height20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButoon(onclick: () {
                    if(data.homeSliderIndex<0){

    pageController.animateToPage(pageController.page!.toInt()-1, duration: Duration(seconds: 1),
    curve: Curves.ease);


                    }
                  }),
                  CustomSkipButton(onclick: () {if(data.homeSliderIndex>0){

                    pageController.animateToPage(pageController.page!.toInt()+1, duration: Duration(seconds: 1),
                        curve: Curves.ease);


                  }})
                ],
              ),
            ),
            Gap(Dimentions.height10),
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
                          padding:  EdgeInsets.symmetric(horizontal: Dimentions.width20),
                          child: CustomText(textAlign: TextAlign.start,
                              title: OnboardSecondScreenModel
                                  .onboardSecondScreenList[index].title,
                              fontWeight: FontWeight.w500,
                              color: kBlackColor,
                              fontSize: Dimentions.font34),
                        ),
                        Gap(Dimentions.height10),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Dimentions.width20),
                          child: CustomText(
                              title: OnboardSecondScreenModel
                                  .onboardSecondScreenList[index].subTitle,
                              fontWeight: FontWeight.w400,
                              color: kBlackColor,
                              fontSize: Dimentions.font24),
                        ),
                        Gap(Dimentions.height20),
                        SvgPicture.asset(OnboardSecondScreenModel
                            .onboardSecondScreenList[index].image)
                      ],
                    );
                  }),
            ),
            HomeSlider(),
            Gap(Dimentions.height20),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: Dimentions.width40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height:Dimentions.height44,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                              primary: kPrimaryColor,
                              shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(Dimentions.height15))),
                          onPressed: () {
                            if(data.homeSliderIndex==OnboardSecondScreenModel.onboardSecondScreenList.length-1){
                              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyGmailScreen()));
                            }else{
                              pageController.animateToPage(pageController.page!.toInt()+1, duration: Duration(seconds: 1),
                                  curve: Curves.ease);
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: Dimentions.width15),
                            child: CustomText(
                              title: "Next",
                              color: Colors.white,
                              fontSize: Dimentions.font18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    )
                  ],
                )),
            Gap(Dimentions.height25)
          ],
        ),
      ),
    );
  }
}
