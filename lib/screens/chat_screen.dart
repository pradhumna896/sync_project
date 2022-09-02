import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/screens/photo_fullscreen.dart';

import '../model/message_modal.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  List<Message> messages = [
    Message(
        title:
            "Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄",
        date: DateTime.now(),
        isSendByMe: false,
        time: '10am'),
    Message(
        title: "Sure, let’s do it! 😊", date: DateTime.now(), isSendByMe: false, time: '11:45'),
    Message(title: "Great I will write later the exact time and place. See you soon!", date: DateTime.now(), isSendByMe: true, time: '11:50'),
    Message(
        title: "Hi", date: DateTime.now(), isSendByMe: false, time: '11:55pm'),
    Message(
        title:
            "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ",
        date: DateTime.now(),
        isSendByMe: true,
        time: '12am'),
    Message(title: "Hi", date: DateTime.now(), isSendByMe: false, time: '1pm'),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Gap(20),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>PhotoFullScreen()));
                  },
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color(0xffF27121),
                          Color(0xffE94057),
                          Color(0xff8A2387)
                        ])),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        margin: EdgeInsets.all(2),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(
                            "assets/images/chatphoto.png",
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                ),
                Gap(15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          title: "Grace",
                          fontWeight: FontWeight.w700,
                          color: kBlackColor,
                          fontSize: 24),
                      Row(
                        children: [
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                          ),
                          Gap(5),
                          CustomText(
                              title: "Online",
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              fontSize: 12),
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: kgreyColor)),
                    child: Center(
                      child: SvgPicture.asset("assets/svg/moreone.svg"),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: GroupedListView<Message, DateTime>(
                  groupBy: (messages) => DateTime(
                      messages.date.year, messages.date.month, messages.date.day),
                  elements: messages,
                  groupHeaderBuilder: (Message message) => SizedBox(
                    height: 20,
                    // child: Text(DateFormat.yMMMd().format(message.date)),
                  ),
                  itemBuilder: (context, Message message) => Align(
                    alignment: message.isSendByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: message.isSendByMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Card(
                          margin: EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                              borderRadius: message.isSendByMe
                                  ? BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))
                                  : BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                          elevation: 0,
                          color: message.isSendByMe
                              ? Color(0xffF3F3F3)
                              : Color(0xffFDECEE),

                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CustomText(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kBlackColor,
                                title: message.title),
                          ),
                        ),
                        CustomText(title: message.time, fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 0, 0, 0.4), fontSize: 12)
                      ],
                    ),
                  ),
                )),
            Container(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child:
                              SvgPicture.asset("assets/svg/chatSuffixicon.svg"),
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
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kgreyColor)),
                      child: Center(
                        child: Icon(
                          Icons.mic,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Gap(30)
          ],
        ),
      )),
    );
  }
}
