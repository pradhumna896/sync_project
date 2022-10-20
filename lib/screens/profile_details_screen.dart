import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncdating/components/country_state_picker.dart';

import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_button.dart';
import 'package:syncdating/helper/api_helper.dart';
import 'package:syncdating/helper/api_network.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/model/add_profile_model.dart';
import 'package:syncdating/provider/app_controller.dart';
import 'package:syncdating/screens/about_me_screen.dart';
import 'package:syncdating/screens/friends_screen.dart';
import 'package:syncdating/screens/i_am_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/custom_skip_button.dart';
import '../components/custom_text.dart';

import '../model/show_country_model.dart';
import '../widget/custom_calender.dart';
import '../widget/custom_drop_down.dart';
import '../widget/custom_textfield.dart';
import 'package:http/http.dart'as http;


class ProfileDetailsScreen extends StatefulWidget {
  ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  initState(){
    super.initState();
    getCountry();
  }
  bool isSubmit = false;
  File? pickedImage;
  String chooseimage = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  void addProfileDetails()async{
    if(chooseimage.isEmpty){

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("please Choose Image"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(firstNameController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter First Name"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(lastNameController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Last Name"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(selectedDate.toString().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Choose DOB"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(chooseCountry.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Choose Country"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(chooseState.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Choose State"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(chooseCity.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Choose City"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(religionController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Religion Name"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(casteController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Choose Caste"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(emailController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Email ID"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if(mobileController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Mobile Number"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    setState((){
      isSubmit = true;
    });
    Uri uri = Uri.parse(ApiNetwork.addProfile);
    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll({
      'id':'1',
      'email':emailController.text,
      'first_name':firstNameController.text,
      'last_name':lastNameController.text,
      'dob':selectedDate.toString(),
      'country':chooseCountry,
      'email':emailController.text,
      'state':chooseState,

      'city':chooseCity,
      'religion':religionController.text,
      'coste':casteController.text,
      'mobile':mobileController.text,
    });

    request.files
        .add(await http.MultipartFile.fromPath('image', pickedImage!.path));
    http.StreamedResponse response = await request.send();

    try{
      if(response.statusCode==200){
        setState((){
          isSubmit = false;
        });
        var resp = await response.stream.bytesToString();

        AddProfileModel addData = AddProfileModel.fromJson(jsonDecode(resp));
        print(addData);
        if(addData.message=="profile detail add  successfully"){

          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>IAmScreen()));
        }


      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("SomeThing wrong"),
          backgroundColor: Colors.red,
        ));
      }

    }catch(e){

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please check Internet"),
        backgroundColor: Colors.red,
      ));
      setState((){
        isSubmit = false;
      });

    }

  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
        chooseimage = pickedImage.toString();

      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void showImage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    pickImage(ImageSource.gallery);


                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.photo_camera_back,
                      color: kPrimaryColor,
                    ),
                    title: CustomText(
                        title: "Gallery",
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickImage(ImageSource.camera);

                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.camera_alt,
                      color: kPrimaryColor,
                    ),
                    title: CustomText(
                        title: "Camera",
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                )
              ],
            ),
          );
        });
  }

  DateTime selectedDate = DateTime(2004);

  String birthDate = "Choose birthday date";

  var customFormat = DateFormat('dd-MM-yyyy');

  Future<void> showPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        errorInvalidText: "Please Enter A valid DOB",
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1985),
        lastDate: DateTime(2004));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDate = '${customFormat.format(selectedDate)}';
      });
    }
  }
  List<String> countryName =[];
  List<String>  stateName = ["a","b"];
  List<String>  cityName = ["a","b"];
  List<String>  religionName = ["a","b"];
  List<String>  casteName = ["a","b"];

  late String chooseCountry;
  late String chooseState;
  late String chooseCity;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<AppController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Row(
              children: [
                CustomBackButoon(
                  onclick: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            Gap(20),
            CustomText(
                title: "Profile details",
                fontWeight: FontWeight.w700,
                color: kBlackColor,
                fontSize: 34),
            Gap(30),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: height * 0.13,
                          width: height * 0.13,
                          child: Stack(
                            children: [
                              pickedImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        pickedImage!,
                                        fit: BoxFit.cover,
                                        height: height * 0.12,
                                        width: height * 0.12,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/images/profilepic.png",
                                        height: height * 0.12,
                                        width: height * 0.12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: InkWell(
                                      onTap: () {
                                        showImage();


                                      },
                                      child: SvgPicture.asset(
                                          "assets/svg/camera.svg")))
                            ],
                          )),
                    ],
                  ),
                  Gap(height * 0.05),
                  CustomTextField(
                    controller: firstNameController,
                    label: "First Name",
                    keybordType: TextInputType.name,
                  ),
                  Gap(14),
                  CustomTextField(
                    controller: lastNameController,
                      label: "Last Name", keybordType: TextInputType.name),
                  Gap(10),
                  Container(
                    height: height * 0.065,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Color(0xffFDECEE),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/svg/Calendar.svg"),
                          Gap(height * 0.020),
                          TextButton(
                              onPressed: () {
                                showPicker(context);
                                print(MediaQuery.of(context).size.height);
                              },
                              child: CustomText(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: height * 0.020,
                                title: birthDate,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Gap(10),
                  SelectStateCountry(onCountryChanged: (country){
                    chooseCountry=country.toString();
                    print(chooseCountry);
                    }, onStateChanged: (state){chooseState=state;  } , onCityChanged: (city){chooseCity=city;}),

                 //  CustomDropDown(title: "Country",countryController: countryController, item:countryName, height: height),
                 //  Gap(10),
                 //  CustomDropDown(title: "State",countryController: stateController, item:stateName , height: height),
                 //  Gap(10),
                 // CustomDropDown(title: "City", countryController: cityController, item:cityName, height: height),
                  Gap(10),
                  CustomDropDown(title: "Religion", countryController: religionController, item:religionName, height: height),
                  Gap(10),
                  CustomDropDown(title: "Caste", countryController: casteController, item:casteName , height: height),
                  Gap(10),
                  CustomTextField(
                    controller: emailController,
                      label: "Email", keybordType: TextInputType.text),
                  Gap(5),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                      Icon(
                        Icons.info_outline,
                        color: kPrimaryColor,
                        size: 12,
                      ),
                      Gap(5),
                      Expanded(
                        child: CustomText(
                            title: "Please remember the email-id for further use and for retrieval of your account.",
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                            fontSize: 10),
                      )
                    ],
                  ),
                  const Gap(10),
                  CustomTextField(
                    controller: mobileController,
                      label: "Mobile", keybordType: TextInputType.number),
                  Gap(5),
                  // SelectState(style: TextStyle(
                  //     fontSize: height*0.020,
                  //     fontWeight: FontWeight.w400,
                  //     fontFamily: "Sk-Modernist",
                  //     color: kBlackColor),
                  //   onCountryChanged: (value) {
                  //     setState(() {
                  //       countryValue = value;
                  //     });
                  //   },
                  //   onStateChanged:(value) {
                  //     setState(() {
                  //       stateValue = value;
                  //     });
                  //   },
                  //   onCityChanged:(value) {
                  //     setState(() {
                  //       cityValue = value;
                  //     });
                  //   },
                  //
                  // ),
                  const Gap(30),
                  isSubmit?Center(child: CircularProgressIndicator(),):CustomButton(
                      title: "Confirm",
                      onclick: () {
                        addProfileDetails();

                      })
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
  late String countryValue;
  late String stateValue;
  late String cityValue;
   List<ShowCountryModel> country = [];

   getCountry()async{

    final response = await http.post(Uri.parse(ApiNetwork.showCountry));

    if(response.statusCode==200){

      List jsonResponse = jsonDecode(response.body);
      country = List<ShowCountryModel>.from(jsonResponse.map((e) => ShowCountryModel.fromJson(e)));
      print(country.length);

    }

    if(country.isNotEmpty){
      country.forEach((element) {
        countryName.add(element.name!);
      });
    }
   }
}


