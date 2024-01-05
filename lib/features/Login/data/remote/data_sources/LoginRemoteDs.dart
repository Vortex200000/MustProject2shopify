import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginModel.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginRequestModel.dart';

abstract class LoginRemoteDs{


  Future<Either<Failures , LoginModel>>SignIN(LoginRequestModel loginRequestModel);
}