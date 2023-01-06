class SignupModel {
  String? name;
  String? mobile;
  String? email;
  String? password;

  SignupModel({this.name, this.mobile, this.email, this.password});

  SignupModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    mobile = json["mobile"];
    email = json["email"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["mobile"] = mobile;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
