import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/ProductDetails.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';

import '../../domain/entities/ProdEntity.dart';

class ProductsInHomeCard extends StatefulWidget {
  // const ProductsInHomeCard({super.key});
  List<DataProdEntity> Prods;
  int index;

  ProductsInHomeCard(this.Prods, this.index);

  @override
  State<ProductsInHomeCard> createState() => _ProductsInHomeCardState();
}

class _ProductsInHomeCardState extends State<ProductsInHomeCard> {
  bool flag = false;
  bool flagstar = false;
  bool bellfalg  = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.homeScreenState == HomeScreenState.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                )),
              ),
            );
          } else if (state.homeScreenState == HomeScreenState.AddCartErr ||
              state.homeScreenState == HomeScreenState.addToWishLIstEss) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("An Error Occurred"),
                content: Text(state.homeFail?.message ?? ""),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              ),
            );
          } else if (state.homeScreenState == HomeScreenState.AddCartSucc) {
            Navigator.pop(context);

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Added To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                  ],
                )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: Colors.black,
              ),
            );
          } else if (state.homeScreenState ==
              HomeScreenState.addToWishLIstSucc) {
            Navigator.pop(context);

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Added To WishLIst",
                        style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: Colors.black,
              ),
            );
          }
        },
        builder: (context, state) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetails(widget.Prods[widget.index]),
                  ));
            },
            child: Container(
              // margin: EdgeInsets.symmetric(vertical: isSelected == true? 20 : 0),
              height: 150,
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              if (flag == false) {
                                HomeBloc.get(context).AddToWId =
                                    widget.Prods[widget.index].id ?? "";
                                HomeBloc.get(context).add(AddToWishListEvent());
                                HomeBloc.get(context).bell = bellfalg ; // Notification bell flag
                                setState(() {
                                  flag = true;
                                });
                              } else
                                setState(() {
                                  flag = false;
                                });
                            },
                            child: flag == false
                                ? Icon(Icons.favorite_border)
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              if (flagstar == false) {
                                setState(() {
                                  flagstar = true;
                                });
                              } else
                                setState(() {
                                  flagstar = false;
                                });
                            },
                            child: flagstar == false
                                ? Icon(Icons.star_rate_outlined)
                                : Icon(
                                    Icons.star_rate,
                                    color: Colors.orange,
                                  ))
                      ],
                    ),
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
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.Prods[widget.index].images![0]),
                                  fit: BoxFit.cover)),
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
                            widget.Prods[widget.index].title ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                                "Price : Eg.${widget.Prods[widget.index].price.toString() ?? ""}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                "Rating.${widget.Prods[widget.index].ratingsAverage.toString()}"),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                HomeBloc.get(context).id =
                                    widget.Prods[widget.index].id ?? "";
                                HomeBloc.get(context).add(AddToCartEvent());
                              },
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ))
                ],
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 15,
                      spreadRadius: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
