class ShowMeModel{
  final String title;
  final String icon;
  ShowMeModel({required this.title,required this.icon});

  static List<ShowMeModel> showMeList = [
    ShowMeModel(title: "Male", icon: 'assets/svg/checkIcon.svg'),
    ShowMeModel(title: "Female", icon: 'assets/svg/checkIcon.svg'),
    ShowMeModel(title: "Both", icon: 'assets/svg/checkIcon.svg'),
  ];

}