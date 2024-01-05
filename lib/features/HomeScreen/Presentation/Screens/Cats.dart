import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/CatItemShimmer.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';

import 'CategoryItem.dart';
import 'package:shimmer/shimmer.dart';

class Cats extends StatelessWidget {
  // const Cats({super.key});
  // List<CategoryModel> categories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetAllCategoryEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.homeScreenState == HomeScreenState.loading) {
            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     backgroundColor: Colors.transparent,
            //     elevation: 0,
            //     title: Center(
            //         child: CircularProgressIndicator(
            //       color: Colors.grey,
            //     )),
            //   ),
            // );
          } else if (state.homeScreenState == HomeScreenState.GetCatError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("An Error Ocurred"),
                content: Text(state.homeFail?.message ?? ""),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              ),
            );
          } else if (state.homeScreenState == HomeScreenState.GetCatSucsses) {

          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, bottom: 30),
                  child: Text(
                    "Shop by Category",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 81),
                      itemCount: state.CatData?.length != null
                          ? state.CatData?.length
                          : 4,
                      itemBuilder: (context, index) => state.CatData != null
                          ? CategoryItem(state.CatData ?? [], index)
                          :

                          // Center(child: CircularProgressIndicator(
                          //   color: Colors.grey,
                          // )
                          //
                          // ),
                          CategoryItemShimm()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
