import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpReqModel.dart';
import 'package:mustproject2shopify2/features/Signup/domain/Entity/SignUpEntity.dart';
import 'package:mustproject2shopify2/features/Signup/domain/repository/SignUpRepo.dart';

class SignUpUseCase{

SignUpRepo signUpRepo;

SignUpUseCase(this.signUpRepo);

Future<Either<Failures , SignUpEntity>>call(SignUpReqModel signUpReqModel) => signUpRepo.SignUp(signUpReqModel);
}