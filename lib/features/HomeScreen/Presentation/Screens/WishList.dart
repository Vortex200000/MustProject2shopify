import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/SingleItemShim.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/WishListItem.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetWishEvent()),
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


          } else if (state.homeScreenState == HomeScreenState.GetWishErr) {
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
          } else if (state.homeScreenState == HomeScreenState.GetWishSucc) {
            print("ok");
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.wish?.length != null ? state.wish?.length : 4,
              itemBuilder: (context, index) => state.wish != null
                  ? SingleItemWish(state.wish ?? [], index)
                  : SingleItemShimm(),
            ),
          );
        },
      ),
    );
  }
}
