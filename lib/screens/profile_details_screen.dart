

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/provider/app_controller.dart';
import 'package:syncdating/screens/about_me_screen.dart';
import 'package:syncdating/screens/i_am_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/custom_skip_button.dart';
import '../widget/custom_calender.dart';

class ProfileDetailsScreen extends StatefulWidget {
  ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
 File? pickedImage;


 pickImage(ImageSource imageType) async {
   try {
     final photo = await ImagePicker().pickImage(source: imageType);
     if (photo == null) return;
     final tempImage = File(photo.path);
     setState(() {
       pickedImage = tempImage;
     });

     Get.back();
   } catch (error) {
     debugPrint(error.toString());
   }
 }
  void showImage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo_camera_back,color: kPrimaryColor,),
                    title: CustomText(
                        title: "Gallery",
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),

                  ),
                ),
                InkWell(
                  onTap: (){
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);

                  },
                  child: ListTile(
                    leading: Icon(Icons.camera_alt,color: kPrimaryColor,),
                    title: CustomText(
                        title: "Camera",
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),

                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomSkipButton(
                    onclick: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => IAmScreen()));
                    },
                  )
                ],
              ),
              Gap(20),
              CustomText(
                  title: "Profile details",
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                  fontSize: 34),
              Gap(90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 110,
                    width: 105,
                    child:Stack(
                      children: [
                        pickedImage != null?ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(pickedImage!,fit: BoxFit.cover,height: 99,
                            width: 99,),):Image.asset(
                          "assets/images/profilepic.png",
                          height: 99,
                          width: 99,
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                                onTap: () {
                                  showImage();


                                },
                                child: SvgPicture.asset(
                                    "assets/svg/camera.svg")))
                      ],
                    )
                  ),
                ],
              ),
              Gap(50),
              TextFormField(
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Sk-Modernist",
                    color: kBlackColor),
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "First Name",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sk-Modernist",
                        color: kBlackColor),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kgreyColor),
                        borderRadius: BorderRadius.circular(15))),
              ),
              Gap(14),
              TextFormField(
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Sk-Modernist",
                    color: kBlackColor),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sk-Modernist",
                        color: kBlackColor),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kgreyColor),
                        borderRadius: BorderRadius.circular(15))),
              ),
              Gap(10),
              Container(
                height: 56,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color(0xffFDECEE),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/Calendar.svg"),
                      Gap(20),
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(40))),
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext ctx) {
                                  return const CustomTableCalender();
                                });
                          },
                          child: CustomText(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            title: provider.birthDate,
                          ))
                    ],
                  ),
                ),
              ),
              const Gap(60),
              CustomButton(
                  title: "Confirm",
                  onclick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutMeScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}


