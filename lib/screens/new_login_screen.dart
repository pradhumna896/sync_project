import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

import '../components/custom_logo_container.dart';
import '../helper/dimentions/dimentions.dart';
import 'my_gmail_screen.dart';

class NewLoginScreen extends StatelessWidget {
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/loginbgimage.png"),fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              CustomButton(title: "Sign In", onclick: (){Navigator.push(context,MaterialPageRoute(builder: (ctx)=>MyGmailScreen()));}),
              Gap(10),
              CustomText(title: "Or",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: kBlackColor,),
              Gap(10),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: Dimentions.width40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Gap(Dimentions.height5),

                    CustomLogoContainer(
                      image: 'assets/svg/facebook.svg', onclick: () {  },
                    ),
                    Gap(Dimentions.height20),
                    CustomLogoContainer(
                      image: 'assets/svg/google.svg', onclick: () {  },
                    ),
                    Gap(Dimentions.height20),
                    CustomLogoContainer(
                      image: 'assets/svg/apple.svg', onclick: () {  },
                    ),
                    Gap(Dimentions.height5)
                  ],
                ),
              ),
              Gap(29)

            ],),
        )
    );
  }
}
