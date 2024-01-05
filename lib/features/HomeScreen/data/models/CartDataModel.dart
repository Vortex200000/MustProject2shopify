import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CartDataEntity.dart';

class CartDataModel extends CartDataEntity{
  CartDataModel({
      super.status,
      super.numOfCartItems,
      super.data,});

  CartDataModel.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }





}

class Data extends CartData {
  Data({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


}

class Products extends CartListProducts{
  Products({
      super.count,
      super.id,
      super.product,
      super.price,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }



}

class Product extends CartProduct {
  Product({
      super.subcategory,
      super.id,
      super.title,
      super.quantity,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
    });

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];

    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }




}

class Category extends CartCategory {
  Category({
      super.id,
      super.name,
      super.slug,
      super.image,});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }



}

class Subcategory extends CartSubcategory{
  Subcategory({
      super.id,
      super.name,
      super.slug,
      super.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }




}