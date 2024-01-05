class ProductEntity {
  ProductEntity({
      this.results, 
      this.metadata, 
      this.data,});


  int? results;
  Metadata? metadata;
  List<DataProdEntity>? data;



}

class DataProdEntity {
  DataProdEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
  });


  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  Category? category;
  dynamic brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;




}

class Category {
  Category({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});


  String? id;
  String? name;
  String? slug;
  String? image;



}

class Subcategory {
  Subcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});


  String? id;
  String? name;
  String? slug;
  String? category;



}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});


  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;



}