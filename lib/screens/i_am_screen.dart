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
import 'package:syncdating/model/gender_modal.dart';
import 'package:syncdating/screens/about_me_screen.dart';
import 'package:syncdating/screens/looking_for.dart';
import 'package:syncdating/screens/passions_screen.dart';

import '../components/custom_text.dart';
import '../provider/app_controller.dart';
const List<String> list = ["Choose another","Intersex", 'Trans',' Non-Conforming', 'Eunuch'];

class IAmScreen extends StatefulWidget {
  const IAmScreen({Key? key}) : super(key: key);

  @override
  State<IAmScreen> createState() => _IAmScreenState();
}

class _IAmScreenState extends State<IAmScreen> {
  String dropdownValue = list.first;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButoon(onclick: () {
                    Navigator.pop(context);
                  }),
                  CustomSkipButton(onclick: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (builder) => const PassionsScreen()));
                  },)
                ],
              ),
              Gap(30),
              CustomText(title: "I am a",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 34),
              Gap(90),

              Column(children: List.generate(
                  GenderModal.genderModalList.length, (index) =>
                  InkWell(
                    onTap: () {
                      data.chooseGenderStatus(index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 56,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: data.chooseGender == index
                              ? kPrimaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kgreyColor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                title: GenderModal.genderModalList[index].title,
                                fontWeight: FontWeight.w400,
                                color: data.chooseGender == index ? Color(
                                    0xffFFFFFF) : kBlackColor,
                                fontSize: 16),
                            SvgPicture.asset(
                                GenderModal.genderModalList[index].image,color: data.chooseGender == index ? Color(
                                0xffFFFFFF) : kBlackColor,)
                          ],),
                      ),
                    ),
                  )),),
              Gap(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 56,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: data.chooseGender==-1? kPrimaryColor : Colors.white,
                    border: Border.all(color: kgreyColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onTap: (){
                            data.chooseGenderStatus(-1);
                          },
                          value: dropdownValue,
                         dropdownColor: kPrimaryColor,

                          iconEnabledColor:data.chooseGender==-1? Colors.white: kBlackColor,

                          icon: const Icon(Icons.keyboard_arrow_down),
                          elevation: 16,
                          style: const TextStyle(color: Colors.white),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {

                            // This is called when the user selects an item.
                            setState(() {

                              dropdownValue = value!;
                            });
                          },
                          items:
                          list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(
                                title: value,
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Spacer(),

              CustomButton(title: "Continue", onclick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => LookingFor()));
              }),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
