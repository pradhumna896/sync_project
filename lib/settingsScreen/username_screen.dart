import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/widget/custom_appbar_title.dart';
import 'package:syncdating/widget/custom_textfield.dart';

import '../helper/dimentions/dimentions.dart';

class UserNameScreen extends StatelessWidget {
   UserNameScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: CustomAppbarTitle(title: "Username"),
        centerTitle: true,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
      ),
      body: Column(
        children: [
          Gap(30),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: CustomTextField(
              controller:controller ,
                keybordType: TextInputType.name, label: "Sync.com/@"),
          ),
          Gap(50),
          TextButton(
              onPressed: () {},
              child: CustomText(
                  title: "Confirm",
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                  fontSize:Dimentions.font16)),
          Gap(10),
          TextButton(
              onPressed: () {},
              child: CustomText(
                  title: "Delete",
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                  fontSize: Dimentions.font16))
        ],
      ),
    );
  }
}
