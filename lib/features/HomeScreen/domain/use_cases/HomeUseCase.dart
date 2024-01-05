import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CategoryEntity.dart';

import '../repositories/HomeRepo.dart';

class HomeUseCase {
  HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);

  Future<Either<Failures, CategoryEntity>> call() => homeRepo.GetAllCat();
}
