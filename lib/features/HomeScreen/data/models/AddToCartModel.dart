class AddToCartModel {
  AddToCartModel({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  AddToCartModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? DataCart.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  int? numOfCartItems;
  DataCart? data;



}

class DataCart {
  DataCart({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  DataCart.fromJson(dynamic json) {
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
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;



}

class Products {
  Products({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  int? count;
  String? id;
  String? product;
  int? price;



}