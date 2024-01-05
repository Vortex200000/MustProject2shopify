import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/ProductDetails.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/ProdEntity.dart';

class SingleItemShimm extends StatelessWidget {
  // const SingleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 69, top: 16),
        child: InkWell(
          onTap: () {
          },
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffD9E7CB), width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(children: [
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey,
                  child: Container(
                    width: 150,
                    height: 252,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage( "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg?w=1800&t=st=1703758883~exp=1703759483~hmac=dc6c60534b66ff537ce5eb67c8938283f056a1d4254561dab196470b1817fb42")),
                        color: Color(0xffD9E7CB),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5))
                    ),
                  ),
                ),
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Container(
                      width: 193,
                      height: 252,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                 "",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Stack(alignment: Alignment.center, children: [
                                  Text(
                                      ""),
                                  Container(
                                    width: 55,
                                    height: 1,
                                    color: Colors.black,
                                  )
                                ]),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(child: Text("")),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(child: Text("")),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(child: Text("")),
                            SizedBox(
                              height: 35,
                            ),
                            Expanded(
                              child: SizedBox(
                                  height: 35,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                    },
                                    child: Text(
                                      "",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15))),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
