import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_button.dart';
import '../provider/card_provider.dart';
import '../widget/tinder_card.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) =>Scaffold(body:
    SafeArea(
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(40),
          child: buildCards()),
    ),);
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
