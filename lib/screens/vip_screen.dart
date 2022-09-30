import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
                    onTap: (index){

                    },
                    indicatorColor:Color(0xff00ACCB),

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
                        physics: NeverScrollableScrollPhysics(),

                        children: [

                          Column(
                            
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Gap(20),
                            Card(

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Column(children: [
                              Gap(20),
                              CustomText(title: "Features", fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 14),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 23),
                                width: double.maxFinite,
                                height: 51,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffDCE1E4)),

                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  SvgPicture.asset("assets/svg/Vector (35).svg"),
                                  Gap(15),
                                  CustomText(title: "Only Ads Free", fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 14)

                                ],)
                              )


                            ],),),
                              Gap(20),
                              Card(

                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                child: Column(children: [
                                  Gap(20),
                                  CustomText(title: "Price", fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 14),
                                 Column(children: List.generate(4, (index) =>  Container(
                                     margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                     width: double.maxFinite,
                                     height: 51,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(15),
                                         color: Color(0xffDCE1E4)),

                                     child:Center(
                                       child: RichText(
                                           text: TextSpan
                                             (
                                               text: "Get ow @ 49/-\n",
                                               style: TextStyle(
                                                   color:
                                                   kBlackColor,
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
                                     )
                                 )),)


                                ],),),
                          ],),
                          Column(children: [
                            Card(child: Column(children: [


                            ],),)
                          ],)


                        ]),
                  )),
            ],
          ),
        ),
      ),

    );
  }
}
