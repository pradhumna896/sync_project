import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncdating/model/Intrest_modal.dart';

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
}