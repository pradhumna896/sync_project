import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

import '../provider/card_provider.dart';

class TinderCard extends StatefulWidget {
  final String urlImage;
  final bool isFront;

  const TinderCard({Key? key, required this.urlImage, required this.isFront})
      : super(key: key);

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context,listen: false);
      provider.setScreenSize(size);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: widget.isFront ? buildFrontCard() : buildCard(),
    );
  }

  Widget buildFrontCard() => GestureDetector(
        child: LayoutBuilder(builder: (context, constraints) {
          final provider = Provider.of<CardProvider>(context);
          final position = provider.position;
          final milliseconds = provider.isDragging ? 0 : 0;

          final center = constraints.smallest.center(Offset.zero);
          final angle = provider.angle * pi / 180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dx)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dx);
          return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: milliseconds),
              transform: rotatedMatrix..translate(position.dx, position.dy),
              child: Stack(
                children: [
                  buildCard(),
                  buildStamps()],
              ));
        }),
        onPanStart: (details) {
          print("object");
          final provider = Provider.of<CardProvider>(context, listen: false,);
          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.endPosition();
        },
      );

  Widget buildCard() => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.urlImage),
                fit: BoxFit.cover,
                alignment: Alignment(-0.3, 0)),
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
        ),
      );

  Widget buildStamps() {
    final provider = Provider.of<CardProvider>(context);
    final status = provider.getStatus();
    final opacity = provider.getStatusOpacity();

    switch (status) {
      case CardStatus.Like:
        final child = buildStamp(
            angle: -0.5,
            color: kPrimaryColor,
            iconImage: Icon(Icons.favorite,color: kPrimaryColor,),
            iconColor: kPrimaryColor,
            opacity:opacity,
        );

        return Align(
            alignment: Alignment.center,
            child: child);
      case CardStatus.Dislike:
        final child = buildStamp(
            angle: 0.5,
            color: kPrimaryColor,
            iconImage: Icon(Icons.close,color: Colors.deepOrange,),
            iconColor: Colors.deepOrange,
          opacity:opacity,
        );

        return Align(alignment: Alignment.center, child: child);
      case CardStatus.SuperLike:
        final child = buildStamp(

            color: kPrimaryColor,
            iconImage: Icon(Icons.star),
            iconColor: Colors.deepOrange,
          opacity:opacity,
        );

        return Align(alignment: Alignment.center, child: child);
      default:
        return Container();
    }
  }

  Widget buildStamp({
    double angle = 0,
    required Color color,
    required Icon iconImage,
    required Color iconColor,
    required double opacity,
  }) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: iconImage, ),
      ),
    );
  }
}