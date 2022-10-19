import 'package:dropdown_text_search/dropdown_text_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncdating/helper/dimentions/dimentions.dart';

import '../components/custom_text.dart';
import '../helper/constants.dart';

class CustomDropDown extends StatelessWidget {
  String title;
   CustomDropDown({
    Key? key,
    required this.title,
    required this.countryController,
    required this.item,
    required this.height,
  }) : super(key: key);

  final TextEditingController countryController;
  final List<String> item;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Dimentions.height44,
        width: double.maxFinite,
        child: DropdownTextSearch(
          onChange: (val){
            print(val);
            countryController.text = val;
          },
          noItemFoundText: "Invalid Search",
          controller: countryController,
          overlayHeight: 300,
          items: item,
          filterFnc: (String a,String b){
            return a.toLowerCase().startsWith(b.toLowerCase());
          },
          decorator:  InputDecoration(
              suffixIcon: Icon(Icons.arrow_drop_down,),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(Dimentions.height15)
              ),
              label: CustomText( fontSize: height*0.020,
                fontWeight: FontWeight.w400,

                color: kBlackColor, title: title,)
          ),
        )
    );
  }
}
