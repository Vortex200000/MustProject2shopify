import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/config/routes/routes.dart';
import 'package:mustproject2shopify2/features/Screens/HomeScreen/Presentation/Screens/Cats.dart';
import 'package:mustproject2shopify2/features/Screens/HomeScreen/data/Models/CategoryModel.dart';
import 'package:mustproject2shopify2/features/Screens/Login_screen.dart';

import 'CartScreen.dart';
import 'CategoryItem.dart';

class HomeLayout extends StatefulWidget {
  // const HomeLayout({super.key});

  static const String routeName = "Home";
  int index = 0;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black87),
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.index = 1;
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black87,
                  ))
            ],
            title: TextField(

              decoration: InputDecoration(

                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffCDCDCD))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffCDCDCD))),
                  suffixIcon: SizedBox(
                    height: 57,
                    child: ElevatedButton(
                        clipBehavior: Clip.antiAlias,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffD9E7CB),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                        onPressed: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.black87,
                        )),
                  )),
            )),
        drawer: Drawer(
          backgroundColor: Color(0xffD9E7CB),
          child: Column(children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.green,
              child: Center(child: Text("Welcome To Shopify" , style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.index = 0;
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                        Navigator.pop(context);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.category , size: 20, color: Colors.black87,), SizedBox(width: 10,),
                        Text("Categoryes" , style: TextStyle(fontSize: 19 , fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.settings_rounded , size: 20, color: Colors.black87,), SizedBox(width: 10,),
                      Text("Settings" , style: TextStyle(fontSize: 19 , fontWeight: FontWeight.w500),)
                    ],
                  ),
                ],
              ),

            )
          ]),
        ),
        body: widget.index == 1 ? CartScreen() : Cats());
  }
}
