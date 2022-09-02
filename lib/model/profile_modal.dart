class ProfileModal{
  String title;
  String image;
  ProfileModal({required this.image,required this.title});

  static List<ProfileModal> profileModalList = [
    // ProfileModal(image: "image", title: "Contact Us"),
    ProfileModal(image: "assets/svg/privercyAndPolicy.svg", title: "Privacy Policy"),
    ProfileModal(image: "assets/svg/termCondition.svg", title: "Term And Condition")
  ];
}