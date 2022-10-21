class ShowProfileModel {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? dob;
  String? country;
  String? state;
  String? city;
  String? religion;
  String? cast;
  String? mobile;
  String? image;
  String? gender;
  String? about;
  String? strtotime;
  String? blockStatus;
  String? path;
  String? message;

  ShowProfileModel(
      {this.id,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.dob,
        this.country,
        this.state,
        this.city,
        this.religion,
        this.cast,
        this.mobile,
        this.image,
        this.gender,
        this.about,
        this.strtotime,
        this.blockStatus,
        this.path,
        this.message});

  ShowProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    religion = json['religion'];
    cast = json['cast'];
    mobile = json['mobile'];
    image = json['image'];
    gender = json['gender'];
    about = json['about'];
    strtotime = json['strtotime'];
    blockStatus = json['block_status'];
    path = json['path'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['dob'] = this.dob;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['religion'] = this.religion;
    data['cast'] = this.cast;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['about'] = this.about;
    data['strtotime'] = this.strtotime;
    data['block_status'] = this.blockStatus;
    data['path'] = this.path;
    data['message'] = this.message;
    return data;
  }
}
