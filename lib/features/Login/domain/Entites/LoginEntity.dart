import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  LoginEntity({
    this.user,
    this.token,
  });

  UserdataEnitiy? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user, token];
}

class UserdataEnitiy extends Equatable {
  UserdataEnitiy({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  @override
  // TODO: implement props
  List<Object?> get props => [name, email];
}
