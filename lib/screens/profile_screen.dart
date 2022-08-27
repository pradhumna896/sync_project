import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/screens/photo_fullscreen.dart';

import '../components/custom_text.dart';
import '../helper/constants.dart';

class ProfileScreen extends StatelessWidget {

   ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              top: 0,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>PhotoFullScreen()));},
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/profilepicture.png"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Gap(44), CustomBackButoon(iconColor: Colors.white,onclick: () {Navigator.pop(context);})],
                      ),
                    )),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Gap(90),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        title: "Jessica Parker, 23",
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor,
                                        fontSize: 24),
                                    CustomText(
                                        title: "Professional model",
                                        fontWeight: FontWeight.w400,
                                        color: kBlackColor,
                                        fontSize: 14)
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 52,
                                    width: 52,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kgreyColor)),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            "assets/svg/shareIcon.svg")),
                                  ),
                                )
                              ],
                            ),
                            Gap(30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        title: "Location",
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor,
                                        fontSize: 16),
                                    Gap(5),
                                    CustomText(
                                        title: "Chicago, IL United States",
                                        fontWeight: FontWeight.w400,
                                        color: kBlackColor,
                                        fontSize: 14)
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFDECEE),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/location_icon.svg",
                                          color: kPrimaryColor,
                                        ),
                                        const Gap(5),
                                        CustomText(
                                            title: "1 km",
                                            fontWeight: FontWeight.w700,
                                            color: kPrimaryColor,
                                            fontSize: 12)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Gap(30),
                            Row(
                              children: [
                                CustomText(
                                    title: "About",
                                    fontWeight: FontWeight.w700,
                                    color: kBlackColor,
                                    fontSize: 16)
                              ],
                            ),
                            CustomText(
                                title:
                                    "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..",
                                fontWeight: FontWeight.w400,
                                color: kBlackColor,
                                fontSize: 14),
                            Row(
                              children: [
                                CustomText(
                                    title: "Read more",
                                    fontWeight: FontWeight.w700,
                                    color: kPrimaryColor,
                                    fontSize: 14),
                              ],
                            ),
                            Gap(30),
                            Row(
                              children: [
                                CustomText(
                                    title: "Interests",
                                    fontWeight: FontWeight.w700,
                                    color: kBlackColor,
                                    fontSize: 16)
                              ],
                            ),
                            Gap(10),
                            GridView.builder(
                                padding: EdgeInsets.all(0),
                                itemCount: 5,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                        mainAxisExtent: 50),
                                itemBuilder: (BuildContext context, index) {
                                  return Card(
                                    child: Center(
                                        child: CustomText(
                                            color: kPrimaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            title: "Travelling")),
                                  );
                                }),
                            Gap(30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset("assets/svg/closeorange.svg"),
                          onPressed: () {}),
                      SizedBox(
                        height: 99,
                        width: 99,
                        child: FloatingActionButton(
                            backgroundColor: kPrimaryColor,
                            child: SvgPicture.asset(
                              "assets/svg/dilwale.svg",
                              height: 42,
                              width: 42,
                            ),
                            onPressed: () {}),
                      ),
                      FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset("assets/svg/star.svg"),
                          onPressed: () {}),
                    ],
                  )),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
