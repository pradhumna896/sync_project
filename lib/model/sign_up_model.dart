class SignUpModel {
  String? id;
  String? email;
  String? password;
  String? result;

  SignUpModel({this.id, this.email, this.password, this.result});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['result'] = this.result;
    return data;
  }
}
