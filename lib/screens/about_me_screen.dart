import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/components/custom_skip_button.dart';
import 'package:syncdating/helper/api_network.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/model/about_me_model.dart';
import 'package:syncdating/screens/i_am_screen.dart';
import 'package:syncdating/screens/passions_screen.dart';

import '../components/custom_back_button.dart';
import '../components/custom_text.dart';
import 'package:http/http.dart' as http;

const List<String> list = ["Current Location","Job", "Study"];
const List<String> list1 = ["Permanent Location","zone-I", "zone-II"];

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  String dropdownValue = list.first;
  String dropdownValue1 = list1.first;

  postAbout()async{
    if(aboutMeController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Enter About You"),
        backgroundColor: Colors.red,
      ));
      return;
    }
   try{
     Uri uri  = Uri.parse(ApiNetwork.aboutMe);
     Map<String , String > map ={
       'id':'1',
       'about':aboutMeController.text,
     };
     final response = await http.post(uri,body: map);
     if(response.statusCode==200){
       AboutMeModel aboutMe = AboutMeModel.fromJson(jsonDecode(response.body));
       if(aboutMe.message=="Successfully"){
         Navigator.push(context, MaterialPageRoute(builder: (builder)=>PassionsScreen()));

       }else{
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
           content: Text("Something Wrong"),
           backgroundColor: Colors.red,
         ));
         return;

       }
     }
   }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Check Internet Connection")));
   }

  }
  TextEditingController aboutMeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomBackButoon(onclick: () {
                  Navigator.pop(context);
                }),
                // CustomSkipButton(
                //   onclick: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (builder) => const PassionsScreen()));
                //   },
                // )
              ],
            ),
            Gap(30),
            CustomText(
                title: "About me",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 34),
            // DropdownButton<String>(
            //     value: dropdownValue,
            //     items: chooseLocation.map<DropdownMenuItem<String>>((String value){
            //       print(value);
            //       return DropdownMenuItem<String>(
            //           value:value,
            //           child: Text(value)
            //       );}).toList(),
            //     onChanged: (String? Value){}
            // )
            Gap(10),
            TextFormField(
              controller: aboutMeController,
              maxLength: 500,
              maxLines: 5,
              decoration: InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            Spacer(),

            CustomButton(title:"Confirm",onclick: (){
              postAbout();

            },),
            Gap(20)
          ],
        ),
      )),
    );
  }
}
