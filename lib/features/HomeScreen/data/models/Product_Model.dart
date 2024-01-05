import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/ProdEntity.dart';



class ProductModel extends ProductEntity {
  ProductModel({
    super.results,
    super.metadata,
    super.data,
  });

  ProductModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadatamodel.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataModel.fromJson(v));
      });
    }
  }


}

class DataModel extends DataProdEntity {
  DataModel({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
  });

  DataModel.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategorymodel.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Categorymodel.fromJson(json['category']) : null;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }


}

class Categorymodel extends Category {
  Categorymodel({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  Categorymodel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }


}

class Subcategorymodel extends Subcategory{
  Subcategorymodel({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  Subcategorymodel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
}

class Metadatamodel extends Metadata {
  Metadatamodel({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  Metadatamodel.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }


}
