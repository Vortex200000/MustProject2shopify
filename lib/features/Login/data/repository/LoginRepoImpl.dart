import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginRequestModel.dart';
import 'package:mustproject2shopify2/features/Login/data/local/data_sources/local_ds.dart';
import 'package:mustproject2shopify2/features/Login/data/remote/data_sources/LoginRemoteDs.dart';
import 'package:mustproject2shopify2/features/Login/domain/Entites/LoginEntity.dart';
import 'package:mustproject2shopify2/features/Login/domain/repository/LoginRepo.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRemoteDs loginRemoteDs;
  Loginlocalds loginlocalds;

  LoginRepoImpl(this.loginRemoteDs, this.loginlocalds);

  @override
  Future<Either<Failures, LoginEntity>> SignIn(
      LoginRequestModel loginRequestModel) async {
    var res = await loginRemoteDs.SignIN(loginRequestModel);

    res.fold((l) => {}, (r) => {loginlocalds.cacheToken(r.token ?? "")});
    return res;
  }
}
