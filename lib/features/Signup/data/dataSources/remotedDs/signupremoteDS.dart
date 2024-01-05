import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpModel.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpReqModel.dart';

abstract class SignUpRemoteDs {
  Future<Either<Failures, SignUpModel>> SignUpds(SignUpReqModel signUpReqModel);
}
