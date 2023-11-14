import 'package:flutter/material.dart';

import '../../data/Models/CategoryModel.dart';
import 'CategoryItem.dart';

class Cats extends StatelessWidget {
  // const Cats({super.key});
  List<CategoryModel> categories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30 , top:  20 , bottom: 30),
          child: Text("Shop by Category" , style:  TextStyle(fontWeight: FontWeight.w700 ,fontSize: 19),),
        ),
        Expanded(
          child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,mainAxisSpacing: 81),
            children: categories.map((CAT) => CategoryItem(CAT)).toList(),

          ),
        )
      ],
    );
  }
}
