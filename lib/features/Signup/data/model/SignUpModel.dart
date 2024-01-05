import 'package:mustproject2shopify2/features/Signup/domain/Entity/SignUpEntity.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
      this.message, 
      super.user,
      super.token,});

  SignUpModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;



  @override
  // TODO: implement props
  List<Object?> get props => [super.props , message];

}

class UserModel extends UserEntity{
  UserModel({
      super.name,
      super.email,
      this.role,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;



  @override
  // TODO: implement props
  List<Object?> get props => [super.props , role];
}