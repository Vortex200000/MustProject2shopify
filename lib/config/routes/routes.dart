import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/CartProd.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/HomeLayout.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/Products_screen.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/TheHomeScreen.dart';
import 'package:mustproject2shopify2/features/Login/presentation/pages/Login_screen.dart';
import 'package:mustproject2shopify2/features/Signup/presentation/pages/register_screen.dart';


class RoutesName {
  static const String login = "/";
  static const String signup = "singUp";
  static const String home = "home";
  static const String productsScreen = "Prod";
  static const String cartProd = "cart";
  static const String homeCats = "cats";


}

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => Register(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => TheHome(),
        );
      case RoutesName.homeCats:
        return MaterialPageRoute(
          builder: (context) => HomeLayout(),
        );

      case RoutesName.cartProd:
        return MaterialPageRoute(
          builder: (context) => CartProds(),
        );
      // case RoutesName.productsScreen:
      //   return MaterialPageRoute(builder: (context) => Products_SCREEN(),);
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text("UnDefine Route"),
      ),
      body: Center(
        child: Text("Route Not found"),
      ),
    );
  }
}
