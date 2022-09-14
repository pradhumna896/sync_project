import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmojiController extends GetxController{
  var isEmogiVisible = false.obs;
  FocusNode focusNode = FocusNode();

  TextEditingController textEditingController =TextEditingController();

  @override
  void onInit(){
    super.onInit();
    focusNode.addListener(() {
      isEmogiVisible.value =false;
    });
  }

  @override
  void onReady(){
    super.onReady();
  }
  @override
  void onClose(){
    textEditingController.dispose();
  }
}