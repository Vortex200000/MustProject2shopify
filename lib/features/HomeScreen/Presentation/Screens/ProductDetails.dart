import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/SizeItemUnselected.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/itemColor.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/entities/ProdEntity.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../../config/routes/routes.dart';
import 'ProductSearch.dart';

class ProductDetails extends StatefulWidget {
  // const ProductDetails({super.key});

  DataProdEntity productEntityDetail;

  ProductDetails(this.productEntityDetail);

  int currentIndex = 0;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Color> itemcolor = [
    Color(0xff2F2929),
    Color(0xffBC3018),
    Color(0xff0973DD),
    Color(0xff02B935),
    Color(0xffFF645A)
  ];

  // int itemCounter = 0;
  List<int> Sizes = [39, 42, 40, 31, 38, 39];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeBloc()..add(GetAllProductsEvent()),
  child: BlocConsumer<HomeBloc, HomeState>(
  listener: (context, state) {
    if(state.homeScreenState == HomeScreenState.loading)
    {
      showDialog(context: context, builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: CircularProgressIndicator(color: Colors.grey,)),

      ),);
    }
    else if(state.homeScreenState == HomeScreenState.AddCartErr || state.homeScreenState==HomeScreenState.GetProductError)
    {
      showDialog(context: context, builder: (context) => AlertDialog(


        title: Text("An Error Occurred")
        ,content: Text(state.homeFail?.message??""),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],

      ),);
    }
    else if(state.homeScreenState == HomeScreenState.AddCartSucc)
    {
      Navigator.pop(context);


      showDialog(context: context, builder: (context) => AlertDialog(


        title: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check , color: Colors.white,),
            SizedBox(width: 50,),

            Text("Added To Cart" , style: TextStyle(color: Colors.white),),
            SizedBox(width: 60,),

          ],
        )),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.black,


      ),);
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 398,

                      child: CarouselSlider.builder(
                        itemCount: widget.productEntityDetail.images?.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            child: ClipRRect(
                              child: InkResponse(
                                child: Image.network(
                                  widget.productEntityDetail.images?[index] ??
                                      "",
                                  width: 398,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              widget.currentIndex = index;
                            });
                          },
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          autoPlayCurve: Curves.linear,
                          scrollPhysics: BouncingScrollPhysics(),
                          autoPlay: true,
                          enlargeCenterPage: false,
                          height: 300,
                          enlargeFactor: 4,
                          animateToClosest: true,
                          viewportFraction: 1.5,
                          padEnds: false,

                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffD9E7CB),
                        // image: DecorationImage(
                        //     image: NetworkImage(widget.productEntityDetail.imageCover??""),
                        //     fit: BoxFit.cover),
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: widget.productEntityDetail.images!.length,
                      position: widget.currentIndex,
                      decorator: DotsDecorator(activeColor: Colors.black),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Color(0xffD9E7CB),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 398,

                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Eg ${widget.productEntityDetail.price}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                  "Eg ${widget.productEntityDetail.price! - ((widget.productEntityDetail.price! / 100) * 20)} "),
                                              Container(
                                                width: 55,
                                                height: 1,
                                                color: Colors.black,
                                              )
                                            ]),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 10,
                                          right: 10),
                                      child: Text(
                                        "20% off",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffD9E7CB),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              Text(widget.productEntityDetail.title.toString()),
                              SizedBox(
                                height: 16,
                              ),

                              Text(widget.productEntityDetail.description.toString()),

                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Colors",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              // ItemColour(itemcolor[4]),
                              SizedBox(
                                height: 60,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1),
                                  itemCount: itemcolor.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      ItemColour(itemcolor[index]),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              Text(
                                "Sizes",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 60,
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1),
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        SizeItemUnSelected(Sizes, index)),
                              ),

                              SizedBox(
                                height: 16,
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  HomeBloc.get(context).id = widget.productEntityDetail.id;
                                  HomeBloc.get(context).add(AddToCartEvent());



                                },
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffD9E7CB),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  },
),
);
  }
}
