import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:syncdating/helper/api_network.dart';
import 'package:syncdating/helper/sessionmanager.dart';

import '../components/custom_text.dart';
import '../helper/constants.dart';
import '../model/show_profile_model.dart';
import '../widget/custom_edit_text.dart';
import 'multi_image_picker_screen.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  initState(){
    super.initState();
    getProfileFuture = getProfile();

  }
  late Future<ShowProfileModel> getProfileFuture;
  Future<ShowProfileModel> getProfile()async{
    Uri uri = Uri.parse(ApiNetwork.showProfile);
    Map<String , String> map = {
      'user_id':SessionManager.getUserID()
    };
    final response = await http.post(uri,body: map);
    var data = jsonDecode(response.body);
    print(SessionManager.getUserID());
    print(data);
    if(response.statusCode == 200){
      return ShowProfileModel.fromJson(data);
    }else{
      return ShowProfileModel.fromJson(data);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:FutureBuilder<ShowProfileModel>(
              future: getProfileFuture,
              builder: (context , snapshot){


                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                print(snapshot.data!.path!+snapshot.data!.image!);
                nameController.text = "${snapshot.data!.firstName!} ${snapshot.data!.lastName!}";
                dateOfBirthController.text = snapshot.data!.dob!.replaceAll(" 00:00:00.000", "");
                countryController.text = snapshot.data!.country!;
                stateController.text = snapshot.data!.state!;
                cityController.text = snapshot.data!.city!;
                religionController.text =snapshot.data!.religion!;
                casteController.text = snapshot.data!.cast!;
                emailController.text = snapshot.data!.email!;
                mobileController.text = snapshot.data!.mobile!;
                aboutController.text = snapshot.data!.about!;
                SessionManager.setImage(snapshot.data!.path!+snapshot.data!.image!);

                return  Column(children: [
                  const Gap(20),
                  MultiImagePickerScreen(),
                  const Gap(20),
                  LabelText(title: "Name",),
                  CustomEditText(controller: nameController),
                  const Gap(10),
                  LabelText(title: "Date Of Birth"),
                  CustomEditText(controller: dateOfBirthController),
                  const Gap(10),
                  LabelText(title: "Country"),
                  CustomEditText(controller: countryController),
                  const Gap(10),
                  LabelText(title: "State"),
                  CustomEditText(controller: stateController,),
                  const Gap(10),
                  LabelText(title: "City"),
                  CustomEditText(controller: cityController,),
                  const Gap(10),
                  LabelText(title: "Religion"),
                  CustomEditText(controller: religionController,),
                  const Gap(10),
                  LabelText(title: "Caste"),
                  CustomEditText(controller: casteController,),
                  const Gap(10),
                  LabelText(title: "Email"),
                  CustomEditText(controller: emailController,),
                  const Gap(10),
                  LabelText(title: "Mobile"),
                  CustomEditText(controller: mobileController,),
                  const Gap(10),
                  LabelText(title: "About Me"),
                  TextFormField(
                    controller: aboutController,
                    maxLines: 5,
                    textInputAction: TextInputAction.next,

                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sk-Modernist",
                        color: kBlackColor),
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "hello",

                        filled: true,
                        fillColor: Colors.grey.shade200,
                        disabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ) ,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ) ,

                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Sk-Modernist",
                            color: kBlackColor),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: kgreyColor),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      CustomText(
                          title: "Interests",
                          fontWeight: FontWeight.w700,
                          color: kBlackColor,
                          fontSize: 16)
                    ],
                  ),
                  const Gap(10),
                  GridView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          mainAxisExtent: 50),
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          child: Center(
                              child: CustomText(
                                  color: kPrimaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  title: "Travelling")),
                        );
                      }),
                  const Gap(40)
                ],);
              },
            ),
          ),
        ),
      ),
    );
  }
}
class LabelText extends StatelessWidget {
  String title;
  LabelText({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [CustomText(title: title, fontWeight: FontWeight.w600, color: kBlackColor, fontSize: 16)],);
  }
}