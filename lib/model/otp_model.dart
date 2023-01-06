/// Model class for verifying otp
class OtpModel {
  String? mobile;
  String? otp;

  OtpModel({this.mobile, this.otp});

  OtpModel.fromJson(Map<String, dynamic> json) {
    mobile = json["mobile"];
    otp = json["otp"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["mobile"] = mobile;
    data["otp"] = otp;
    return data;
  }
}
