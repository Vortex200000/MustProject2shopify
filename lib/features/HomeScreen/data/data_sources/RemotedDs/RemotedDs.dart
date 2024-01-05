import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/AddToCartModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/CartDataModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/CategoryModel.dart';

import '../../models/AddToWishList.dart';
import '../../models/GetWishLIstModel.dart';
import '../../models/Product_Model.dart';
import '../../models/RemoveModel.dart';

abstract class HomeRemoteDs{

  Future<Either<Failures , CategoryModel>>GetAllCat();
  Future<Either<Failures , ProductModel>>GetAllProducts();
  Future<Either<Failures , AddToCartModel>>addToCart(String id);
 void signOut();
  Future<Either<Failures, CartDataModel>>GetCartProducts();
  Future<Either<Failures , RemoveModel>>RemoveItem(String id);
  Future<Either<Failures , AddToWishListModel>>addToWish(String id);
  Future<Either<Failures , GetWishLIstModel>>getWish();


}