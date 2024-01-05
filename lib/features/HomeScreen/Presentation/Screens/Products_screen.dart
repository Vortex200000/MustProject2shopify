import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/config/routes/routes.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/SingleItemShim.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';

import '../../domain/entities/ProdEntity.dart';
import 'ProductSearch.dart';
import 'SingleProducCard.dart';

class Products_SCREEN extends StatelessWidget {
  String name;

  List<DataProdEntity> specific = [];

  Products_SCREEN(this.name);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetAllProductsEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.homeScreenState == HomeScreenState.loading) {
            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     elevation: 0,
            //     backgroundColor: Colors.transparent,
            //     title: Center(
            //         child: CircularProgressIndicator(
            //       color: Colors.grey,
            //     )),
            //   ),
            // );

            // ListView.builder(
            //     itemBuilder: (context, index) =>
            //         SingleItemShimm(),
            //     itemCount: 20);
          } else if (state.homeScreenState == HomeScreenState.GetProductError) {
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
              HomeScreenState.GetProductSucsses) {
            if (state.Products != null) {
              for (int i = 0; i < state.Products!.length; i++) {
                if (state.Products![i].category?.name == name) {
                  specific.add(state.Products![i]);
                  // print("ok");
                }
              }
            }

            // Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black87),
                  toolbarHeight: 80,
                  backgroundColor: Colors.white,
                  elevation: 0,

                  actions: [
                    IconButton(
                        onPressed: () {

                          Navigator.pushNamed(context, RoutesName.cartProd);
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black87,
                        ))
                  ],
                  title: TextFormField(
                    cursorColor: Colors.black,
                    onTap: () {
                      showSearch(
                          context: context, delegate: ProductsSearch(state.Products??[] , "Search Shopify"));
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5) , borderSide: BorderSide(color: Colors.black)),

                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(5)),
                      hintText: "Search Shopify",
                      isDense: true,
                      suffixIcon: IconButton(
                          onPressed: () {
                            // HomeBloc.get(context).add(GetAllProductsEvent());
                            showSearch(
                                context: context, delegate: ProductsSearch(state.Products??[] ,"Search Shopify" ));
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.black87,
                          )),
                    ),
                  ),

              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 17,
                  ),

                  // to do the condition of empty screen here
                  Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                          itemBuilder:

                              (context, index) => state.Products != null
                              ? SingleItem(state.Products ?? [], index, name)
                              : SingleItemShimm(),
                          itemCount: state.Products?.length!=null?specific.length :20

                      )

                  ),
                  SizedBox(height: 16,)
                ],
              ));
        },
      ),
    );
  }
}
