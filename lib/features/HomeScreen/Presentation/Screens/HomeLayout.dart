import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/config/routes/routes.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/Cats.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';
import 'package:mustproject2shopify2/features/Login/presentation/pages/Login_screen.dart';

import 'CartScreen.dart';
import 'CategoryItem.dart';
import 'DrawerItems.dart';
import 'ProductSearch.dart';

class HomeLayout extends StatelessWidget {
  // const HomeLayout({super.key});

  // int index = 0;

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
          } else if (state.homeScreenState == HomeScreenState.SignOutErr || state.homeScreenState == HomeScreenState.GetProductError) {
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
          } else if (state.homeScreenState == HomeScreenState.SignOutSuccsses ) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
                (route) => false);
          }
          else if(state.homeScreenState == HomeScreenState.GetProductSucsses)
            {
              Navigator.pop(context);
            }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black87),
                toolbarHeight: 80,
                backgroundColor: Colors.white,
                elevation: 0,
                title: TextFormField(
                  cursorColor: Colors.black,
                  onTap: () {
                    showSearch(
                        context: context, delegate: ProductsSearch(state.Products??[], "Search Shopify"));
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
                              context: context, delegate: ProductsSearch(state.Products??[], "Search Shopify"));
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
                        Navigator.pushNamed(context, RoutesName.cartProd);
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black87,
                      ))
                ],
              ),
              drawer: Drawer(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                backgroundColor: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        color: Color(0xffD9E7CB),
                        child: Center(
                            child: Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [

                            Divider(
                              height: 5,
                              thickness: 1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            InkWell(
                                child: DrawerItems("Category's",Icons.category)),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 5,
                              thickness: 1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            InkWell(
                                onTap: () {
                                  HomeBloc.get(context).add(SignOutEvent());
                                },
                                child: DrawerItems("Logout",Icons.logout)),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 5,
                              thickness: 1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            DrawerItems("Home",Icons.home),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 5,
                              thickness: 1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            DrawerItems("Info",Icons.info),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 5,
                              thickness: 1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),


                          ],

                        ),
                      ),

                    ]),
              ),
              body: Cats());
        },
      ),
    );

    // body: widget.index == 1 ? CartScreen() : Cats());
  }
}


// Padding(
// padding: const EdgeInsets.all(15),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => HomeLayout(),
// ));
// // setState(() {
// //   widget.index = 0;
// //   // Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
// //   Navigator.pop(context);
// // });
// },
// child: Row(
// children: [
// Icon(
// Icons.category,
// size: 20,
// color: Colors.black,
// ),
// SizedBox(
// width: 15,
// ),
// Text(
// "Categoryes",
// style: TextStyle(
// fontSize: 19,
// fontWeight: FontWeight.w500,
// color: Colors.black),
// )
// ],
// ),
// ),
// // SizedBox(
// //   height: 20,
// // ),
// // Row(
// //   children: [
// //     Icon(
// //       Icons.settings_rounded,
// //       size: 20,
// //       color: Colors.black87,
// //     ),
// //     SizedBox(
// //       width: 10,
// //     ),
// //     Text(
// //       "Settings",
// //       style: TextStyle(
// //           fontSize: 19, fontWeight: FontWeight.w500),
// //     )
// //   ],
// //  ),
// SizedBox(
// height: 20,
// ),
// InkWell(
// onTap: () {
// HomeBloc.get(context).add(SignOutEvent());
// },
// child: Row(
// children: [
// Icon(
// Icons.logout,
// size: 20,
// color: Colors.black,
// ),
// SizedBox(
// width: 15,
// ),
// Text(
// "Sign Out",
// style: TextStyle(
// fontSize: 19,
// fontWeight: FontWeight.w500,
// color: Colors.black),
// )
// ],
// ),
// ),
// SizedBox(
// height: 20,
// ),
//
// Row(
// children: [
// Icon(
// Icons.info_outline,
// size: 20,
// color: Colors.black,
// ),
// SizedBox(
// width: 15,
// ),
// Text(
// "Info",
// style: TextStyle(
// fontSize: 19,
// fontWeight: FontWeight.w500,
// color: Colors.black),
// )
// ],
// ),
// ],
// ),
// )