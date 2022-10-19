import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_skip_button.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/Looking_for_Modal.dart';
import 'package:syncdating/model/gender_modal.dart';
import 'package:syncdating/screens/about_me_screen.dart';
import 'package:syncdating/screens/passions_screen.dart';
import 'package:syncdating/widget/looking_for_slider.dart';

import '../components/custom_text.dart';
import '../provider/app_controller.dart';

const List<String> list = [
  "Choose another",
  "Intersex",
  'Trans',
  ' Non-Conforming',
  'Eunuch'
];

class LookingFor extends StatefulWidget {
  const LookingFor({Key? key}) : super(key: key);

  @override
  State<LookingFor> createState() => _LookingForState();
}

class _LookingForState extends State<LookingFor> {
  String dropdownValue = list.first;

  PageController pageController= PageController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomBackButoon(onclick: () {
                    Navigator.pop(context);
                  }),
                  // CustomSkipButton(
                  //   onclick: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (builder) => const PassionsScreen()));
                  //   },
                  // )
                ],
              ),
              Gap(30),
              CustomText(
                  title: "Looking For",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 34),
              Expanded(
                  child: PageView.builder(
                    controller: pageController,
                      onPageChanged: (index){
                      data.lookingForSliderIndexStatus(index);
                      print(pageController);



                      },
                      itemCount: LookingForModal.lookingForModalList.length,
                      itemBuilder: (BuildContext context, index) {
                        return SvgPicture.asset(
                            LookingForModal.lookingForModalList[index].image);
                      })),
              LookingForSlider(),
              Gap(20),
              GenderBox(pageController: pageController),
              Gap(20),
              CustomText(
                  title: "you will be able to change it later ",
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  fontSize: 14),
              Gap(50),
              CustomButton(
                  title: "Continue",
                  onclick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => AboutMeScreen()));
                  }),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
