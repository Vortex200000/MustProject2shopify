class CategoryModel {

  String? Name;
  String? Image;
String? id;

  CategoryModel(this.Name, this.Image , this.id);

  static List<CategoryModel> getCategories()
  {
    return [
      CategoryModel("Women's fashion" , "assets/images/image.png" , "women"),
      CategoryModel("Men’s Fashion" , "assets/images/image2.png"   , "men"),
      CategoryModel("kid’s Fashion" , "assets/images/image3.png" , "kids"),
      CategoryModel("Beauty & Luxury" , "assets/images/image4.png" , "lux"),
    ];

  }

}