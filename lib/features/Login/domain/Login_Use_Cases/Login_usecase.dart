import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginRequestModel.dart';
import 'package:mustproject2shopify2/features/Login/domain/Entites/LoginEntity.dart';
import 'package:mustproject2shopify2/features/Login/domain/repository/LoginRepo.dart';

class LoginUseCase{

    LoginRepo loginRepo;


    LoginUseCase(this.loginRepo);

    Future<Either<Failures , LoginEntity>>call(LoginRequestModel loginRequestModel)=>loginRepo.SignIn(loginRequestModel);
}