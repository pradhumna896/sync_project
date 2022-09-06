import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/onboard_model.dart';
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
                            SizedBox(height: 32,),
                            Image.asset(
                                OnBoardModal.onBoardModalList[index].image),
                            SizedBox(height: 32,),
                            CustomText(
                                title: OnBoardModal.onBoardModalList[index].title,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                                fontSize: 24),
                            SizedBox(height: 10,),
                            CustomText(textAlign: TextAlign.center,title: OnBoardModal.onBoardModalList[index].subTitle, fontWeight: FontWeight.w400,
                                color: kSecondaryColor,
                                fontSize: 14)
                          ],
                        ),
                      );
                    })),
            HomeSlider(),
            SizedBox(height: 42,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(onclick: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              }, title: 'Create an account',),
            ),
            const SizedBox(
              height: 20,
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
                    onTap: (){},
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
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
