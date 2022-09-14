import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/Looking_for_Modal.dart';
import 'package:syncdating/provider/app_controller.dart';

class LookingForSlider extends StatelessWidget {
  const LookingForSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
          (index) => Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: data.lookingForSliderIndex == index
                          ? kPrimaryColor
                          : kgreyColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
              )),
    );
  }
}

class GenderBox extends StatelessWidget {
  PageController pageController;
  GenderBox({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          LookingForModal.lookingForModalList.length,
          (index) => Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: InkWell(
                  onTap: (){
                    pageController.animateToPage(pageController.page!.toInt()+1,
                        duration: Duration(microseconds: 400), curve: Curves.easeIn);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                        color: data.lookingForSliderIndex == index
                            ? kPrimaryColor
                            : Colors.white,
                        border: Border.all(color: kgreyColor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            LookingForModal.lookingForModalList[index].icon,color:data.lookingForSliderIndex==index?Colors.white:kBlackColor,),
                        Gap(5),
                        CustomText(
                            title:
                                LookingForModal.lookingForModalList[index].title,
                            fontWeight: FontWeight.w400,
                            color:data.lookingForSliderIndex==index?Color(0xffffffff): kBlackColor,
                            fontSize: 14)
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
