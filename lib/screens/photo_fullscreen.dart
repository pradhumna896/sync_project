import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncdating/components/custom_back_button.dart';
class PhotoFullScreen extends StatelessWidget {
  const PhotoFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Gap(44),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(children: [CustomBackButoon(onclick: (){Navigator.pop(context);})],),
      ),
      Gap(20),
      Expanded(child: PhotoView(
          backgroundDecoration: BoxDecoration(color: Colors.transparent),
          imageProvider: AssetImage("assets/images/profilepicture.png",),filterQuality: FilterQuality.high,)),
      Container(height: 200,)
    ],),);
  }
}
