import 'package:flutter/material.dart';

class LookingForModal{
  String title;
  String icon;
  String image;
  LookingForModal({required this.title,required this.icon, required this.image});
  
  
  static  List<LookingForModal> lookingForModalList = [
    LookingForModal(title: "Male", icon:"assets/LookingForimages/malesignWhiteColor.svg", image: 'assets/LookingForimages/rafiki.svg' ),
    LookingForModal(title: "Female", icon:"assets/LookingForimages/femalesign.svg", image: 'assets/LookingForimages/pana.svg' ),
    LookingForModal(title: "Both", icon:"assets/LookingForimages/bothsign.svg", image: 'assets/LookingForimages/both.svg' ),
  ];
}