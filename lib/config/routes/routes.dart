import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/features/Screens/Login_screen.dart';

import '../../features/Screens/HomeScreen/Presentation/Screens/CartScreen.dart';
import '../../features/Screens/HomeScreen/Presentation/Screens/HomeLayout.dart';
import '../../features/Screens/register_screen.dart';

class RoutesName {
  static const String login = "/";
  static const String signup = "singUp";
  static const String home = "home";

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
          builder: (context) => HomeLayout(),
        );
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
