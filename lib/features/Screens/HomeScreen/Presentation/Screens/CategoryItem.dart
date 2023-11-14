import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/features/Screens/HomeScreen/data/Models/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({super.key});
 CategoryModel catmodel ;

 CategoryItem(this.catmodel);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
       elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [



        Expanded(child: ClipRRect(

            borderRadius: BorderRadius.only(topRight: Radius.circular(25) , topLeft:Radius.circular(25)),
            child: Image.asset(catmodel.Image??"" , fit:  BoxFit.fill,))),


         Padding(
           padding: const EdgeInsets.symmetric(vertical: 10 ),
           child: Center(child: Text(catmodel.Name??"")),
         )

        ]),
      ),
    );
  }
}
