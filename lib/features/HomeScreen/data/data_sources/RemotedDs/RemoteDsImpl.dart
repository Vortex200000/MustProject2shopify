import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mustproject2shopify2/core/API/API_Manager.dart';
import 'package:mustproject2shopify2/core/API/End_Points.dart';
import 'package:mustproject2shopify2/core/cashe/Shared_Pref.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/data_sources/RemotedDs/RemotedDs.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/AddToCartModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/CartDataModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/CategoryModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/GetWishLIstModel.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/Product_Model.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/models/RemoveModel.dart';

import '../../../domain/use_cases/AddProductToWishList.dart';
import '../../models/AddToWishList.dart';

class HomeRemoteDsImpl implements HomeRemoteDs {
  ApiManager apiManager;

  HomeRemoteDsImpl(this.apiManager);

  String? token = SharedPreff.GetToken(Key: "token");

  @override
  Future<Either<Failures, CategoryModel>> GetAllCat() async {
    try {
      Response response = await apiManager.getData(endpoint: EndPoints.GetCat);
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return Right(categoryModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> GetAllProducts() async {
    try {
      Response response = await apiManager.getData(endpoint: EndPoints.GetProd);
      ProductModel productModel = ProductModel.fromJson(response.data);
      return (Right(productModel));
    } catch (e) {
      return (Left(RemoteFailures(e.toString())));
    }
  }

  @override
  Future<Either<Failures, AddToCartModel>> addToCart(String id) async {
    try {
      Response response = await apiManager.postData(
          endpoint: EndPoints.AddToCart, body: {"productId": id}, Token: token);
      AddToCartModel addToCartModel = AddToCartModel.fromJson(response.data);
      return (Right(addToCartModel));
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  void signOut() {
    try {
      SharedPreff.sharedPreferences.clear();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failures, CartDataModel>> GetCartProducts() async {
    try {
      Response response = await apiManager.getData(
          endpoint: EndPoints.GetCartProd, Token: token);
      CartDataModel cartDataModel = CartDataModel.fromJson(response.data);
      return right(cartDataModel);
    } catch (e) {
      return left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, RemoveModel>> RemoveItem(String id) async {
    try {
      Response response = await apiManager.removeData(
          endpoint: EndPoints.RemoveItem + id, Token: token);
      RemoveModel removeModel = RemoveModel.fromJson(response.data);
      return Right(removeModel);
    } catch (e) {
      return left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToWishListModel>> addToWish(String id) async {
    try {
      Response response = await apiManager.postData(
          endpoint: EndPoints.wishList, Token: token, body: {"productId": id});
      AddToWishListModel addToWishListModel =
          AddToWishListModel.fromJson(response);
      return Right(addToWishListModel);
    } catch (e) {
      return left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWishLIstModel>> getWish() async {
    try {
      Response response = await apiManager.getData(
          endpoint: EndPoints.GetWishList, Token: token);
      GetWishLIstModel getWishLIstModel = GetWishLIstModel.fromJson(response.data);
      return Right(getWishLIstModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
