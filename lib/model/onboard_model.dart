class OnBoardModal {
  String image;
  String title;
  String subTitle;

  OnBoardModal(
      {required this.image, required this.title, required this.subTitle});

  static List<OnBoardModal> onBoardModalList = [
    OnBoardModal(
        image: "assets/images/girl1.png",
        title: "Algorithm",
        subTitle:
            "Users going through a vetting process to ensure you never match with bots."),
    OnBoardModal(
        image: "assets/images/girl2.png",
        title: "Matches",
        subTitle:
        "We match you with people that have alarge array of similar interests."),
    OnBoardModal(
        image: "assets/images/girl3.png",
        title: "Premium",
        subTitle:
        "Users going through a vetting process to ensure you never match with bots."),
  ];
}
