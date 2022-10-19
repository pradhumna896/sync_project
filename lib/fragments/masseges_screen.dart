import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/chat_screen.dart';

import '../components/custom_text.dart';

class MassegesScreen extends StatelessWidget {
  const MassegesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                  title: "Messages",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 34),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     height: 52,
              //     width: 52,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         ),
              //     child: Center(
              //         child: SvgPicture.asset("assets/svg/massegesicon.svg")),
              //   ),
              // )
            ],
          ),
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            height: 48,
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: "Sk-Modernist"),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: SvgPicture.asset(
                      "assets/svg/search.svg",
                      height: 17,
                      width: 17,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => ChatScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                      child: Row(
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
                                            title: "Emelie",
                                            fontWeight: FontWeight.w700,
                                            color: kBlackColor,
                                            fontSize: 14),
                                        CustomText(
                                            title: "Sticker 😍",
                                            fontWeight: FontWeight.w400,
                                            color: kBlackColor,
                                            fontSize: 14)
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
                              const Divider(
                                thickness: 1,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
