import 'package:expandable_slider/expandable_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:photo_card_swiper/models/photo_card.dart';
import 'package:photo_card_swiper/photo_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/provider/app_controller.dart';
import 'package:syncdating/screens/match_screen.dart';

import 'main_screen.dart';
import 'main_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();

  int counter = 4;
  int filter = 0;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackButoon(onclick: () {}),
          Column(
            children: [
              CustomText(
                  title: "Discover",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 24),
              CustomText(
                  title: "Chicago, II",
                  fontWeight: FontWeight.w400,
                  color: kBlackColor,
                  fontSize: 12)
            ],
          ),
          InkWell(
            onTap: () {
              filterWidget(context);
            },
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: kgreyColor)),
              child: Center(
                  child: SvgPicture.asset("assets/svg/massegesicon.svg")),
            ),
          )
        ],
      ),
      SwipeableCardsSection(
        cardController: _cardController,
        enableSwipeUp: true,
        enableSwipeDown: false,
        cardHeightBottomMul: 0,
        cardHeightMiddleMul: 0,
        context: context,
        items: List.generate(10, (index) => SyncCard()),
        onCardSwiped: (dir, index, widget) {
          //Add the next card
          if (counter <= 20) {
            _cardController.addItem(SyncCard());
            counter++;
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => MatchScreen()));
          }

          if (dir == Direction.left) {
            print('onDisliked ${(widget as SyncCard)} $index');
          } else if (dir == Direction.right) {
            print('onLiked ${(widget as SyncCard)} $index');
          } else if (dir == Direction.up) {
            print('onUp ${(widget as SyncCard)} $index');
          } else if (dir == Direction.down) {
            print('onDown ${(widget as SyncCard)} $index');
          }
        },
      ),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: SvgPicture.asset("assets/svg/closeorange.svg"),
            onPressed: () => _cardController.triggerSwipeLeft(),
          ),
          FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: SvgPicture.asset("assets/svg/dilwale.svg"),
            onPressed: () => _cardController.triggerSwipeRight(),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: SvgPicture.asset("assets/svg/star.svg"),
            onPressed: () => _cardController.triggerSwipeUp(),
          ),
        ],
      )),
    ]);
  }

  Future<dynamic> filterWidget(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        CustomText(
                            title: "Filters",
                            fontWeight: FontWeight.w700,
                            color: kBlackColor,
                            fontSize: 24),
                        Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: CustomText(
                              color: kPrimaryColor,
                              title: "Clear",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                    Gap(30),
                    CustomText(
                        title: "Interested in",
                        fontWeight: FontWeight.w700,
                        color: kBlackColor,
                        fontSize: 16),
                    Gap(20),
                    Container(
                      height: 56,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kgreyColor)),
                      child: Row(children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              filter = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    filter == 0 ? kPrimaryColor : Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15))),
                            child: Center(
                                child: CustomText(
                                    title: "Girls",
                                    fontWeight: FontWeight.w700,
                                    color: filter == 0
                                        ? Color(0xffffffff)
                                        : kBlackColor,
                                    fontSize: 14)),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              filter = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: filter == 1 ? kPrimaryColor : Colors.white,
                            ),
                            child: Center(
                                child: CustomText(
                                    title: "Boys",
                                    fontWeight: FontWeight.w700,
                                    color: filter == 1
                                        ? Color(0xffffffff)
                                        : kBlackColor,
                                    fontSize: 14)),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              filter = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    filter == 2 ? kPrimaryColor : Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            child: Center(
                                child: CustomText(
                                    title: "Both",
                                    fontWeight: FontWeight.w700,
                                    color: filter == 2
                                        ? Color(0xffffffff)
                                        : kBlackColor,
                                    fontSize: 14)),
                          ),
                        )),
                      ]),
                    ),
                    Gap(40),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Location",
                          labelStyle: TextStyle(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE8E6EA)),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            title: "Distance",
                            fontWeight: FontWeight.w700,
                            color: kBlackColor,
                            fontSize: 16),
                        CustomText(
                            title: "40km",
                            fontWeight: FontWeight.w400,
                            color: kBlackColor,
                            fontSize: 14),
                      ],
                    ),
                    Gap(20),
                    SizedBox(
                      height: 20,
                      child: ExpandableSlider.adaptive(
                        shrunkWidth: MediaQuery.of(context).size.width,

                        min: 10,
                        max: 100,
                        value: 50,
                        onChanged: (double) {},
                      ),
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            title: "Age",
                            fontWeight: FontWeight.w700,
                            color: kBlackColor,
                            fontSize: 16),
                        CustomText(
                            title: "20-39",
                            fontWeight: FontWeight.w400,
                            color: kBlackColor,
                            fontSize: 14),
                      ],
                    ),
                    Gap(20),
                    SizedBox(
                      height: 20,
                      child: ExpandableSlider.adaptive(

                        shrunkWidth: MediaQuery.of(context).size.width,
                        min: 10,
                        max: 100,
                        value: 50,
                        onChanged: (double) {},
                      ),
                    ),
                    Spacer(),
                    
                    CustomButton(title: "Continue", onclick: (){}),
                    Gap(30)
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class SyncCard extends StatelessWidget {
  SyncCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/synccardimage.png"),
            fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(7)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/svg/location_icon.svg"),
                    const Gap(5),
                    CustomText(
                        title: "1 km",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 12)
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            width: double.maxFinite,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    title: "Jessica Parker, 23",
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 24),
                CustomText(
                    title: "Professional model",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 14)
              ],
            ),
          )
        ],
      ),
    );
  }
}
