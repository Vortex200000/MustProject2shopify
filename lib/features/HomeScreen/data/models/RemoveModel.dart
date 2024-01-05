class RemoveModel extends DataRemove {
  RemoveModel({
    this.status,
    this.numOfCartItems,
    this.data,
  });

  RemoveModel.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? DataRemove.fromJson(json['data']) : null;
  }

  String? status;
  int? numOfCartItems;
  DataRemove? data;
}

class DataRemove {
  DataRemove({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  DataRemove.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsRemove.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? id;
  String? cartOwner;
  List<ProductsRemove>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class ProductsRemove {
  ProductsRemove({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  ProductsRemove.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? ProductRemove.fromJson(json['product'])
        : null;
    price = json['price'];
  }

  int? count;
  String? id;
  ProductRemove? product;
  int? price;
}

class ProductRemove {
  ProductRemove({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  ProductRemove.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryRemove.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryRemove.fromJson(json['category'])
        : null;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }

  List<SubcategoryRemove>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryRemove? category;
  dynamic brand;
  num? ratingsAverage;
}

class CategoryRemove {
  CategoryRemove({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  CategoryRemove.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;
}

class SubcategoryRemove {
  SubcategoryRemove({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  SubcategoryRemove.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;
}
