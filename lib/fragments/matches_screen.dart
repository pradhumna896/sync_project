import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/screens/match_screen.dart';
import 'package:syncdating/screens/profile_screen.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import '../provider/app_controller.dart';
import '../screens/match_profile_screen.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: "Matches",
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
                //         border: Border.all(color: kgreyColor)),
                //     child: Center(
                //         child: SvgPicture.asset("assets/svg/sort_two.svg")),
                //   ),
                // )
              ],
            ),
            Gap(10),
            CustomText(
                title:
                    "This is a list of people who have liked you and your matches.",
                fontWeight: FontWeight.w400,
                color: kBlackColor,
                fontSize: 16),
            TabBar(
                onTap: (index) {
                  provider.tabBarIndexStatus(index);
                  print(index);
                },
                indicatorColor: Colors.transparent,

                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                physics: BouncingScrollPhysics(),
                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: provider.tabBarIndex == 0
                            ? kPrimaryColor
                            : Colors.transparent,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: CustomText(
                          title: "Like",
                          fontWeight: FontWeight.w700,
                          color: provider.tabBarIndex == 0
                              ? Colors.white
                              : kPrimaryColor,
                          fontSize: Dimentions.font18),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:  provider.tabBarIndex == 1
                            ? kPrimaryColor
                            : Colors.transparent,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: CustomText(
                          title: "ShortListed",
                          fontWeight: FontWeight.w700,
                          color: provider.tabBarIndex == 1
                              ? Colors.white
                              : kPrimaryColor,
                          fontSize: Dimentions.font18),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: provider.tabBarIndex == 2
                            ? kPrimaryColor
                            : Colors.transparent,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimentions.width15, vertical: Dimentions.height5),
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "View Profile",
                          fontWeight: FontWeight.w700,
                          color:  provider.tabBarIndex == 2
                              ? Colors.white
                              : kPrimaryColor,
                          fontSize: Dimentions.font18),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: provider.tabBarIndex == 3
                            ? kPrimaryColor
                            : Colors.transparent,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: CustomText(
                          textAlign: TextAlign.center,
                          title: "Matches",
                          fontWeight: FontWeight.w700,
                          color:  provider.tabBarIndex == 3
                              ? Colors.white
                              : kPrimaryColor,
                          fontSize: Dimentions.font18),
                    ),
                  )
                ]),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                likeMatches(),
                disLikeMatches(),
                viewProfileMatches(),
                matches()
              ]),
            )
          ],
        ),
      ),
    );
  }

  SingleChildScrollView likeMatches() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(Dimentions.height20),
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/matchesgirlimage.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              CustomText(
                                  title: "Leilani,",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16),
                              Gap(5),
                              CustomText(
                                  title: "20",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16)
                            ],
                          ),
                        ),
                        Gap(5),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15)),
                                    color: Colors.black54),
                                child: Center(
                                  child:
                                      SvgPicture.asset("assets/svg/close.svg"),
                                ),
                              )),
                              Container(
                                width: 0.5,
                                color: Colors.white,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15))),
                                child: Center(
                                  child: SvgPicture.asset(
                                      "assets/svg/dilwale.svg"),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/matchesgirlimage.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Visibility(
                        visible: index == 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            CustomText(
                                title: "Leilani,",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16),
                            Gap(5),
                            CustomText(
                                title: "20",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16)
                          ],
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  color: Colors.black54),
                              child: Center(
                                child: SvgPicture.asset("assets/svg/close.svg"),
                              ),
                            )),
                            Container(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15))),
                              child: Center(
                                child:
                                    SvgPicture.asset("assets/svg/dilwale.svg"),
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  SingleChildScrollView disLikeMatches() {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/matchesgirlimage.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.star,
                              color: Color(0xff8A2387),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              CustomText(
                                  title: "Leilani,",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16),
                              Gap(5),
                              CustomText(
                                  title: "20",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16)
                            ],
                          ),
                        ),
                        Gap(5),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15)),
                                    color: Colors.black54),
                                child: Center(
                                  child:
                                      SvgPicture.asset("assets/svg/close.svg"),
                                ),
                              )),
                              Container(
                                width: 0.5,
                                color: Colors.white,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15))),
                                child: Center(
                                  child: SvgPicture.asset(
                                      "assets/svg/dilwale.svg"),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/matchesgirlimage.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Visibility(
                        visible: index == 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            CustomText(
                                title: "Leilani,",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16),
                            Gap(5),
                            CustomText(
                                title: "20",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16)
                          ],
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  color: Colors.black54),
                              child: Center(
                                child: SvgPicture.asset("assets/svg/close.svg"),
                              ),
                            )),
                            Container(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15))),
                              child: Center(
                                child:
                                    SvgPicture.asset("assets/svg/dilwale.svg"),
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  SingleChildScrollView viewProfileMatches() {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/matchesgirlimage.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.remove_red_eye,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              CustomText(
                                  title: "Leilani,",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16),
                              Gap(5),
                              CustomText(
                                  title: "20",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16)
                            ],
                          ),
                        ),
                        Gap(5),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15)),
                                    color: Colors.black54),
                                child: Center(
                                  child:
                                      SvgPicture.asset("assets/svg/close.svg"),
                                ),
                              )),
                              Container(
                                width: 0.5,
                                color: Colors.white,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15))),
                                child: Center(
                                  child: SvgPicture.asset(
                                      "assets/svg/dilwale.svg"),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/matchesgirlimage.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Visibility(
                        visible: index == 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            CustomText(
                                title: "Leilani,",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16),
                            Gap(5),
                            CustomText(
                                title: "20",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16)
                          ],
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  color: Colors.black54),
                              child: Center(
                                child: SvgPicture.asset("assets/svg/close.svg"),
                              ),
                            )),
                            Container(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15))),
                              child: Center(
                                child:
                                    SvgPicture.asset("assets/svg/dilwale.svg"),
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  matches() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(Dimentions.height20),
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => MatchScreenProfile()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/matchesgirlimage.png",
                            ),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(
                              "assets/images/matchesIcons.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              CustomText(
                                  title: "Leilani,",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16),
                              Gap(5),
                              CustomText(
                                  title: "20",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16)
                            ],
                          ),
                        ),
                        Gap(5),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15)),
                                    color: Colors.black54),
                                child: Center(
                                  child:
                                      SvgPicture.asset("assets/svg/close.svg"),
                                ),
                              )),
                              Container(
                                width: 0.5,
                                color: Colors.white,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15))),
                                child: Center(
                                  child: SvgPicture.asset(
                                      "assets/svg/dilwale.svg"),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/matchesgirlimage.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Visibility(
                        visible: index == 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            CustomText(
                                title: "Leilani,",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16),
                            Gap(5),
                            CustomText(
                                title: "20",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16)
                          ],
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  color: Colors.black54),
                              child: Center(
                                child: SvgPicture.asset("assets/svg/close.svg"),
                              ),
                            )),
                            Container(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15))),
                              child: Center(
                                child:
                                    SvgPicture.asset("assets/svg/dilwale.svg"),
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
