import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:syncdating/components/custom_back_button.dart';
import 'package:syncdating/screens/chat_screen.dart';
import 'package:syncdating/screens/photo_fullscreen.dart';

// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 0,
                child: InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>PhotoFullScreen()));},
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/profilepicture.png"),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Gap(44),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomBackButoon(iconColor: kPrimaryColor
                                    ,onclick: () {Navigator.pop(context);}),
                             InkWell(
                                 onTap: (){
                                   showAlertDialog(context);
                                 },
                                 child: Icon(Icons.menu,color: kPrimaryColor,))
                              ],
                            )],
                        ),
                      )),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              Gap(90),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          title: "Jessica Parker, 23",
                                          fontWeight: FontWeight.w700,
                                          color: kBlackColor,
                                          fontSize: 24),
                                      CustomText(
                                          title: "Professional model",
                                          fontWeight: FontWeight.w400,
                                          color: kBlackColor,
                                          fontSize: 14)
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ChatScreen()));
                                    },
                                    child: Container(
                                      height: 52,
                                      width: 52,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(color: kgreyColor)),
                                      child: Center(
                                          child: SvgPicture.asset(
                                              "assets/svg/shareIcon.svg")),
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          title: "Location",
                                          fontWeight: FontWeight.w700,
                                          color: kBlackColor,
                                          fontSize: 16),
                                      Gap(5),
                                      CustomText(
                                          title: "Chicago, IL United States",
                                          fontWeight: FontWeight.w400,
                                          color: kBlackColor,
                                          fontSize: 14)
                                    ],
                                  ),
                                  // InkWell(
                                  //   onTap: () {},
                                  //   child: Container(
                                  //     padding: const EdgeInsets.symmetric(
                                  //         horizontal: 12, vertical: 10),
                                  //     decoration: BoxDecoration(
                                  //       color: Color(0xffFDECEE),
                                  //       borderRadius: BorderRadius.circular(7),
                                  //     ),
                                  //     child: Row(
                                  //       children: [
                                  //         SvgPicture.asset(
                                  //           "assets/svg/location_icon.svg",
                                  //           color: kPrimaryColor,
                                  //         ),
                                  //         const Gap(5),
                                  //         CustomText(
                                  //             title: "1 km",
                                  //             fontWeight: FontWeight.w700,
                                  //             color: kPrimaryColor,
                                  //             fontSize: 12)
                                  //       ],
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                              Gap(30),
                              Row(
                                children: [
                                  CustomText(
                                      title: "About",
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor,
                                      fontSize: 16)
                                ],
                              ),
                              CustomText(
                                  title:
                                  "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..",
                                  fontWeight: FontWeight.w400,
                                  color: kBlackColor,
                                  fontSize: 14),
                              Row(
                                children: [
                                  CustomText(
                                      title: "Read more",
                                      fontWeight: FontWeight.w700,
                                      color: kPrimaryColor,
                                      fontSize: 14),
                                ],
                              ),
                              Gap(30),
                              Row(
                                children: [
                                  CustomText(
                                      title: "Interests",
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor,
                                      fontSize: 16)
                                ],
                              ),
                              Gap(10),
                              GridView.builder(
                                  padding: EdgeInsets.all(0),
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
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
                              Gap(30)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Material(borderRadius: BorderRadius.circular(55),
                              elevation: 5,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(55),
                                onTap: (){},
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,shape: BoxShape.circle),
                                  child: Center(child: SvgPicture.asset("assets/svg/closeorange.svg"),),
                                ),
                              ),
                            ),


                            Material(borderRadius: BorderRadius.circular(55),
                              elevation: 5,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(55),
                                onTap: (){},
                                child: Container(
                                  height: 99,
                                  width: 99,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,shape: BoxShape.circle),
                                  child: Center(child: SvgPicture.asset(
                                    "assets/svg/dilwale.svg",
                                    height: 42,
                                    width: 42,
                                  ),),
                                ),
                              ),
                            ),

                            Material(borderRadius: BorderRadius.circular(55),
                              elevation: 5,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(55),
                                onTap: (){},
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,shape: BoxShape.circle),
                                  child: Center(child: SvgPicture.asset("assets/svg/star.svg"),),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ]),
              ),
            )
          ],
        )
    );
  }

  Widget _poster1(context) {
    return Image.asset(
      "assets/images/profilepicture.png",
      fit: BoxFit.fill,
    );
  }


}
showAlertDialog(BuildContext context) {
  // Create button  
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog  
  AlertDialog alert = AlertDialog(

    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [InkWell(
          onTap: (){
            Share.share('check out my website https://example.com');


          },
          child: CustomText(title: "Share", fontWeight: FontWeight.w600, color: kBlackColor, fontSize: 18)),
      Divider(color: Colors.grey.shade300,),
      InkWell(
          onTap: (){
            showReportDialog(context);
          },
          child: CustomText(title: "Report", fontWeight: FontWeight.w600, color: kBlackColor, fontSize: 18))],),

  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showReportDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(

    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        CustomText(title: "Report User", fontWeight: FontWeight.w800, color: kBlackColor, fontSize: 24),
        Gap(20),
        CustomText(title: "is this person Bothering you? Tell us what they did",
            fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 18,textAlign: TextAlign.center),
        Divider(color: Colors.grey.shade300,),
        InkWell(
          onTap: (){

          },
          child: CustomText(title: "Inappropriate Photos", fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 18)),
        Divider(color: Colors.grey.shade300,),
        CustomText(title: "Feels like spam", fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 18),
        Divider(),
        CustomText(title: "Other", fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 18)
      ],),

  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showShareDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(

    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        CustomText(title: "Share", fontWeight: FontWeight.w800, color: kBlackColor, fontSize: 24),
        Gap(20),
        CustomText(title: "Tap an icon below to share your content directly",
            fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 18,textAlign: TextAlign.center),
        Divider(color: Colors.grey.shade300,),

      ],),

  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
