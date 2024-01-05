import 'package:equatable/equatable.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CategoryEntity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    super.results,
    this.metadata,
    super.data,
  });

  CategoryModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Metadata? metadata;

  @override
  List<Object?> get props => [props, metadata];
}

class Data extends DataEntity {
  Data({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;

  @override
  List<Object?> get props => [props, createdAt, updatedAt];
}

class Metadata extends Equatable {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;

  @override
  // TODO: implement props
  List<Object?> get props => [currentPage, numberOfPages, limit];
}
