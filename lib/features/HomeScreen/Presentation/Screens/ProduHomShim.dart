import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/ProdEntity.dart';

class ProductsInHomeCardShimm extends StatefulWidget {
  // const ProductsInHomeCard({super.key});

  @override
  State<ProductsInHomeCardShimm> createState() => _ProductsInHomeCardState();
}

class _ProductsInHomeCardState extends State<ProductsInHomeCardShimm> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: isSelected == true? 20 : 0),
      // height: 150,
      // width: 40,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: InkWell(
                  onTap: () {
                    if (flag == false){
                      setState(() {
                        flag = true;
                      });}
                    else
                      setState(() {
                        flag = false;
                      });
                  },
                  child:flag == false?  Icon(Icons.favorite_border) :  Icon(Icons.favorite , color: Colors.red,) ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // image: DecorationImage(
                        //     image: NetworkImage(widget.Prods[widget.index].images![0]),
                        //     fit: BoxFit.cover)

                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                         "",
                          maxLines: 2,
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),

                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(""),
                    )
                  ],
                ))
          ],
        ),
      ),

      decoration: BoxDecoration(
        // border: Border.all(),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
    );
  }
}
