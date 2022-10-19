import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/custom_text.dart';
import '../helper/constants.dart';
import '../widget/custom_edit_text.dart';
import 'multi_image_picker_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(children: [
              Gap(20),
              MultiImagePickerScreen(),
              Gap(20),
              LabelText(title: "Name",),
              CustomEditText(),
              Gap(10),
              LabelText(title: "Date Of Birth"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "Country"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "State"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "City"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "Religion"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "Caste"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "Email"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "Mobile"),
              CustomEditText(),
              Gap(10),
              LabelText(title: "About Me"),
              TextFormField(
                maxLines: 5,
                textInputAction: TextInputAction.next,

                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Sk-Modernist",
                    color: kBlackColor),
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(

                    filled: true,
                    fillColor: Colors.grey.shade200,
                    disabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ) ,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ) ,

                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sk-Modernist",
                        color: kBlackColor),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kgreyColor),
                        borderRadius: BorderRadius.circular(15))),
              ),
              Gap(10),
              Row(
                children: [
                  CustomText(
                      title: "Interests",
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                      fontSize: 16)
                ],
              ),
              Gap(10),
              GridView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 50),
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      child: Center(
                          child: CustomText(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              title: "Travelling")),
                    );
                  }),
              Gap(40)
            ],),
          ),
        ),
      ),
    );
  }
}
class LabelText extends StatelessWidget {
  String title;
  LabelText({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [CustomText(title: title, fontWeight: FontWeight.w600, color: kBlackColor, fontSize: 16)],);
  }
}