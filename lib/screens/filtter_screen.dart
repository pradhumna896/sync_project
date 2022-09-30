import 'package:expandable_slider/expandable_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/custom_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';


class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int filter = 0;
  RangeValues currentRangeValues = const RangeValues(21, 45);
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
                                title: "Male",
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
                                title: "Female",
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






            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: "Age",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 16),
                CustomText(
                    title: "${currentRangeValues.start.toInt()}-${currentRangeValues.end.toInt()}",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
              ],
            ),
            Gap(20),
            SizedBox(
              height: 20,
              child: RangeSlider(

                onChanged: (RangeValues values) {
                  print("START: ${currentRangeValues.start.toInt()}, End: ${currentRangeValues.end.toInt()}");
                  setState(() {
                    currentRangeValues = values;
                  });
                },
                labels: RangeLabels(
                  currentRangeValues.start.round().toString(),
                  currentRangeValues.end.round().toString(),
                ),
                values: currentRangeValues,
                max: 70,
                min: 18,
              ),
            ),
            Gap(40),


            CustomButton(title: "Continue", onclick: () {Navigator.pop(context);}),
            Gap(30)
          ],
        ),
      ),
    );
  }
}
