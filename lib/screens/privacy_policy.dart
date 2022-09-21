import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              Row(
                children: [
                  CustomBackButoon(onclick: () {
                    Navigator.pop(context);
                  }),
                ],
              ),
              Gap(10),
              CustomText(
                  title: "Privacy Policy",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 24),
              Gap(10),
              Expanded(
                  child: Container(
                child: CustomText(
                    title:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis integer nulla amet, aenean. Cum a ut auctor id. Egestas amet faucibus faucibus sit lectus nunc. Vulputate suspendisse ipsum bibendum est mattis. Facilisis a at pulvinar scelerisque varius porta tincidunt. Eu sagittis, nulla libero, tempor, leo at. Amet luctus sagittis aliquet magna quam turpis non. Orci tortor lorem amet, a. Risus tempor odio viverra aliquet volutpat. Netus ornare quam ultrices scelerisque ornare arcu, est cursus. Cras lacus pretium posuere nibh eleifend auctor velit. Morbi elit sed molestie sit turpis. Platea pulvinar risus, hac amet, diam enim non. Sagittis libero nisl, ante ultrices suspendisse cras ac lacus semper. Adipiscing egestas cursus at ultrices dis parturient fringilla nulla ut. Cras praesent viverra semper sed sed nunc eu nibh ultricies. Luctus arcu orci, fermentum vitae. Quis egestas mauris, auctor et. Vel ultrices risus facilisi mattis consectetur pretium nam odio morbi. At vitae mattis non molestie tellus quisque fringilla. Ac nisi, a interdum adipiscing dignissim a magna in. Nulla donec mollis auctor nec. rmentum vitae. Quis egestas mauris, auctor et. Vel ultrices risus facilisi mattis.",
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    fontSize: 14),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
