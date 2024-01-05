import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mustproject2shopify2/core/API/API_Manager.dart';
import 'package:mustproject2shopify2/core/API/End_Points.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Signup/data/dataSources/remotedDs/signupremoteDS.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpModel.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpReqModel.dart';

class SignUpRemoteDsImpl implements SignUpRemoteDs {
  ApiManager apiManager;

  SignUpRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, SignUpModel>> SignUpds(
      SignUpReqModel signUpReqModel) async {
    try {
      Response response = await apiManager.postData(
          endpoint: EndPoints.SignUP, body: signUpReqModel.tojson());
      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
