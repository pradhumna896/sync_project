import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_skip_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/gender_modal.dart';
import 'package:syncdating/screens/passions_screen.dart';

import '../provider/app_controller.dart';

class IAmScreen extends StatelessWidget {
  const IAmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButoon(onclick: () {
                    Navigator.pop(context);
                  }),
                  CustomSkipButton()
                ],
              ),
              Gap(30),
              CustomText(title: "I am a", fontWeight: FontWeight.w700, color: kBlackColor, fontSize: 34),
              Gap(90),

              Column(children: List.generate(GenderModal.genderModalList.length, (index) => InkWell(
                onTap: (){
                  data.chooseGenderStatus(index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 56,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: data.chooseGender==index? kPrimaryColor:Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: kgreyColor)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CustomText(title: GenderModal.genderModalList[index].title, fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 16),
                      SvgPicture.asset(GenderModal.genderModalList[index].image)
                    ],),
                  ),
                ),
              )),),
              Spacer(),

              CustomButton(title: "Continue", onclick: (){Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PassionsScreen()));}),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
