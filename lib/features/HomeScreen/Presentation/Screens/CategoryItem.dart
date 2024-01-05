import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/config/routes/routes.dart';

import '../../domain/entities/CategoryEntity.dart';
import 'Products_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({super.key});
  List<DataEntity> dataEntity;

  int index;

  CategoryItem(this.dataEntity, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Products_SCREEN(dataEntity[index].name??""),));

      },
      child: SizedBox(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(dataEntity[index].image ?? ""),
                        fit: BoxFit.cover)),
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(child: Text(dataEntity[index].name ?? "")),
            )
          ]),
        ),
      ),
    );
  }
}
