import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mustproject2shopify2/core/API/API_Manager.dart';
import 'package:mustproject2shopify2/core/API/End_Points.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginModel.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginRequestModel.dart';
import 'package:mustproject2shopify2/features/Login/data/remote/data_sources/LoginRemoteDs.dart';

class LginRemoteDsImpl implements LoginRemoteDs {
  ApiManager apiManager;

  LginRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, LoginModel>> SignIN(
      LoginRequestModel loginRequestModel) async {
    try {
      Response response = await apiManager.postData(
          endpoint: EndPoints.SignIN, body: loginRequestModel.tojason());
      LoginModel loginModel = LoginModel.fromJson(response.data);

      return Right(loginModel);
    } catch (e) {
      return left(RemoteFailures(e.toString()));
    }
  }
}
