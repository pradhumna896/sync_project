import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [CustomBackButoon(onclick: () {Navigator.pop(context);})],
              ),
              Gap(20),
              CustomText(
                  title: "History",
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                  fontSize: 24),
              Gap(20),
              Expanded(child:
                  ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                title: "Buy Date:- 01/01/22",
                                fontWeight: FontWeight.w500,
                                color: kBlackColor,
                                fontSize: 10),
                            CustomText(
                                title: "End Date:- 01/01/22",
                                fontWeight: FontWeight.w500,
                                color: kBlackColor,
                                fontSize: 10)
                          ],
                        ),
                        Gap(10),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kPrimaryColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.check_circle,color: kPrimaryColor,size: 14,),
                                Gap(6),
                                CustomText(title: "BasicPack",
                                    fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 14),
                                Gap(10),
                                Icon(Icons.currency_rupee_sharp,color: kPrimaryColor,),
                                CustomText(title: "49/-", fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 13)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
