import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/repositories/HomeRepo.dart';

import '../entities/CartDataEntity.dart';

class GetCartProductsUseCase{

  HomeRepo homeRepo;

  GetCartProductsUseCase(this.homeRepo);

  Future<Either<Failures, CartDataEntity>> Call()=>homeRepo.GetCartProducts();
}