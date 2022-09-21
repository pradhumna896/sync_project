import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncdating/model/Intrest_modal.dart';

import '../model/image_modal.dart';

class AppController with ChangeNotifier{
  int homeSliderIndex=0;
  void homeSliderIndexStatus(int index){
    homeSliderIndex = index;
    notifyListeners();
  }
  List<InterestsModal> interestsList = [];
  void interestsListContent(){
    interestsList = [
      InterestsModal(title: "Photography", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Shopping", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Karaoke", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Yoga", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Cooking", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Tennis", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Run", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Swimming", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Arts", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Traveling", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Extreme", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Music", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Drink", icon: Icons.photo_camera_outlined, isSelected: false),
      InterestsModal(title: "Video games", icon: Icons.photo_camera_outlined, isSelected: false),

    ];
    notifyListeners();


  }
  updateInterestList(InterestsModal item) {
    int index = interestsList.indexWhere((element) => element.title == item.title);
    interestsList[index].isSelected = !interestsList[index].isSelected;
    notifyListeners();
  }

  int chooseGender = 1;
  void chooseGenderStatus(int index){
    chooseGender = index;
    notifyListeners();
  }

  int bottomNavIndex=0;
void bottomNavStatus(int index){
  bottomNavIndex = index;
  notifyListeners();
}

  String birthDate = "Choose birthday date";
  DateTime chosenDate = DateTime.now();
  void setDOB(String date){
    birthDate =date;
    notifyListeners();
  }


  int filter =0;
  void filterStatus(int index){
    filter = index;
    notifyListeners();
  }

  int isSelected = 0;
  void isSelectedStatus(int index){
    isSelected=index;
    notifyListeners();
  }

  int selectInterest=0;
  void isSelectInterest(){
    selectInterest ++;
  }

  int lookingForSliderIndex=0;
  void lookingForSliderIndexStatus(int index){
    lookingForSliderIndex = index;
    notifyListeners();
  }

  List<ImageModal> imagesList = [];
  void imagesListContent(){
    imagesList = [
      ImageModal( isSelected: false, imagePath: null, id: 0),
      ImageModal( isSelected: false, imagePath: null, id: 1),
      ImageModal( isSelected: false, imagePath: null, id: 2),
      ImageModal( isSelected: false, imagePath: null, id: 3),
      ImageModal( isSelected: false, imagePath: null, id: 4),
      ImageModal( isSelected: false, imagePath: null, id: 5),
      ImageModal( isSelected: false, imagePath: null, id: 6),
      ImageModal( isSelected: false, imagePath: null, id: 7),
      ImageModal( isSelected: false, imagePath: null, id: 8),

    ];
    notifyListeners();


  }
  updateImagetList(ImageModal item) {
    print(item.id);
    print(item.isSelected);
    int index = imagesList.indexWhere((element) => element.id == item.id);
    print(index);
   imagesList[index] = item;

   imagesList.forEach((element) {
     print(element.isSelected);
   });
    notifyListeners();
  }

  File? pickedImage;

  pickImage(ImageSource imageType ,ImageModal image) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      pickedImage = tempImage;
      ImageModal newImageModal = ImageModal(isSelected: true, imagePath:pickedImage, id: image.id);
      print(pickedImage);
      updateImagetList(newImageModal);


    } catch (error) {
      debugPrint(error.toString());
    }
  }
}

