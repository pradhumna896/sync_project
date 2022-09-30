import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/photo6.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Gap(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(20),
                      CustomBackButoon(onclick: () {
                        Navigator.pop(context);
                      })
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                          title: "Naman,",
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                          fontSize: 18),
                      Gap(10),
                      CustomText(
                          title: "51",
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                          fontSize: 18),
                    ],
                  ),
                  Column(
                    children: List.generate(
                        4,
                        (index) => Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,color: kPrimaryColor,),
                                    Gap(10),
                                    CustomText(
                                        title: "Bhopal",
                                        fontWeight: FontWeight.w400,
                                        color: kBlackColor,
                                        fontSize: 16)
                                  ],
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
