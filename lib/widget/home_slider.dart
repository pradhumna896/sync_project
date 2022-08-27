
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/provider/app_controller.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(

                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color:data.homeSliderIndex==index? kPrimaryColor: Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                ),
          )),
    );
  }
}
