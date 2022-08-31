import 'package:flutter/cupertino.dart';

class AppController with ChangeNotifier{
  int homeSliderIndex=0;
  void homeSliderIndexStatus(int index){
    homeSliderIndex = index;
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