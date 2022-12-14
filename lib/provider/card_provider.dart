import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncdating/helper/api_network.dart';
import 'package:http/http.dart'as http;
import 'package:syncdating/model/like_dislike_model.dart';
enum CardStatus {Like,Dislike,SuperLike}

class CardProvider extends ChangeNotifier {
  List<String> _urlImage = [];

  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<String> get urlImage => _urlImage;

  bool get isDragging => _isDragging;

  Offset get position => _position;

  double get angle => _angle;

  CardProvider() {
    resetUsers();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    print(details);
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    _isDragging =false;
    notifyListeners();
    final status = getStatus(force: true);

    if(status != null){
      print("object");
      // Fluttertoast.cancel();
      // Fluttertoast.showToast(msg: status.toString().split('.').last.toUpperCase(),fontSize: 36,);





    }

    switch (status){
      case CardStatus.Like:
      Like();
      break;
      case CardStatus.Dislike:
        dislike();
        break;
      case CardStatus.SuperLike:
        superLike();
        break;
      default:
    }
    resetPosition();
  }
  void Like(){
    _angle=20;
    _position += Offset(2*_screenSize.width, 0);
    _nextCard();
    addLikeDislike('1');
    notifyListeners();
  }
  void superLike() {
    _angle = 0;
    _position -= Offset(0,_screenSize.height);
    _nextCard();
    addLikeDislike('2');
    notifyListeners();
  }
  void dislike(){
    _angle = -20;
    _position -= Offset(2*_screenSize.width,0);
    _nextCard();
    addLikeDislike('0');
    notifyListeners();
  }

  Future _nextCard() async{
    if(_urlImage.isEmpty) return;
    await Future.delayed(Duration(milliseconds: 200));
    _urlImage.removeLast();
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;

    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }

  double getStatusOpacity(){
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    final opacity = pos/delta;
    return min(opacity, 1);
  }


  CardStatus? getStatus({bool force = false}){
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() <20;

    if(force){
  final delta = 100;


  if(x>= delta){
  return CardStatus.Like;
  }else if(x<= -delta){
  return CardStatus.Dislike;
  }else if(y <= -delta /2 && forceSuperLike){
  return CardStatus.SuperLike;
  }
  }else{
  final delta = 20;


  if(x>= delta){
  return CardStatus.Like;
  }else if(x<= -delta){
  return CardStatus.Dislike;
  }else if(y <= -delta /2 && forceSuperLike){
  return CardStatus.SuperLike;
  }
  }
  }
  void resetUsers() {
    _urlImage = <String>[
      'assets/images/synccardimage.png',
      'assets/images/girl1.png',
      'assets/images/photo4.png',
      'assets/images/girl5.png',
      'assets/images/photo6.png',
      'assets/images/synccardimage.png',
      'assets/images/girl1.png',
      'assets/images/photo4.png',
      'assets/images/girl5.png',
      'assets/images/photo6.png',
      'assets/images/synccardimage.png',
      'assets/images/girl1.png',
      'assets/images/photo4.png',
      'assets/images/girl5.png',
      'assets/images/photo6.png',

    ].reversed.toList();
    notifyListeners();
  }

  addLikeDislike(likeStatus)async{
    Uri uri = Uri.parse(ApiNetwork.likeDislike);
    Map<String , String> map = {
      'user_id':"1",
      'profile_id':'1',
      'like_status':likeStatus
    };
    final response = await http.post(uri,body:map);

    if(response.statusCode==200){
      LikeDislikeModel addLike = LikeDislikeModel.fromJson(jsonDecode(response.body));
      if(addLike.result==" Successfull"){
        print(addLike.likeStatus);
      }
    }

  }
}
