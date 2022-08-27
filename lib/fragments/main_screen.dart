import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/match_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();
  int counter = 4;

  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
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
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>MatchScreen()));
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
      Gap(40)
    ]);
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
            children: [Container(decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(7)),
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              child: Row(children: [
              SvgPicture.asset("assets/svg/location_icon.svg"),
              const Gap(5),
              CustomText(title: "1 km", fontWeight: FontWeight.w700, color: Colors.white, fontSize: 12)

            ],),)],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
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
