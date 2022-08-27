import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/screens/profile_screen.dart';

import '../components/custom_text.dart';
import '../helper/constants.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                title: "Matches",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 34),
            InkWell(
              onTap: () {},
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: kgreyColor)),
                child:
                    Center(child: SvgPicture.asset("assets/svg/sort_two.svg")),
              ),
            )
          ],
        ),
        Gap(10),
        CustomText(
            title:
                "This is a list of people who have liked you and your matches.",
            fontWeight: FontWeight.w400,
            color: kBlackColor,
            fontSize: 16),

        
        Expanded(child: SingleChildScrollView(
          child: Column(children: [
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Divider(
                      height: 0.5,
                      color: Colors.grey,
                    )),
                Gap(10),
                CustomText(
                    title: "Today",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 12),
                Gap(10),
                Expanded(
                    child: const Divider(
                      height: 0.5,
                      color: Colors.grey,
                    ))
              ],
            ),
            Gap(15),
            GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 200),
                itemBuilder: (BuildContext context , index){
                  return InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProfileScreen()));},
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/matchesgirlimage.png"),fit: BoxFit.fill)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12 ),
                            child: Row(children: [
                              CustomText(title: "Leilani,", fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16),
                              Gap(5),
                              CustomText(title: "20", fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16)
                            ],),
                          ),
                          Gap(5),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                            child: Row(children: [
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                    color: Colors.black54),
                                child: Center(child: SvgPicture.asset("assets/svg/close.svg"),),)),
                              Container(width: 0.5,color: Colors.white,),
                              Expanded(child: Container(
                                decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))),
                                child: Center(child: SvgPicture.asset("assets/svg/dilwale.svg"),),))
                            ],),
                          )
                        ],),
                    ),
                  );

                }),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Divider(
                      height: 0.5,
                      color: Colors.grey,
                    )),
                Gap(10),
                CustomText(
                    title: "Yesterday",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 12),
                Gap(10),
                Expanded(
                    child: const Divider(
                      height: 0.5,
                      color: Colors.grey,
                    ))
              ],
            ),
            Gap(10),
            GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 200),
                itemBuilder: (BuildContext context , index){
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/matchesgirlimage.png"),fit: BoxFit.fill)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12 ),
                          child: Row(children: [
                            CustomText(title: "Leilani,", fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16),
                            Gap(5),
                            CustomText(title: "20", fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16)
                          ],),
                        ),
                        Gap(5),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                          child: Row(children: [
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                  color: Colors.black54),
                              child: Center(child: SvgPicture.asset("assets/svg/close.svg"),),)),
                            Container(width: 0.5,color: Colors.white,),
                            Expanded(child: Container(
                              decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))),
                              child: Center(child: SvgPicture.asset("assets/svg/dilwale.svg"),),))
                          ],),
                        )
                      ],),
                  );

                })
          ],),
        ))
    
      ],
    );
  }
}
