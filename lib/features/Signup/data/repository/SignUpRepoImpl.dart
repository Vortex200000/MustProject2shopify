import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Signup/data/dataSources/remotedDs/signupremoteDS.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpReqModel.dart';
import 'package:mustproject2shopify2/features/Signup/domain/Entity/SignUpEntity.dart';
import 'package:mustproject2shopify2/features/Signup/domain/repository/SignUpRepo.dart';

class SignUpRepoImpl implements SignUpRepo {
  SignUpRemoteDs signUpRemoteDs;

  SignUpRepoImpl(this.signUpRemoteDs);

  @override
  Future<Either<Failures, SignUpEntity>> SignUp(SignUpReqModel signUpReqModel) {
    try {
      return signUpRemoteDs.SignUpds(signUpReqModel);
    } catch (e) {
      throw Exception();
    }
  }
}
