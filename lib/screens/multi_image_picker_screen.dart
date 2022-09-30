import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/image_modal.dart';
import 'package:syncdating/provider/app_controller.dart';

class MultiImagePickerScreen extends StatefulWidget {
  MultiImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<MultiImagePickerScreen> createState() => _MultiImagePickerScreenState();
}

class _MultiImagePickerScreenState extends State<MultiImagePickerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppController>(context, listen: false).imagesListContent();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Gap(20),
              Row(
                children: [
                  CustomBackButoon(onclick: () {
                    Navigator.pop(context);
                  }),
                ],
              ),
              Gap(20),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: provider.imagesList[0].isSelected
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          provider.imagesList[0].imagePath!,
                          fit: BoxFit.cover,
                        ))
                    : Icon(Icons.camera_alt),
              ),
              Gap(10),
              CustomText(
                  title: "Add Your Photos",
                  fontWeight: FontWeight.w800,
                  color: kBlackColor,
                  fontSize: 18),
              CustomText(
                  title: "Your Photos will be displayed on your profile",
                  fontWeight: FontWeight.w600,
                  color: kBlackColor,
                  fontSize: 14),
              Gap(20),
              Column(
                children: [
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: provider.imagesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 150,
                      childAspectRatio: 3 / 2),
                  itemBuilder: (BuildContext context, index) {
                    return Stack(
                      children: [
                        provider.imagesList[index].isSelected
                            ? Container(
                                margin: EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(
                                    provider.imagesList[index].imagePath!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              showImage(provider.imagesList[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
              Gap(20),
                ],
              ),
              Gap(20)
            ],
          ),
        ),
      ),
    );
  }

  void showImage(ImageModal pickedImage) {
    final provider = Provider.of<AppController>(context, listen: false);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    provider.pickImage(ImageSource.gallery, pickedImage);
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
                    provider.pickImage(ImageSource.camera, pickedImage);
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
}
