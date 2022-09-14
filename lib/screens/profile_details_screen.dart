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

// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/provider/app_controller.dart';
import 'package:syncdating/screens/about_me_screen.dart';
import 'package:syncdating/screens/friends_screen.dart';
import 'package:syncdating/screens/i_am_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/custom_skip_button.dart';
import '../components/custom_text.dart';
import '../widget/custom_calender.dart';
import '../widget/custom_textfield.dart';
import 'multi_image_picker_screen.dart';

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
                  onTap: () {
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.photo_camera_back,
                      color: kPrimaryColor,
                    ),
                    title: CustomText(
                        title: "Gallery",
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.camera_alt,
                      color: kPrimaryColor,
                    ),
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

  DateTime selectedDate = DateTime(2004);

  String birthDate = "Choose birthday date";

  var customFormat = DateFormat('dd-MM-yyyy');

  Future<void> showPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        errorInvalidText: "Please Enter A valid DOB",
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1985),
        lastDate: DateTime(2004));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDate = '${customFormat.format(selectedDate)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<AppController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
            Gap(30),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: height * 0.13,
                          width: height * 0.13,
                          child: Stack(
                            children: [
                              pickedImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        pickedImage!,
                                        fit: BoxFit.cover,
                                        height: height * 0.12,
                                        width: height * 0.12,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/images/profilepic.png",
                                        height: height * 0.12,
                                        width: height * 0.12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                     MultiImagePickerScreen()));
                                      },
                                      child: SvgPicture.asset(
                                          "assets/svg/camera.svg")))
                            ],
                          )),
                    ],
                  ),
                  Gap(height * 0.05),
                  CustomTextField(
                    label: "First Name",
                    keybordType: TextInputType.name,
                  ),
                  Gap(14),
                  CustomTextField(
                      label: "Last Name", keybordType: TextInputType.name),
                  Gap(10),
                  Container(
                    height: height * 0.065,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Color(0xffFDECEE),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/svg/Calendar.svg"),
                          Gap(height * 0.020),
                          TextButton(
                              onPressed: () {
                                showPicker(context);
                                print(MediaQuery.of(context).size.height);
                              },
                              child: CustomText(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: height * 0.020,
                                title: birthDate,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Gap(10),
                  CustomTextField(
                    label: "Country",
                    keybordType: TextInputType.text,
                  ),
                  Gap(10),
                  CustomTextField(
                    label: "State",
                    keybordType: TextInputType.text,
                  ),
                  Gap(10),
                  CustomTextField(
                      label: "City", keybordType: TextInputType.text),
                  Gap(10),
                  CustomTextField(
                    label: "Religion",
                    keybordType: TextInputType.text,
                  ),
                  Gap(10),
                  CustomTextField(
                    label: "Caste",
                    keybordType: TextInputType.text,
                  ),
                  Gap(10),
                  CustomTextField(
                      label: "Email", keybordType: TextInputType.text),
                  const Gap(10),
                  CustomTextField(
                      label: "Mobile", keybordType: TextInputType.number),
                  const Gap(30),
                  CustomButton(
                      title: "Confirm",
                      onclick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IAmScreen()));
                      })
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
