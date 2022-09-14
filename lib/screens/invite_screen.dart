import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          title: "Invite",
          color: kBlackColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: kgreyColor),
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/matchesgirlimage.png"),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      title: "Sharavan",
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor,
                                      fontSize: 16),
                                  CustomText(
                                      title: "+9179654435",
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontSize: 14)
                                ],
                              )
                            ],
                          )),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: CustomText(
                                    title: "Invite",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
