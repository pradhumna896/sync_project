import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

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
            title: "Subscription",
            fontWeight: FontWeight.w700,
            color: kBlackColor,
            fontSize: 24),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset("assets/images/diamond.png",height: 100,width: 100,),
              CustomText(title: "VIP Badge", fontWeight: FontWeight.w700, color: kBlackColor, fontSize: 18),
              CustomText(title: "Get VIP badge on your profile, So people will know you are a VIP member",
                  fontWeight: FontWeight.w500, color: kBlackColor, fontSize: 16,textAlign: TextAlign.center),



              Expanded(
                  child: GridView.builder(
                    itemCount: 3,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 200,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/birds.svg",height: 70,width: 70,),
                              CustomText(title: "INR4.99", fontWeight: FontWeight.w700, color: kBlackColor, fontSize: 18),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: Colors.grey.shade300),
                                  child: CustomText(title: "VIP Badge", fontWeight: FontWeight.w500, color: kBlackColor, fontSize: 16)),


                            ],
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
