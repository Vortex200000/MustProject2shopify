import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/ProductDetails.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/CartDataEntity.dart';

import '../../../../config/routes/routes.dart';
import '../../domain/entities/ProdEntity.dart';

class SingleCartItem extends StatelessWidget {
  // const SingleItem({super.key});

  List<CartListProducts> Prod;


  int index;


  SingleCartItem(this.Prod, this.index);

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
            Navigator.pop(context);

          } else if (state.homeScreenState == HomeScreenState.RemErr) {
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
          } else if (state.homeScreenState ==
              HomeScreenState.RemSucc) {
            // Navigator.pop(context);
            HomeBloc.get(context).add(GetCartProdEvent());
            Navigator.pop(context);
            Navigator.pushNamed(context, RoutesName.cartProd);


          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 69, top: 16),
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
                          image: NetworkImage(
                              Prod[index].product?.imageCover ?? "")),
                      color: Color(0xffD9E7CB),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                ),
                Expanded(
                  child: Container(
                    width: 193,
                    height: 252,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, right: 16, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              Prod[index].product?.title ?? "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Eg ${Prod[index].price} ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          Expanded(child: Text("Get it by Tomorrow, May 26")),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(child: Text("Free Delivery Available")),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: SizedBox(
                                height: 35,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    HomeBloc.get(context).idrm = Prod[index].product?.id;
                                    HomeBloc.get(context).add(RemoveItemEvent());

                                  },
                                  child: Text(
                                    "Remove ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffD9E7CB),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15))),
                                )),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          Expanded(
                            child: SizedBox(
                                height: 35,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Check Out",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15))),
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
                )
              ]),
            ),
          );
        },
      ),
    );
  }

}
