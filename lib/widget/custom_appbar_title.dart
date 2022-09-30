import 'package:flutter/cupertino.dart';

import '../components/custom_text.dart';
import '../helper/constants.dart';

class CustomAppbarTitle extends StatelessWidget {
  final String  title;
  const CustomAppbarTitle({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
        title: title,
        fontWeight: FontWeight.w700,
        color: kBlackColor,
        fontSize: 24);
  }
}