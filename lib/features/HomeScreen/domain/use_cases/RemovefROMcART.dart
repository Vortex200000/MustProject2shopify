import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/RemoveModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/repositories/HomeRepo.dart';

class RemoveFromCartUseCase{

  HomeRepo homeRepo;

  RemoveFromCartUseCase(this.homeRepo);

  Future<Either<Failures , DataRemove>>call(String id )=>homeRepo.RemoveItem(id);
}