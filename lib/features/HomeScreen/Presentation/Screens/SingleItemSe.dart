import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/ProductDetails.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';

import '../../domain/entities/ProdEntity.dart';

class SingleItemSe extends StatelessWidget {
  // const SingleItem({super.key});

  List<DataProdEntity> Prod;

  int index;

  SingleItemSe(this.Prod, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 69, top: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetails(Prod[index]),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffD9E7CB), width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: Row(children: [
            Container(
              width: 150,
              height: 252,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Prod[index].imageCover ?? "")),
                  color: Color(0xffD9E7CB),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))

              ),
            ),
            Expanded(
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
                          Prod[index].title ?? "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Eg ${Prod[index].price.toString() ?? ""} ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Stack(alignment: Alignment.center, children: [
                              Text(
                                  "Eg ${Prod[index].price! - ((Prod[index].price! / 100) * 20)} "),
                              Container(
                                width: 55,
                                height: 1,
                                color: Colors.black,
                              )
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(child: Text("20% discount")),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(child: Text("Get it by Tomorrow, May 26")),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(child: Text("Free Delivery Available")),
                      SizedBox(
                        height: 35,
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
            )
          ]),
        ),
      ),
    );
  }
}
