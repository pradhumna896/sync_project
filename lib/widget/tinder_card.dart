import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/profile_screen.dart';

import '../components/custom_text.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
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
                children: [buildCard(), buildStamps()],
              ));
        }),
        onPanStart: (details) {
          print("object");
          final provider = Provider.of<CardProvider>(
            context,
            listen: false,
          );
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                },
                child: Container(
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
          title: "LIKE",
          iconColor: kPrimaryColor,
          opacity: opacity,
        );

        return Positioned(left: 20, top: 40, child: child);
      case CardStatus.Dislike:
        final child = buildStamp(
          angle: 0.5,
          color: kPrimaryColor,
          title: "NOPE",
          iconColor: Colors.deepOrange,
          opacity: opacity,
        );

        return Positioned(top: 40,right: 20, child: child);
      case CardStatus.SuperLike:
        final child = buildStamp(
          color: kPrimaryColor,
          title: "SHORTLISTED",
          iconColor: Colors.deepOrange,
          opacity: opacity,
        );

        return Positioned(top: 20,left: 60, child: child);
      default:
        return Container();
    }
  }

  Widget buildStamp({
    double angle = 0,
    required Color color,
    required String title,
    required Color iconColor,
    required double opacity,
  }) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              ),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, ),
                child: Center(
                  child: CustomText(
                      title: title,
                      color: kPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
