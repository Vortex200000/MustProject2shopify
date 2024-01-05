import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/SingleItemSe.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/SingleItemShim.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/SingleProducCard.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/ProdEntity.dart';

class ProductsSearch extends SearchDelegate {
  List<DataProdEntity> products;
  String Hint;

  ProductsSearch(this.products, this.Hint)
      : super(
          searchFieldLabel: Hint,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      appBarTheme: AppBarTheme(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black)),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.black,
        suffixIconColor: Colors.black,
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("Search Shopify");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<DataProdEntity> filter = products.where((element) {
      return element.title!.contains(query);
    }).toList();
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            SingleItemSe(query == "" ? products : filter, index),
        itemCount: query == "" ? products.length : filter.length);
  }
}
