class GenderModal{
  String title;
  String image;
  GenderModal({required this.title, required this.image});

 static List<GenderModal> genderModalList = [
    GenderModal(title:"Woman", image: 'assets/svg/checkIcon.svg'),
    GenderModal(title:"Man", image: 'assets/svg/checkIcon.svg'),
    GenderModal(title:"Choose another", image: 'assets/svg/rightarrow.svg')
  ];

}