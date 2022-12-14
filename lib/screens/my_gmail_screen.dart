import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/helper/api_network.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';
import 'package:syncdating/helper/sessionmanager.dart';
import 'package:syncdating/model/check_email_model.dart';
import 'package:syncdating/model/sign_in_model.dart';
import 'package:syncdating/model/sign_up_model.dart';
import 'package:syncdating/screens/home_screen.dart';
import 'package:syncdating/screens/password_screen.dart';
import 'package:syncdating/screens/profile_details_screen.dart';
import 'package:syncdating/widget/custom_textfield.dart';

import '../components/custom_back_button.dart';
import '../components/custom_button.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_logo_container.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import 'gmail_new_user_screen.dart';
import 'otp_screen.dart';
import 'package:http/http.dart' as http;

class MyGmailScreen extends StatefulWidget {
  MyGmailScreen({Key? key}) : super(key: key);

  @override
  State<MyGmailScreen> createState() => _MyGmailScreenState();
}

class _MyGmailScreenState extends State<MyGmailScreen> {
  final _formkey = GlobalKey<FormState>();

  bool email = false;
  bool isNotExit = false;
  bool isSubmit = false;

  var isNot = "@";
  TextEditingController emailController = TextEditingController();
  TextEditingController passlController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void checkEmail() async {
    setState(() {
      isSubmit = true;
    });
    if (emailController.text.isEmpty) {
      setState(() {
        isSubmit = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Email ID"),
        backgroundColor: Colors.red,
      ));

      return;
    }

    try {
      Uri uri = Uri.parse(ApiNetwork.checkEmail);
      Map<String, String> map = {
        'email': emailController.text,
      };
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        setState(() {
          isSubmit = false;
        });
        CheckEmailModel check =
            CheckEmailModel.fromJson(jsonDecode(response.body));
        if (check.result == "Already Register") {
          setState(() {
            email = true;
          });
          print("${email} email");
        } else {
          setState(() {
            isNotExit = true;
          });
          print("${isNotExit} isNotemail");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Some thing wrong"),
          backgroundColor: Colors.red,
        ));
        setState(() {
          isSubmit = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("please check Internet"),
        backgroundColor: Colors.red,
      ));
      setState(() {
        isSubmit = false;
      });
    }
  }

  void signUp() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Email ID"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if (passlController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter password"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if (confirmPassController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Re-Enter password"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    try {
      setState(() {
        isSubmit = true;
      });
      Uri uri = Uri.parse(ApiNetwork.signUp);
      Map<String, String> map = {
        'email': emailController.text,
        'password': passlController.text,
        'confirm_password': confirmPassController.text,
      };
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        setState(() {
          isSubmit = false;
        });
        print(response.body);


        SignUpModel sign = SignUpModel.fromJson(jsonDecode(response.body));

        if (sign.result == "signup Successfull") {
          SessionManager.setUserID(sign.id.toString());
          setState(() {
            isSubmit = false;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileDetailsScreen(email: emailController.text,)));
        }
      }
    } catch (e) {
      setState(() {
        isSubmit = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("please check Internet"),
        backgroundColor: Colors.red,
      ));
    }
  }

  void logIn() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Email ID"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if (passlController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter password "),
        backgroundColor: Colors.red,
      ));
      return;
    }
    try {
      setState(() {
        isSubmit = true;
      });
      Uri uri = Uri.parse(ApiNetwork.signIn);
      Map<String, String> map = {
        'email': emailController.text,
        'password': passlController.text,
      };
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        setState(() {
          isSubmit = false;
        });
        SignInModel log = SignInModel.fromJson(jsonDecode(response.body));
        if (log.result == "Login Successfull") {
          SessionManager.setUserID(log.id.toString());
          setState(() {
            isSubmit = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          setState(() {
            isSubmit = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("please Enter correct password"),
            backgroundColor: Colors.red,
          ));
        }
      }
    } catch (e) {
      setState(() {
        isSubmit = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("please check Internet"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomBackButoon(onclick: () {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimentions.width40),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(Dimentions.height44),
                Gap(Dimentions.height30),
                CustomText(
                    title: "Sign In With email",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: Dimentions.font34),
                Row(
                  children: [
                    CustomText(
                        title: "Please enter your valid email.",
                        fontWeight: FontWeight.w400,
                        color: kBlackColor,
                        fontSize: Dimentions.font14),
                  ],
                ),
                Gap(Dimentions.height33),
                CustomTextField(
                    label: "Enter Email",
                    keybordType: TextInputType.emailAddress,
                    controller: emailController),
                Gap(Dimentions.height15),
                Visibility(
                  visible: email ? true : false,
                  child: Column(
                    children: [
                      CustomTextField(
                          label: "Enter Password",
                          keybordType: TextInputType.visiblePassword,
                          controller: passlController),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PasswordScreen()));
                              },
                              child: CustomText(
                                  title: "Forgot Password ?",
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryColor,
                                  fontSize: Dimentions.font16)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: isNotExit ? true : false,
                    child: Column(
                      children: [
                        CustomTextField(
                            label: "Create Password",
                            keybordType: TextInputType.visiblePassword,
                            controller: passlController),
                        Gap(Dimentions.height15),
                        CustomTextField(
                            label: "Confirm PassWord",
                            keybordType: TextInputType.visiblePassword,
                            controller: confirmPassController),
                      ],
                    )),
                Gap(15),
                isSubmit
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        title: "Sign In",
                        onclick: () {
                          print(email);
                          if (email) {
                            logIn();
                          } else if (isNotExit) {
                            print("helo");
                            signUp();
                          } else {
                            checkEmail();
                          }
                        }),
                Gap(10),
                CustomText(
                  title: "Or",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: kBlackColor,
                ),
                Gap(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimentions.width30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(Dimentions.height5),
                      CustomLogoContainer(
                        image: 'assets/svg/facebook.svg',
                        onclick: () {},
                      ),
                      Gap(Dimentions.height20),
                      CustomLogoContainer(
                        image: 'assets/svg/google.svg',
                        onclick: () {},
                      ),
                      Gap(Dimentions.height20),
                      CustomLogoContainer(
                        image: 'assets/svg/apple.svg',
                        onclick: () {},
                      ),
                      Gap(Dimentions.height5)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
