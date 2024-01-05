import 'package:mustproject2shopify2/features/Login/domain/Entites/LoginEntity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    this.message,
    super.user,
    super.token,
  });

  LoginModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? Userdatamodel.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;

  @override
  List<Object?> get props => [super.props, message];
}

class Userdatamodel extends UserdataEnitiy {
  Userdatamodel({
    super.name,
    super.email,
    this.role,
  });

  Userdatamodel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  @override
  List<Object?> get props => [super.props, role];
}
