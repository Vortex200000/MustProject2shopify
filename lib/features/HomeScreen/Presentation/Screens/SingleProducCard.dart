import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/ProductDetails.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/manager/home_bloc.dart';

import '../../domain/entities/ProdEntity.dart';

class SingleItem extends StatelessWidget {
  // const SingleItem({super.key});

  List<DataProdEntity> Prod;
  List<DataProdEntity> specific = [];

  int index;
  String name;

  SingleItem(this.Prod, this.index, this.name);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeBloc(),
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
    else if(state.homeScreenState == HomeScreenState.AddCartErr)
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
  },
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 69, top: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(createList()[index]),));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffD9E7CB), width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: Row(children: [
            Expanded(
              child: Container(
                width: 150,
                height: 252,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(createList()[index].imageCover??"")),
                    color: Color(0xffD9E7CB),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
              ),
            ),
            Expanded(
              child: Container(
                width: 193,
                height: 252,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          createList()[index].title??"",
                          style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Eg ${createList()[index].price.toString() ?? ""} ",
                                style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Stack(alignment: Alignment.center, children: [
                              Text("Eg ${createList()[index].price!-((createList()[index].price!/100)*20)} " , overflow: TextOverflow.ellipsis,),
                              Container(
                                width: 55,
                                height: 1,
                                color: Colors.black,
                              )
                            ]),
                          ],
                        ),
                      ),

                      Expanded(child: Text("20% discount")),

                      Expanded(child: Text("Get it by Tomorrow, May 26")),

                      Expanded(child: Text("Free Delivery Available")),

                      Expanded(
                        child: SizedBox(
                            height: 35,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                HomeBloc.get(context).id = createList()[index].id;
                                HomeBloc.get(context).add(AddToCartEvent());

                              },
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
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
      ),
    );
  },
),
);
  }

  List<DataProdEntity> createList() {
    for (int i = 0; i < Prod.length; i++) {
      if (Prod[i].category?.name == name) {
        specific.add(Prod[i]);
      }

    }
    return specific;
  }
}
