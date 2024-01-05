import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/CartProd.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/Cats.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/as.dart';

import '../../../../config/routes/routes.dart';
import '../../../Login/presentation/pages/Login_screen.dart';
import '../manager/home_bloc.dart';

import 'ProductSearch.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'WishList.dart';

class TheHome extends StatefulWidget {
  int currentIndex = 0;

  final List<Color> kMixedColors = [Colors.transparent];
  bool flag = true;
  int index = 0;

  // const TheHome({super.key});

  @override
  State<TheHome> createState() => _TheHomeState();
}

class _TheHomeState extends State<TheHome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetAllProductsEvent()),
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
          } else if (state.homeScreenState == HomeScreenState.SignOutErr ||
              state.homeScreenState == HomeScreenState.GetProductError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("An Error Occurred"),
                content: Text(state.homeFail?.message ?? ""),
                // actions: [
                //   ElevatedButton(onPressed: (){
                //     Navigator.pop(context);
                //   }, child: Text("Ok"))
                // ],
              ),
            );
          } else if (state.homeScreenState == HomeScreenState.SignOutSuccsses) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
                (route) => false);
          } else if (state.homeScreenState ==
              HomeScreenState.GetProductSucsses) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
              extendBody: true,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black87),
                toolbarHeight: 80,
                backgroundColor: Colors.white,
                elevation: 0,
                title: TextFormField(
                  cursorColor: Colors.black,
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: ProductsSearch(
                            state.Products ?? [], "Search Shopify"));
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    hintText: "Search Shopify",
                    isDense: true,
                    suffixIcon: IconButton(
                        onPressed: () {
                          // HomeBloc.get(context).add(GetAllProductsEvent());
                          showSearch(
                              context: context,
                              delegate: ProductsSearch(
                                  state.Products ?? [], "Search Shopify"));
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black87,
                        )),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        HomeBloc.get(context).add(SignOutEvent());
                        Navigator.pushNamed(context, RoutesName.login);
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.black87,
                      ))
                ],
              ),

              // body:
              bottomNavigationBar: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  color: Color(0xffD9E7CB),

                  index: widget.index,
                  height: 60,
                  onTap: (value) {
                    widget.index = value;
                    setState(() {

                    });
                  },
                  items: [
                Icon(Icons.home_outlined, color: Colors.black,),
                Icon(Icons.category_outlined, color: Colors.black),
                Icon(Icons.shopping_cart_outlined, color: Colors.black),
                Icon(Icons.favorite_border_rounded, color: Colors.black),
              ]),
              body: NavScreen[widget.index]);
        },
      ),
    );
  }

  List<Widget> NavScreen = [
    HomeScreenNaav(),
    Cats(),
    CartProds(),
    WishList(),

  ];
}

// BottomNavigationBar(
// selectedItemColor: Colors.black,
// unselectedItemColor: Colors.orange,
// iconSize: 20,
// elevation: 1,
// onTap: (value) {
// widget.index = value;
// setState(() {});
// },
// currentIndex: widget.index,
// items: [
// BottomNavigationBarItem(
// icon: Icon(Icons.home), label: "Home"),
// BottomNavigationBarItem(
// icon: Icon(Icons.category), label: "Categoryes"),
// BottomNavigationBarItem(
// icon: Icon(Icons.shopping_cart_outlined),
// label: "Cart"),
// BottomNavigationBarItem(
// icon: Icon(Icons.favorite_border_rounded),
// label: "Favorites"),
// ]
//
// ),
