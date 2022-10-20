import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';

import '../helper/api_network.dart';
import '../model/privacy_policy_model.dart';
import 'package:http/http.dart' as http;


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    getPrivacyFuture = getPrivacy();

    super.initState();
  }

  late Future<PrivacyPolicyModel> getPrivacyFuture;
  Future<PrivacyPolicyModel> getPrivacy()async {
    final response = await http.post(Uri.parse(ApiNetwork.privacy));
    if(response.statusCode ==200){
      return PrivacyPolicyModel.fromJson(jsonDecode(response.body));
    }else{
     return PrivacyPolicyModel();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:FutureBuilder<PrivacyPolicyModel>(
              future: getPrivacyFuture,
              builder: (context , snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            }
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10),
                Row(
                  children: [
                    CustomBackButoon(onclick: () {
                      Navigator.pop(context);
                    }),
                  ],
                ),
                Gap(10),
                CustomText(
                    title: "Privacy Policy",
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    fontSize: 24),
                Gap(10),
                Expanded(
                    child: Container(
                      child: CustomText(
                          title:snapshot.data!.description!,
                          fontWeight: FontWeight.w400,
                          color: kBlackColor,
                          fontSize: 14),
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
