import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/onboard_model.dart';
import 'package:syncdating/screens/login_screen.dart';
import 'package:syncdating/screens/signup_screen.dart';
import 'package:syncdating/widget/home_slider.dart';

import '../components/custom_button.dart';
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
                                OnBoardModal.onBoardModalList[index].image,height: height/2,),
                            SizedBox(height: height*0.032,),
                            CustomText(
                                title: OnBoardModal.onBoardModalList[index].title,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                                fontSize: height*0.030),
                            SizedBox(height: height*0.010,),
                            CustomText(textAlign: TextAlign.center,title: OnBoardModal.onBoardModalList[index].subTitle, fontWeight: FontWeight.w400,
                                color: kSecondaryColor,
                                fontSize: height*0.018)
                          ],
                        ),
                      );
                    })),
            HomeSlider(),
            SizedBox(height: height*0.050,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(onclick: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              }, title: 'Create an account',),
            ),
            SizedBox(
              height: height*0.030,
            ),
            RichText(
              text: WidgetSpan(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    title: 'Already have an account?',
                    fontSize: 16,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const LoginScreen()));
                    },
                    child: CustomText(
                      color: Color(0xffE94057),
                      fontWeight: FontWeight.w400,
                      title: ' Sign In',
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: height*0.065,
            )
          ],
        ),
      ),
    );
  }
}
