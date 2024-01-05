import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CategoryEntity.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/ProdEntity.dart';


import '../repositories/HomeRepo.dart';

class GetAllProductUseCase {
  HomeRepo homeRepo;

  GetAllProductUseCase(this.homeRepo);

  Future<Either<Failures, ProductEntity>> call() => homeRepo.GetAllProducts();
}
