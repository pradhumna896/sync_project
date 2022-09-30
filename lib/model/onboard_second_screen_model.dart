class OnboardSecondScreenModel{
  String title;
  String image;
  String subTitle;
  OnboardSecondScreenModel({required this.title,required this.image,required this.subTitle});

  static List<OnboardSecondScreenModel> onboardSecondScreenList = [
    OnboardSecondScreenModel(
        title: "We Who You Are,Be YourSelf.",
        image: "assets/svg/onboard.svg",
        subTitle: "We your self in the way to meet your soul mate"),
    OnboardSecondScreenModel(
        title: "When the picture is complete, Life takes hold.",
        image: "assets/svg/kissing.svg",
        subTitle: "Find your matche by liking each other"),
    OnboardSecondScreenModel(
        title: "People meet naturally, Based on Numerous atraction",
        image: "assets/svg/meet.svg",
        subTitle: "Choose your partner from interest"),
  ];
}