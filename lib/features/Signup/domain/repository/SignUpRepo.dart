import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpReqModel.dart';
import 'package:mustproject2shopify2/features/Signup/domain/Entity/SignUpEntity.dart';

abstract class SignUpRepo {

  Future<Either<Failures, SignUpEntity>> SignUp(SignUpReqModel signUpReqModel);
}