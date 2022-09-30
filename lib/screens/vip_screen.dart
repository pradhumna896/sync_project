

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/provider/app_controller.dart';

import '../components/custom_back_button.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';

class VipScreens extends StatelessWidget {
  const VipScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
        title: CustomText(
            title: "VIP",
            fontWeight: FontWeight.w700,
            color: kBlackColor,
            fontSize: 24),
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                    onTap: (index) {},
                    indicatorColor: Color(0xff00ACCB),
                    tabs: [
                      Tab(
                        child: CustomText(
                            title: "Only Ads Free",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff00ACCB),
                            fontSize: 18),
                      ),
                      Tab(
                        child: CustomText(
                            title: "VIP",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff336CFF),
                            fontSize: 18),
                      ),
                    ]),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(

                    children: [
                      onlyAdsFree(context),
                      vipPackage(context)
                    ]),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Padding vipPackage(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(20),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Gap(20),
                CustomText(
                    title: "Features",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
                Gap(20),
                GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                        mainAxisExtent: 30, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
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
                                  title: "chat with matchs",
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor,
                                  fontSize: 11)
                            ],
                          ),
                        ),
                      );
                    }),
                Gap(20)
              ],
            ),
          ),
          Gap(20),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Gap(20),
                CustomText(
                    title: "Price",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
                Column(
                  children: List.generate(
                      4,
                          (index) => InkWell(
                        onTap: (){
                          provider.addPriceStatus(index);
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            width: double.maxFinite,
                            height: 51,
                            decoration: BoxDecoration(
                                border: Border.all( color: provider.addPriceIndex==index?kPrimaryColor:Color(0xffDCE1E4)),
                                borderRadius:
                                BorderRadius.circular(15),
                                color: provider.addPriceIndex==index?Colors.white:Color(0xffDCE1E4)),
                            child: Center(
                              child: RichText(
                                  text: TextSpan(
                                      text: "Get ow @ 49/-\n",
                                      style: TextStyle(
                                          color: provider.addPriceIndex==index?kPrimaryColor:kBlackColor,
                                          fontSize: 13,
                                          fontWeight:
                                          FontWeight.w600),
                                      children: [
                                        TextSpan(
                                            text:
                                            "(valid for 45 days)",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.w400,
                                                fontSize: 10,
                                                color: kBlackColor))
                                      ])),
                            )),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding onlyAdsFree(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(20),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Gap(20),
                                CustomText(
                                    title: "Features",
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor,
                                    fontSize: 14),
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 23),
                                    width: double.maxFinite,
                                    height: 51,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffDCE1E4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/svg/Vector (35).svg"),
                                        Gap(15),
                                        CustomText(
                                            title: "Only Ads Free",
                                            fontWeight: FontWeight.w400,
                                            color: kBlackColor,
                                            fontSize: 14)
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Gap(20),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Gap(20),
                                CustomText(
                                    title: "Price",
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor,
                                    fontSize: 14),
                                Column(
                                  children: List.generate(
                                      4,
                                      (index) => InkWell(
                                        onTap: (){
                                          provider.addPriceStatus(index);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            width: double.maxFinite,
                                            height: 51,
                                            decoration: BoxDecoration(
                                              border: Border.all( color: provider.addPriceIndex==index?kPrimaryColor:Color(0xffDCE1E4)),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: provider.addPriceIndex==index?Colors.white:Color(0xffDCE1E4)),
                                            child: Center(
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: "Get ow @ 49/-\n",
                                                      style: TextStyle(
                                                          color: provider.addPriceIndex==index?kPrimaryColor:kBlackColor,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      children: [
                                                    TextSpan(
                                                        text:
                                                            "(valid for 45 days)",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 10,
                                                            color: kBlackColor))
                                                  ])),
                                            )),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
    );
  }
}
