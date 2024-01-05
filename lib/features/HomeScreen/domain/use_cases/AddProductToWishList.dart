import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/AddToWishList.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/repositories/HomeRepo.dart';

class AddToWishListUseCase{
  HomeRepo homeRepo;

  AddToWishListUseCase(this.homeRepo);

  Future<Either<Failures, AddToWishListModel>>call(String id)=>homeRepo.addToWish(id);
}