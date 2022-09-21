import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

class NotificationScreenFirst extends StatelessWidget {
  const NotificationScreenFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 40),
         child: Column(

           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Gap(10),
             Row(
               children: [

                 CustomBackButoon(onclick: (){
                   Navigator.pop(context);
                 }),
               ],
             ),
             Gap(10),
             CustomText(title: "Notification", fontWeight: FontWeight.w700, color: kBlackColor, fontSize: 24),
             Gap(10),
             Expanded(child: ListView.builder(
                 shrinkWrap: true,
                 itemBuilder: (BuildContext context ,index){
               return Container(

                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                           height: 48,
                           width: 48,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: const AssetImage(
                                     "assets/images/circlegirlImaage.png",
                                   ),
                                   fit: BoxFit.fill),
                               borderRadius: BorderRadius.circular(48)),
                         ),
                         Gap(10),
                         Expanded(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     Container(
                                       padding: const EdgeInsets.only(top: 5),
                                       child: Column(
                                         crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         mainAxisAlignment:
                                         MainAxisAlignment.center,
                                         children: [
                                           CustomText(
                                               title: "Congratulations",
                                               fontWeight: FontWeight.w700,
                                               color: kBlackColor,
                                               fontSize: 18),
                                           CustomText(
                                               title: " it’s a match",
                                               fontWeight: FontWeight.w400,
                                               color: kBlackColor,
                                               fontSize: 16)
                                         ],
                                       ),
                                     ),
                                     Column(
                                       mainAxisAlignment:
                                       MainAxisAlignment.start,
                                       children: [
                                         CustomText(
                                             title: "23 min",
                                             fontWeight: FontWeight.w700,
                                             color: Color(0xffADAFBB),
                                             fontSize: 12)
                                       ],
                                     )
                                   ],
                                 ),

                               ],
                             ))
                       ],
                     ),
                     const Divider(
                       thickness: 1,
                     )
                   ],
                 ),
               );
             }))


         ],),
       ),
     ),

    );
  }
}
