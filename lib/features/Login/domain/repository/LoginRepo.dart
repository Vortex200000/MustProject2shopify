import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginRequestModel.dart';
import 'package:mustproject2shopify2/features/Login/domain/Entites/LoginEntity.dart';

abstract class LoginRepo{


  Future<Either<Failures , LoginEntity>>SignIn(LoginRequestModel loginRequestModel);

}