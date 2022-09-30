import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/provider/app_controller.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
        title: CustomText(
            title: "Subscription",
            fontWeight: FontWeight.w700,
            color: kBlackColor,
            fontSize: 24),
      ),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  onTap: (index){
                    provider.tabBarColorStatus(index);
                  },
                    indicatorColor: provider.tabBarColor==0?Color(0xff00ACCB):provider.tabBarColor==1?Color(0xff336CFF):Color(0xffFF8C4B),

                    tabs: [
                  Tab(
                    child: CustomText(
                        title: "Basic",
                        fontWeight: FontWeight.w700,
                        color: Color(0xff00ACCB),
                        fontSize: 18),
                  ),
                  Tab(
                    child: CustomText(
                        title: "Standard",
                        fontWeight: FontWeight.w700,
                        color: Color(0xff336CFF),
                        fontSize: 18),
                  ),
                  Tab(
                    child: CustomText(
                        title: "Premium",
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFF8C4B),
                        fontSize: 18),
                  )
                ]),
              ),
              Gap(Dimentions.height15),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(


                    children: [
                  basicPack(context),
                  standardPackage(context),
                  premiumePackage(context)
                ]),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Padding premiumePackage(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            flex: 2,
            child: Stack(children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 5, right: 5, top: 20, bottom: 10),
                      child: Column(
                        children: [
                          CustomText(
                              title: "buy premium pack to unlock this features",
                              fontWeight: FontWeight.w400,
                              color: kBlackColor,
                              fontSize: 11),
                          GridView.builder(
                              itemCount: 6,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 40, crossAxisCount: 2),
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: kPrimaryColor)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kPrimaryColor),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/svg/checkIcon.svg",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Gap(5),
                                        CustomText(
                                            title: "Chat With Matchs",
                                            fontWeight: FontWeight.w600,
                                            color: kPrimaryColor,
                                            fontSize: Dimentions.font11)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          Gap(10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "Features",
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ]),
          ),

          Expanded(
            flex: 3,
            child: Stack(children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      width: double.maxFinite,
                      child: Column(
                        children: List.generate(
                            4,
                            (index) => InkWell(
                                  onTap: () {
                                    provider.premiumPriceStatus(index);
                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: provider.premiumPriceIndex ==
                                                    index
                                                ? kPrimaryColor
                                                : Color.fromRGBO(
                                                    220, 225, 228, 0.25)),
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            Color.fromRGBO(220, 225, 228, 0.25)),
                                    child: Center(
                                      child: RichText(
                                          text: TextSpan(
                                              text: "Get ow @ 49/-",
                                              style: TextStyle(
                                                  color:
                                                      provider.premiumPriceIndex ==
                                                              index
                                                          ? kPrimaryColor
                                                          : kBlackColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                              children: [
                                            TextSpan(
                                                text: "(valid for 45 days)",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10,
                                                    color: kBlackColor))
                                          ])),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "Price",
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ]),
          ),
          CustomButton(title: "Pay Now", onclick: () {}),
          Gap(20),
        ],
      ),
    );
  }

  Padding standardPackage(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Stack(children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 5, right: 5, top: 20, bottom: 10),
                      child: Column(
                        children: [
                          GridView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 40, crossAxisCount: 2),
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: kPrimaryColor)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kPrimaryColor),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/svg/checkIcon.svg",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Gap(5),
                                        CustomText(
                                            title: "Chat With Matchs",
                                            fontWeight: FontWeight.w600,
                                            color: kPrimaryColor,
                                            fontSize: Dimentions.font11)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          Gap(10),
                          CustomText(
                              title: "buy premium pack to unlock this features",
                              fontWeight: FontWeight.w400,
                              color: kBlackColor,
                              fontSize: 10),
                          Gap(10),
                          GridView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 30, crossAxisCount: 2),
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5,),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                        Gap(5),
                                        CustomText(
                                            title: "Chat With Matchs",
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                            fontSize: Dimentions.font11)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "Features",
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ]),
          ),

          Expanded(
            flex: 3,
            child: Stack(children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      width: double.maxFinite,
                      child: Column(
                        children: List.generate(
                            4,
                            (index) => InkWell(
                                  onTap: () {
                                    provider.standardPriceStatus(index);
                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: provider.standardPriceIndex ==
                                                    index
                                                ? kPrimaryColor
                                                : Color.fromRGBO(
                                                    220, 225, 228, 0.25)),
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            Color.fromRGBO(220, 225, 228, 0.25)),
                                    child: Center(
                                      child: RichText(
                                          text: TextSpan(
                                              text: "Get ow @ 49/-",
                                              style: TextStyle(
                                                  color:
                                                      provider.standardPriceIndex ==
                                                              index
                                                          ? kPrimaryColor
                                                          : kBlackColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                              children: [
                                            TextSpan(
                                                text: "(valid for 45 days)",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10,
                                                    color: kBlackColor))
                                          ])),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "Price",
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ]),
          ),
          CustomButton(title: "Pay Now", onclick: () {}),
          Gap(20),
        ],
      ),
    );
  }

  Padding basicPack(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Stack(children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 5, right: 5, top: 20, bottom: 10),
                      child: Column(
                        children: [
                          GridView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 30, crossAxisCount: 2),
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: kPrimaryColor)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          height: 15,
                                          width: 15,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kPrimaryColor),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/svg/checkIcon.svg",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const Gap(5),
                                        CustomText(
                                            title: "Chat With Matchs",
                                            fontWeight: FontWeight.w600,
                                            color: kPrimaryColor,
                                            fontSize: Dimentions.font11)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          Gap(10),
                          CustomText(
                              title: "buy premium pack to unlock this features",
                              fontWeight: FontWeight.w400,
                              color: kBlackColor,
                              fontSize: 10),
                          Gap(10),
                          GridView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 40, crossAxisCount: 2),
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                        Gap(5),
                                        CustomText(
                                            title: "chat with matchs",
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                            fontSize:Dimentions.font11)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "Features",
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ]),
          ),

          Expanded(
            flex: 3,
            child: Stack(children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      width: double.maxFinite,
                      child: Column(
                        children: List.generate(
                            4,
                            (index) => InkWell(
                                  onTap: () {
                                    provider.basicPriceStatus(index);
                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color:
                                                provider.basicPriceIndex == index
                                                    ? kPrimaryColor
                                                    : Color.fromRGBO(
                                                        220, 225, 228, 0.25)),
                                        color:
                                            Color.fromRGBO(220, 225, 228, 0.25)),
                                    child: Center(
                                      child: RichText(
                                          text: TextSpan(
                                              text: "Get Now @ 49/-",
                                              style: TextStyle(
                                                  color:
                                                      provider.basicPriceIndex ==
                                                              index
                                                          ? kPrimaryColor
                                                          : kBlackColor,
                                                  fontSize: Dimentions.font13,
                                                  fontWeight: FontWeight.w600),
                                              children: [
                                            TextSpan(
                                                text: "(valid for 45 days)",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: Dimentions.font10,
                                                    color: kBlackColor))
                                          ])),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "Price",
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            ]),
          ),
          CustomButton(title: "Pay Now", onclick: () {}),
          Gap(20),
        ],
      ),
    );
  }
}
