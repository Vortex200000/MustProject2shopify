class CartDataEntity {
  CartDataEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,});


  String? status;
  int? numOfCartItems;
  CartData? data;



}

class CartData {
  CartData({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<CartListProducts>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;



}

class CartListProducts {
  CartListProducts({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  int? count;
  String? id;
  CartProduct? product;
  int? price;



}

class CartProduct {
  CartProduct({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
     });


  List<CartSubcategory>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CartSubcategory? category;
  dynamic brand;
  num? ratingsAverage;




}

class CartCategory {
  CartCategory({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});


  String? id;
  String? name;
  String? slug;
  String? image;


}

class CartSubcategory {
  CartSubcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});


  String? id;
  String? name;
  String? slug;
  String? category;



}