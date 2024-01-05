import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/GetWishLIstModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CartDataEntity.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CategoryEntity.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/ProdEntity.dart';

import 'package:mustproject2shopify2/features/HomeScreen/domain/repositories/HomeRepo.dart';

import '../../domain/use_cases/AddProductToWishList.dart';
import '../data_sources/RemotedDs/RemotedDs.dart';
import '../models/AddToCartModel.dart';
import '../models/AddToWishList.dart';
import '../models/RemoveModel.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDs homeRemoteDs;

  HomeRepoImpl(this.homeRemoteDs);

  @override
  Future<Either<Failures, CategoryEntity>> GetAllCat() {
    try {
      return homeRemoteDs.GetAllCat();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failures, ProductEntity>> GetAllProducts() {
    try {
      return homeRemoteDs.GetAllProducts();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failures, AddToCartModel>> addToCart(String id) {
    try {
      return homeRemoteDs.addToCart(id);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  void signOut() {
    try {
      homeRemoteDs.signOut();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failures, CartDataEntity>> GetCartProducts() {
    try {
      return homeRemoteDs.GetCartProducts();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failures, DataRemove>> RemoveItem(String id) {
    try {
      return homeRemoteDs.RemoveItem(id);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failures, AddToWishListModel>> addToWish(String id) {
    try {
      return homeRemoteDs.addToWish(id);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failures, GetWishLIstModel>> getWish() {
    try {
      return homeRemoteDs.getWish();
    } catch (e) {
      throw Exception();
    }
  }
}
