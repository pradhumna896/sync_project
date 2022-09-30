import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/show_me_model.dart';
import 'package:syncdating/provider/app_controller.dart';
import 'package:syncdating/widget/custom_appbar_title.dart';

import '../components/custom_back_button.dart';

class ShoweMeScreen extends StatelessWidget {
  const ShoweMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
        title: CustomAppbarTitle(title: "Show Me"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Gap(20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                    title: "Show Me",
                    fontWeight: FontWeight.w600,
                    color: kBlackColor,
                    fontSize: 20),
              ),
            ],
          ),
          Gap(10),
          Column(
            children: List.generate(
                ShowMeModel.showMeList
                    .length,
                (index) => InkWell(
                  onTap: (){
                    provider.showMeStatus(index);
                  },
                  child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  title: ShowMeModel.showMeList[index].title,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 16),
                              SvgPicture.asset(ShowMeModel.showMeList[index].icon,color: provider.showMe==index?kPrimaryColor:Colors.white,)
                            ],
                          ),
                        ),
                      ),
                )),
          )
        ],
      ),
    );
  }
}
