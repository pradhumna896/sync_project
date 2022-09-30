import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:syncdating/provider/emoji_controller.dart';

import '../helper/constants.dart';

class EmojiWidget extends GetView<EmojiController> {
  EmojiController controller = EmojiController();



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()async{

        if(controller.isEmogiVisible.value){
          controller.isEmogiVisible.value = false;
        }else{
          Navigator.pop(context);
        }
        return true;

      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 48,
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.textEditingController,
                  focusNode: controller.focusNode,
                  onTap: (){

                  },
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: InkWell(
                            onTap: () {
                              controller.isEmogiVisible.value =
                                  !controller.isEmogiVisible.value;
                              controller.focusNode.unfocus();
                              controller.focusNode.canRequestFocus = true;
                            },
                            child: Icon(
                              Icons.emoji_emotions_outlined,
                              color: kPrimaryColor,
                            )),
                      ),
                      hintText: "Your message",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Sk-Modernist"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )),
                Gap(10),
                InkWell(
                  onTapCancel: (){
                    controller.isEmogiVisible.value = !controller.isEmogiVisible.value;
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: kgreyColor)),
                    child: Center(
                      child: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(() => Offstage(
                offstage: !controller.isEmogiVisible.value,
                child: SizedBox(
                  height: 250,
                  child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        controller.textEditingController.text =
                            controller.textEditingController.text + emoji.emoji;
                      },
                      onBackspacePressed: () {},
                      config: Config(
                          columns: 7,
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                          verticalSpacing: 0,
                          horizontalSpacing: 0,
                          gridPadding: EdgeInsets.zero,
                          initCategory: Category.RECENT,
                          bgColor: const Color(0xFFF2F2F2),
                          indicatorColor: Colors.blue,
                          iconColor: Colors.grey,
                          iconColorSelected: Colors.blue,
                          // progressIndicatorColor: Colors.blue,
                          backspaceColor: Colors.blue,
                          skinToneDialogBgColor: Colors.white,
                          skinToneIndicatorColor: Colors.grey,
                          enableSkinTones: true,
                          showRecentsTab: true,
                          recentsLimit: 28,
                          replaceEmojiOnLimitExceed: false,
                          noRecents: const Text(
                            'No Recents',
                            style: TextStyle(fontSize: 20, color: Colors.black26),
                            textAlign: TextAlign.center,
                          ),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL)),
                ),
              )),
        ],
      ),
    );
  }
}
