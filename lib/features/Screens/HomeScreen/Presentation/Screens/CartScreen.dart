import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset("assets/images/Empty_cart@1.png")),
        SizedBox(height: 20,),
        Center(child: Text("Your Cart Is Empty" , style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 19),))
      ],

    );
  }
}
