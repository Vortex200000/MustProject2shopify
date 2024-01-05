import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CategoryEntity.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/ProdEntity.dart';

import '../../data/models/AddToCartModel.dart';
import '../../data/models/AddToWishList.dart';
import '../../data/models/GetWishLIstModel.dart';
import '../../data/models/RemoveModel.dart';
import '../entities/CartDataEntity.dart';


abstract class HomeRepo{

  Future<Either<Failures , CategoryEntity>> GetAllCat();
  Future<Either<Failures , ProductEntity>> GetAllProducts();
  Future<Either<Failures , AddToCartModel>> addToCart(String id);
void signOut();

  Future<Either<Failures, CartDataEntity>> GetCartProducts();
  Future<Either<Failures , DataRemove>>RemoveItem(String id);
  Future<Either<Failures , AddToWishListModel>>addToWish(String id);
  Future<Either<Failures , GetWishLIstModel>>getWish();


}