import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/widget/custom_textfield.dart';

class ChangeNumberScreen extends StatelessWidget {
  const ChangeNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
        title: CustomText(
            color: kBlackColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            title: "Change Number"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Gap(height * 0.1),
              Image.asset(
                "assets/images/synclogo.png",
                height: height * 0.12,
                width: height * 0.12,
              ),
              Gap(40),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                children: [
                    CustomTextField(
                        label: "Enter Current Number",
                        keybordType: TextInputType.phone),
                    Gap(20),
                    CustomTextField(
                        label: "Enter New Number",
                        keybordType: TextInputType.phone),
                ],
              ),
                  )),
              CustomButton(title: "Update Number", onclick: () {}),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
