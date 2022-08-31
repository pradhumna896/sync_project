import 'package:expandable_slider/expandable_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int filter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Gap(10),
            Row(
              children: [
                Spacer(
                  flex: 2,
                ),
                CustomText(
                    title: "Filters",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 24),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: CustomText(
                      color: kPrimaryColor,
                      title: "Clear",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ))
              ],
            ),
            Gap(30),
            CustomText(
                title: "Interested in",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 16),
            Gap(20),
            Container(
              height: 56,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: kgreyColor)),
              child: Row(children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          filter = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                            filter == 0 ? kPrimaryColor : Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                        child: Center(
                            child: CustomText(
                                title: "Girls",
                                fontWeight: FontWeight.w700,
                                color: filter == 0
                                    ? Color(0xffffffff)
                                    : kBlackColor,
                                fontSize: 14)),
                      ),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          filter = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: filter == 1 ? kPrimaryColor : Colors.white,
                        ),
                        child: Center(
                            child: CustomText(
                                title: "Boys",
                                fontWeight: FontWeight.w700,
                                color: filter == 1
                                    ? Color(0xffffffff)
                                    : kBlackColor,
                                fontSize: 14)),
                      ),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          filter = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                            filter == 2 ? kPrimaryColor : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Center(
                            child: CustomText(
                                title: "Both",
                                fontWeight: FontWeight.w700,
                                color: filter == 2
                                    ? Color(0xffffffff)
                                    : kBlackColor,
                                fontSize: 14)),
                      ),
                    )),
              ]),
            ),
            Gap(40),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Location",
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE8E6EA)),
                      borderRadius: BorderRadius.circular(15))),
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: "Distance",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 16),
                CustomText(
                    title: "40km",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
              ],
            ),
            Gap(20),
            SizedBox(
              height: 20,
              child: ExpandableSlider.adaptive(
                shrunkWidth: MediaQuery.of(context).size.width,
                min: 10,
                max: 100,
                value: 50,
                onChanged: (double) {},
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: "Age",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 16),
                CustomText(
                    title: "20-39",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
              ],
            ),
            Gap(20),
            SizedBox(
              height: 20,
              child: ExpandableSlider.adaptive(
                shrunkWidth: MediaQuery.of(context).size.width,
                min: 10,
                max: 100,
                value: 50,
                onChanged: (double) {},
              ),
            ),
            Spacer(),
            CustomButton(title: "Continue", onclick: () {Navigator.pop(context);}),
            Gap(30)
          ],
        ),
      ),
    );
  }
}
