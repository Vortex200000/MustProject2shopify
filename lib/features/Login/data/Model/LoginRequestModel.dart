import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable{
  String? email;
  String? password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> tojason() {
    return {
      "email": email,
      "password": password,
    };
  }
  @override
  // TODO: implement props
  List<Object?> get props => [email , password] ;
}
