import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/repositories/HomeRepo.dart';

class SignOUtUseCase{

  HomeRepo homeRepo;


  SignOUtUseCase(this.homeRepo);

 void call()=>homeRepo.signOut();

}