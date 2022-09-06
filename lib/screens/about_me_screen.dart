import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_skip_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/i_am_screen.dart';

import '../components/custom_text.dart';

const List<String> list = ["Current Location","Job", "Study"];
const List<String> list1 = ["Permanent Location","zone-I", "zone-II"];

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  String dropdownValue = list.first;
  String dropdownValue1 = list1.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomSkipButton(onclick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => IAmScreen()));
                })
              ],
            ),
            Gap(30),
            CustomText(
                title: "About me",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 34),
            // DropdownButton<String>(
            //     value: dropdownValue,
            //     items: chooseLocation.map<DropdownMenuItem<String>>((String value){
            //       print(value);
            //       return DropdownMenuItem<String>(
            //           value:value,
            //           child: Text(value)
            //       );}).toList(),
            //     onChanged: (String? Value){}
            // )
            Gap(30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 56,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(color: kgreyColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
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
                              fontSize: 14,
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
            Gap(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 56,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(color: kgreyColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue1,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue1 = value!;
                          });
                        },
                        items:
                        list1.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(
                              title: value,
                              color: kBlackColor,
                              fontSize: 14,
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

            CustomButton(title:"Confirm",onclick: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>IAmScreen()));
            },),
            Gap(20)
          ],
        ),
      )),
    );
  }
}
