import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/components/custom_text.dart';
import 'package:syncdating/helper/constants.dart';
import 'package:http/http.dart' as http;

import '../helper/api_network.dart';
import '../model/term_condition_model.dart';

class TermConditionScreen extends StatefulWidget {
  const TermConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermConditionScreen> createState() => _TermConditionScreenState();
}

class _TermConditionScreenState extends State<TermConditionScreen> {
  void initState() {
    getTermFuture = getPrivacy();

    super.initState();
  }

  late Future<TermConditionModel> getTermFuture;
  Future<TermConditionModel> getPrivacy()async {
    final response = await http.post(Uri.parse(ApiNetwork.privacy));
    if(response.statusCode ==200){
      return TermConditionModel.fromJson(jsonDecode(response.body));
    }else{
      return TermConditionModel();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: FutureBuilder<TermConditionModel>(
            future: getTermFuture,
            builder: (context , snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Row(
                    children: [
                      CustomBackButoon(onclick: () {
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                  const Gap(10),
                  CustomText(
                      title: "Term & Condition",
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                      fontSize: 24),
                  const Gap(10),
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
            },
          ),
        ),
      ),
    );
  }
}
