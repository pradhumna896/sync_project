import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/sessionmanager.dart';
import 'package:syncdating/model/image_modal.dart';
import 'package:syncdating/provider/app_controller.dart';

import '../widget/custom_edit_text.dart';
import '../widget/custom_textfield.dart';
import 'edit_profile_screen.dart';

class MultiImagePickerScreen extends StatefulWidget {

  MultiImagePickerScreen({Key? key,}) : super(key: key);

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
    double height = MediaQuery.of(context).size.height;
    final provider = Provider.of<AppController>(context);
    return Column(
      children: [
        Gap(20),
        Row(
          children: [
            CustomBackButoon(onclick: () {
              Navigator.pop(context);
            }),
          ],
        ),
        Gap(10),
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
              : ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(SessionManager.getImage(),fit: BoxFit.cover,)
              // Image.network(widget.image,fit: BoxFit.cover,)
          ),
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


        Column(
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.imagesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 120,
                    childAspectRatio: 3 / 2),
                itemBuilder: (BuildContext context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      provider.imagesList[index].isSelected
                          ? Container(
                        margin: const EdgeInsets.all(5),
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            provider.imagesList[index].imagePath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                          : Container(
                        margin: const EdgeInsets.all(5),
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
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kPrimaryColor),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),

          ],
        ),
        // Gap(20),
        // Gap(20),
        // LabelText(title: "Name",),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "Date Of Birth"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "Country"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "State"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "City"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "Religion"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "Caste"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "Email"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "Mobile"),
        // CustomEditText(),
        // Gap(10),
        // LabelText(title: "About Me"),
        // TextFormField(
        //   maxLines: 5,
        //   textInputAction: TextInputAction.next,
        //
        //   style: TextStyle(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w400,
        //       fontFamily: "Sk-Modernist",
        //       color: kBlackColor),
        //   cursorColor: kPrimaryColor,
        //   decoration: InputDecoration(
        //
        //       filled: true,
        //       fillColor: Colors.grey.shade200,
        //       disabledBorder:OutlineInputBorder(
        //         borderSide: BorderSide(color: Colors.white),
        //         borderRadius: BorderRadius.circular(15),
        //       ) ,
        //       focusedBorder: OutlineInputBorder(
        //         borderSide: BorderSide(color: Colors.white),
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       enabledBorder:OutlineInputBorder(
        //         borderSide: BorderSide(color: Colors.white),
        //         borderRadius: BorderRadius.circular(15),
        //       ) ,
        //
        //       labelStyle: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.w400,
        //           fontFamily: "Sk-Modernist",
        //           color: kBlackColor),
        //       border: OutlineInputBorder(
        //           borderSide: BorderSide(color: kgreyColor),
        //           borderRadius: BorderRadius.circular(15))),
        // ),
        // Gap(10),
        // Row(
        //   children: [
        //     CustomText(
        //         title: "Interests",
        //         fontWeight: FontWeight.w700,
        //         color: kBlackColor,
        //         fontSize: 16)
        //   ],
        // ),
        // Gap(10),
        // GridView.builder(
        //     padding: EdgeInsets.all(0),
        //     itemCount: 5,
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     gridDelegate:
        //     const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 3,
        //         crossAxisSpacing: 5,
        //         mainAxisSpacing: 5,
        //         mainAxisExtent: 50),
        //     itemBuilder: (BuildContext context, index) {
        //       return Card(
        //         child: Center(
        //             child: CustomText(
        //                 color: kPrimaryColor,
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w700,
        //                 title: "Travelling")),
        //       );
        //     }),
        // Gap(40)
      ],
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
                    leading: const Icon(
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


