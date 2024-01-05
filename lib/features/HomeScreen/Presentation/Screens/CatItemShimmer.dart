import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/config/routes/routes.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/CategoryEntity.dart';
import 'Products_screen.dart';

class CategoryItemShimm extends StatelessWidget {
  // const CategoryItem({super.key});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Card(
          elevation: 0,
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
                            image: NetworkImage("https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg?w=1800&t=st=1703758883~exp=1703759483~hmac=dc6c60534b66ff537ce5eb67c8938283f056a1d4254561dab196470b1817fb42"),
                            fit: BoxFit.cover)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(child: Text("")),
            )
          ]),
        ),
      ),
    );
  }
}
