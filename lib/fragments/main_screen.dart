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
import 'package:syncdating/provider/card_provider.dart';
import 'package:syncdating/screens/filtter_screen.dart';
import 'package:syncdating/screens/match_screen.dart';

import '../widget/tinder_card.dart';
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
    final provider = Provider.of<CardProvider>(context);
    final urlImages = provider.urlImage;
    final data = Provider.of<AppController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(children: [
        Gap(20),
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
               Navigator.push(context, MaterialPageRoute(builder: (builder)=> Filter()));
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
        Gap(20),
        Expanded(
          child: Container(
            alignment: Alignment.center,
          
            child: buildCards(),
          ),
        ),
        Gap(20),
        urlImages.isEmpty?Container():buildButtons(),
        Gap(25)
      ]),
    );
  }

  // for buttons
  Widget buildButtons(){
    // final provider = Provider.of<CardProvider>(context);
    // final users = provider.users;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white)),
            onPressed: (){
              final provider = Provider.of<CardProvider>(context,listen: false);
              provider.dislike();
            }, child: Icon(Icons.close,color: Colors.deepOrange,)),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith((states) => Size(75, 75)),
                backgroundColor: MaterialStateColor.resolveWith((states) => kPrimaryColor)),
            onPressed: (){
              final provider = Provider.of<CardProvider>(context,listen: false);
              provider.Like();
            }, child: Icon(Icons.favorite,color:Colors.white ,size: 40,)),
        ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white)),
            onPressed: (){
              final provider = Provider.of<CardProvider>(context,listen: false);
              provider.superLike();
            }, child: Icon(Icons.star,color: Color(0xff8A2387),))
      ],
    );
  }

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final urlImages = provider.urlImage;
    return urlImages.isEmpty? CustomButton(title: "Restart", onclick: (){
      final provider = Provider.of<CardProvider>(context,listen: false);
      provider.resetUsers();
    }):Stack(
      children:
          urlImages.map((urlImage) => TinderCard(urlImage: urlImage,
          isFront: urlImages.last == urlImage,

          )).toList(),
    );
  }


}

class SyncCard extends StatelessWidget {
  SyncCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/synccardimage.png",
            ),
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
/*
SwipeableCardsSection(
        cardController: _cardController,
        enableSwipeUp: false,
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
          Material(
            borderRadius: BorderRadius.circular(55),
            elevation: 5,
            child: InkWell(
              borderRadius: BorderRadius.circular(55),
              onTap: () {_cardController.triggerSwipeLeft();},
              child: Container(
                height: 55,
                width: 55,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset("assets/svg/closeorange.svg"),
                ),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(80),
            elevation: 5,
            child: InkWell(
              borderRadius: BorderRadius.circular(80),
              onTap: () {_cardController.triggerSwipeRight();},
              child: Container(
                height: 80,
                width: 80,
                decoration:
                    BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/dilwale.svg",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(55),
            elevation: 5,
            child: InkWell(
              borderRadius: BorderRadius.circular(55),
              onTap: () {_cardController.triggerSwipeUp();},
              child: Container(
                height: 55,
                width: 55,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset("assets/svg/star.svg"),
                ),
              ),
            ),
          ),
        ],
      )),
 */
