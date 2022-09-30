import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_skip_button.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/provider/app_controller.dart';

import '../components/custom_text.dart';
import '../model/Intrest_modal.dart';
import 'friends_screen.dart';

class PassionsScreen extends StatefulWidget {
  const PassionsScreen({Key? key}) : super(key: key);

  @override
  State<PassionsScreen> createState() => _PassionsScreenState();
}

class _PassionsScreenState extends State<PassionsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppController>(context, listen: false).interestsListContent();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButoon(onclick: () {
                    Navigator.pop(context);
                  }),
                  CustomSkipButton(
                    onclick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => FriendsScreen()));
                    },
                  )
                ],
              ),
              Gap(30),
              CustomText(
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                title: 'Your interests',
                fontSize: 34,
              ),
              CustomText(
                fontWeight: FontWeight.w400,
                color: kBlackColor,
                title:
                    'Select a few of your interests and let everyone know what you’re passionate about.',
                fontSize: 14,
              ),
              Gap(30),
              Expanded(
                  child: GridView.builder(
                    itemCount: provider.interestsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3/2,
                        mainAxisExtent: 45,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context,index){
                        return InkWell(
                          onTap: () {
                            provider.updateInterestList(
                                provider.interestsList[index]);

                          },
                          child: Card(
                            color: provider.interestsList[index].isSelected
                                ? kPrimaryColor : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(provider.interestsList[index].icon,color: provider.interestsList[index].isSelected?Colors.white:kBlackColor,),
                                  Gap(5),
                                  CustomText(
                                      title:
                                      provider.interestsList[index].title,
                                      fontWeight: FontWeight.w400,
                                      color: provider.interestsList[index].isSelected?Colors.white:kBlackColor,
                                      fontSize: 13)
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
              Gap(Dimentions.height10),
              CustomButton(
                  title: "Continue",
                  onclick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => FriendsScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
/*
GridView.builder(
                    itemCount: provider.interestsList.length, shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 2,
                        mainAxisExtent: 45),
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: (){
                          provider.updateInterestList(provider.interestsList[index]);

                        },
                        child: Card(
                          color:provider.interestsList[index].isSelected?kPrimaryColor:Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(

                              children: [
                                Icon(provider.interestsList[index].icon),
                                Gap(10),
                                CustomText(title: provider.interestsList[index].title,
                                    fontWeight: FontWeight.w400,
                                    color: kBlackColor,
                                    fontSize: 14)
                              ],),
                          ),
                        ),
                      );
                    }),
 */
