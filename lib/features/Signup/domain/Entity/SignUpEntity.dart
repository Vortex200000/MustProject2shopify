import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable{
  SignUpEntity({

      this.user, 
      this.token,});



  UserEntity? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user , token]; // data redundency protect



}

class UserEntity extends Equatable{
  UserEntity({
      this.name, 
      this.email, 
     });


  String? name;
  String? email;

  @override
  // TODO: implement props
  List<Object?> get props => [email , name];




}