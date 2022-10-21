import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/helper/api_network.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/model/show_like_dislike_model.dart';
import 'package:syncdating/model/show_user_shortlisted_model.dart';
import 'package:syncdating/screens/match_screen.dart';
import 'package:syncdating/screens/profile_screen.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import '../model/show_user_shortlisted_model.dart';
import '../model/show_user_shortlisted_model.dart';
import '../model/show_user_shortlisted_model.dart';
import '../model/show_user_shortlisted_model.dart';
import '../model/show_user_shortlisted_model.dart';
import '../model/show_user_shortlisted_model.dart';
import '../model/show_user_shortlisted_model.dart';
import '../provider/app_controller.dart';
import '../screens/match_profile_screen.dart';
import 'package:http/http.dart' as http;

class MatchesScreen extends StatefulWidget {
  MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  var items = ['Like', 'ShortListed', 'Who viewed your profile', 'Matches'];

  String title = "Like";
  late Future likeFuture;

  Future getLikeFuture() {
    return showLike();
  }

  late Future shortListedFuture;

  Future getShortListedFuture() {
    return showShortListed();
  }

  @override
  initState() {
    super.initState();
    likeFuture = getLikeFuture();
    shortListedFuture = showShortListed();
  }
  List<ShowUserLikeModel> showUserLikeList = [];
  showLike()async{
    final response = await http.post(Uri.parse(ApiNetwork.showLike),body: {
      'user_id':'1'
    });
    if(response.statusCode == 200){
      List jsonResponse = jsonDecode(response.body);
      showUserLikeList = List<ShowUserLikeModel>.from(jsonResponse.map((e) => ShowUserLikeModel.fromJson(e)));
    }


  }

  List<ShowUserShortListedModel> showUserShortListedModel = [];
  showShortListed()async{
    final response = await http.post(Uri.parse(ApiNetwork.shortListed),body: {
      'user_id':'1'
    });
    if(response.statusCode == 200){
      List jsonResponse = jsonDecode(response.body);
      showUserShortListedModel = List<ShowUserShortListedModel>.from(jsonResponse.map((e) => ShowUserShortListedModel.fromJson(e)));
    }


  }



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimentions.width30, vertical: Dimentions.height20),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                    title: "Matches",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: Dimentions.font34),
                // InkWell(
                //     onTap: () {
                //       showModalBottomSheet(
                //           context: context,
                //           builder: (BuildContext context) {
                //             return CustomBottomSeet();
                //           });
                //     },
                //     child: Image.asset("assets/images/filterr.png")),

                // DropdownButtonHideUnderline(
                //   child: DropdownButton(
                //
                //     icon: Image.asset("assets/images/filterr.png"),
                //       dropdownColor: Color(0xffDCEDF9),
                //       itemHeight: kMinInteractiveDimension,
                //       style: TextStyle(
                //           color: Color(0xff0E1012),
                //           fontFamily: "NunitoSans",
                //           fontWeight: FontWeight.w600,
                //           fontSize: 12),
                //       elevation: 5,
                //       onTap: () {},
                //       hint: Text(
                //         title,
                //         style: TextStyle(
                //             color: Color(0xff0E1012),
                //             fontFamily: "NunitoSans",
                //             fontWeight: FontWeight.w600,
                //             fontSize: 12),
                //       ),
                //       borderRadius: BorderRadius.circular(14),
                //       items: const [
                //         DropdownMenuItem(
                //           value: "Like",
                //           child: Text("Like"),
                //         ),
                //         DropdownMenuItem(
                //           child: Text("ShotListed"),
                //           value: "ShotListed",
                //         ),
                //         DropdownMenuItem(
                //           child: Text("who viewed your profile"),
                //           value: "who viewed your profile",
                //         ),
                //         DropdownMenuItem(
                //           child: Text("Matches"),
                //           value: "Matches",
                //         )
                //       ],
                //       onChanged: (value) {
                //         setState(() {
                //           title = value.toString();
                //         });
                //       }),
                //
                //   // InkWell(
                //   //   onTap: () {},
                //   //   child: Container(
                //   //     height: 52,
                //   //     width: 52,
                //   //     decoration: BoxDecoration(
                //   //         borderRadius: BorderRadius.circular(15),
                //   //         border: Border.all(color: kgreyColor)),
                //   //     child: Center(
                //   //         child: SvgPicture.asset("assets/svg/sort_two.svg")),
                //   //   ),
                //   // )
                // )
              ],
            ),
            Gap(Dimentions.height10),
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
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              // child: title == "Like"
              //     ? likeMatches()
              //     : title == "ShortListed"
              //         ? disLikeMatches()
              //         : title == "Matches"
              //             ? matches()
              //             : viewProfileMatches(),
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
      child:FutureBuilder(
          future: likeFuture,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
                 return const Center(child: CircularProgressIndicator(),);
              }
        return  Column(
          children: [
            Gap(Dimentions.height20),
            Row(children: [CustomRadioWidget(title:"Received", onClick: (){}),Gap(10),CustomRadioWidget(title:"Send", onClick: (){}),],),
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
                itemCount: showUserLikeList.length,
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
                                    title: showUserLikeList[index].user!.firstName!,
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
        );
      }),
    );
  }

  SingleChildScrollView disLikeMatches() {
    return SingleChildScrollView(
      child:FutureBuilder(
        future: shortListedFuture,
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          return  Column(
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
                  itemCount: showUserShortListedModel.length,
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
                                      title: showUserShortListedModel[index].user!.firstName!,
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
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 200),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      decoration: const BoxDecoration(
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
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.white),
                                child: const Icon(
                                  Icons.favorite,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
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
          );
        },
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => MatchScreenProfile()));
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
class CustomBottomSeet extends StatelessWidget {
  const CustomBottomSeet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 40, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              title: "Like",
              fontWeight: FontWeight.w600,
              color: kBlackColor,
              fontSize: 18),
          Row(
            children: [
              CustomRadioWidget(
                  title: "Send", onClick: () {
                    if(provider.Send){
                      provider.Send =!provider.Send;
                    }
              }),
              Gap(20),
              CustomRadioWidget(
                title: "Recieve",
                onClick: () {},
              )
            ],
          ),
          Gap(5),
          Divider(height: 1,),
          TextButton(
            onPressed: () {},
            child: CustomText(
                title: "ShortListed",
                fontWeight: FontWeight.w600,
                color: kBlackColor,
                fontSize: 18),
          ),
          Divider(height: 1,),
          TextButton(
            onPressed: (){
              Navigator.pop(context);

            },
            child: CustomText(
                title: "Who viewed your profile",
                fontWeight: FontWeight.w600,
                color: kBlackColor,
                fontSize: 18),
          ),
          Divider(height: 1,),
          TextButton(
            onPressed: (){},
            child: CustomText(
                title: "Matches",
                fontWeight: FontWeight.w600,
                color: kBlackColor,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}


class CustomRadioWidget extends StatelessWidget {
  String title;
  VoidCallback onClick;

  CustomRadioWidget({Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                shape: BoxShape.circle),
          ),
          Gap(5),
          CustomText(
              title: title,
              fontWeight: FontWeight.w500,
              color: kBlackColor,
              fontSize: 16),
        ],
      ),
    );
  }
}
