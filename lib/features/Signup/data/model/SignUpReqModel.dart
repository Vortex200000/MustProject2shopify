class SignUpReqModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? repassword;

  SignUpReqModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.repassword});

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": repassword,
      "phone": phone
    };
  }
}
