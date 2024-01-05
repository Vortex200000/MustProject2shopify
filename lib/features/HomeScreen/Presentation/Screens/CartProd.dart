import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/CartScreen.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/SingleItemShim.dart';

import '../../../../config/routes/routes.dart';
import '../manager/home_bloc.dart';
import 'ProductSearch.dart';
import 'SingleCartCard.dart';
import 'SingleProducCard.dart';

class CartProds extends StatelessWidget {
  const CartProds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(GetCartProdEvent())
        ..add(GetAllProductsEvent()),
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
          } else if (state.homeScreenState == HomeScreenState.GetCartErr ||
              state.homeScreenState == HomeScreenState.GetProductError) {
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
          } else if (state.homeScreenState == HomeScreenState.GetCartSucces) {
            Navigator.pop(context);
          } else if (state.homeScreenState ==
              HomeScreenState.GetProductSucsses) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
              // appBar: AppBar(
              //     iconTheme: IconThemeData(color: Colors.black87),
              //     toolbarHeight: 80,
              //     backgroundColor: Colors.white,
              //     elevation: 0,
              //     actions: [
              //       IconButton(
              //           onPressed: () {
              //
              //             Navigator.pushNamed(context, RoutesName.cartProd);
              //           },
              //           icon: Icon(
              //             Icons.shopping_cart_outlined,
              //             color: Colors.black87,
              //           ))
              //     ],
              //     title: TextFormField(
              //       cursorColor: Colors.black,
              //       onTap: () {
              //         showSearch(
              //             context: context, delegate: ProductsSearch(state.Products??[],"Search Shopify"));
              //       },
              //       decoration: InputDecoration(
              //
              //         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5) , borderSide: BorderSide(color: Colors.black)),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5)),
              //
              //
              //         hintText: "Search Shopify",
              //         isDense: true,
              //         suffixIcon: IconButton(
              //             onPressed: () {
              //               // HomeBloc.get(context).add(GetAllProductsEvent());
              //               showSearch(
              //                   context: context, delegate: ProductsSearch(state.Products??[], "Search Shopify"));
              //             },
              //             icon: Icon(
              //               Icons.search,
              //               color: Colors.black87,
              //             )),
              //       ),
              //     )
              //
              // ),
              body: Column(
            children: [
              SizedBox(
                height: 17,
              ),

              // to do the condition of empty screen here
              Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => state
                                  .CarProd?.products !=
                              null
                          ? SingleCartItem(state.CarProd?.products ?? [], index)
                          : SingleItemShimm(),
                      itemCount: state.CarProd?.products?.length != null
                          ? state.CarProd?.products?.length
                          : 0)),
              SizedBox(
                height: 16,
              )
            ],
          ));
        },
      ),
    );
  }
}
