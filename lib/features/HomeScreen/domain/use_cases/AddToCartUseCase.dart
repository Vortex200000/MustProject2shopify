import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';

import 'package:mustproject2shopify2/features/HomeScreen/domain/repositories/HomeRepo.dart';

import '../../data/models/AddToCartModel.dart';

class AddToCartUseCase{
  HomeRepo homeRepo;


  AddToCartUseCase(this.homeRepo);

  Future<Either<Failures, AddToCartModel>>call(String id)=>homeRepo.addToCart(id);


}