import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Login/presentation/pages/Login_screen.dart';
import 'ProduHomShim.dart';
import 'ProductsInHomeCard.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreenNaav extends StatefulWidget {
  // const HomeScreenNaav({super.key});
  bool flag = true;
  int currentIndex = 0;

  @override
  State<HomeScreenNaav> createState() => _HomeScreenNaavState();
}

class _HomeScreenNaavState extends State<HomeScreenNaav> {
  int focusedIndex = 0;
  int prog = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetAllProductsEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state)
            // TODO: implement listener
            {
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
            print(HomeBloc.get(context).bell);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Stack(alignment: Alignment.center, children: [
                        Icon(
                          FontAwesomeIcons.bell,
                          size: 20,
                        ),
                        HomeBloc.get(context).bell == true
                            ? Positioned(
                                top: 0,
                                right: 10,
                                bottom: 45,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                ))
                            : SizedBox.shrink()
                      ]),
                      decoration: BoxDecoration(
                          color: Color(0x9BE5E5E5), shape: BoxShape.circle),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(alignment: Alignment.bottomCenter, children: [
                        CarouselSlider.builder(
                          itemCount: state.Products?.length != null
                              ? state.Products?.length
                              : 0,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffD9E7CB)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkResponse(
                                  child: CachedNetworkImage(
                                    imageUrl: state.Products != null
                                        ? state.Products![index].images![0]
                                        : "https://via.placeholder.com/300x300",
                                    width: 350,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 350,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(state
                                                              .Products !=
                                                          null
                                                      ? state.Products![index]
                                                          .images![0]
                                                      : "https://via.placeholder.com/300x300"),
                                                  fit: BoxFit.fitWidth,
                                                  alignment: Alignment.center)),
                                        ),
                                      ),
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 350,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(state
                                                          .Products !=
                                                      null
                                                  ? state.Products![index]
                                                      .images![0]
                                                  : "https://via.placeholder.com/300x300"),
                                              fit: BoxFit.fitWidth,
                                              alignment: Alignment.center)),
                                    ),
                                  )

// state.Products != null
//     ? Image.network(
//         state.Products![index].images![index],
//         width: 350,
//         height: 150,
//         fit: BoxFit.cover,
//       )
//     : Center(
//         child: CircularProgressIndicator())

                                  ,
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
                              height: 200,
                              enlargeFactor: 4,
                              animateToClosest: true,
                              viewportFraction: 1.5,
                              padEnds: false,
                              pauseAutoPlayOnTouch: true

// clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 20),
                        child: Text(
                          "New Products.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SizedBox(
                          height: 250,
                          child: PageView.builder(
                            physics: BouncingScrollPhysics(),
                            controller: PageController(viewportFraction: 0.5),
                            onPageChanged: (value) {
                              setState(() {
                                focusedIndex = value;
                              });
                            },
                            itemBuilder: (context, index) =>
                                state.Products != null
                                    ? Transform.scale(
                                        // transformHitTests: true,
                                        scale: focusedIndex == index ? 1 : 0.7,
                                        child: ProductsInHomeCard(
                                            state.Products ?? [], index))
                                    : ProductsInHomeCardShimm(),
                            itemCount: state.Products?.length != null
                                ? state.Products?.length
                                : 4,
                          ),
                        ),
                      )

//
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// SizedBox(
//                           height: 250,
//                           child: GridView.builder(
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 1,
//                                       mainAxisSpacing: 30,
//                                       childAspectRatio: 4 / 3),
//                               physics: BouncingScrollPhysics(),
// // controller: ScrollController(keepScrollOffset: false),
// //  shrinkWrap: true,
//                               itemCount: state.Products?.length != null
//                                   ? state.Products?.length
//                                   : 4,
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (context, index) =>
//                                   state.Products != null
//                                       ? ProductsInHomeCard(
//                                           state.Products ?? [], index)
//                                       : ProductsInHomeCardShimm()))
