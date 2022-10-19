class SignInModel {
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
  String? coste;
  String? mobile;
  String? image;
  String? result;

  SignInModel(
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
        this.coste,
        this.mobile,
        this.image,
        this.result});

  SignInModel.fromJson(Map<String, dynamic> json) {
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
    coste = json['coste'];
    mobile = json['mobile'];
    image = json['image'];
    result = json['result'];
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
    data['coste'] = this.coste;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['result'] = this.result;
    return data;
  }
}
