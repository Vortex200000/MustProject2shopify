import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/features/Screens/Login_screen.dart';
import 'package:mustproject2shopify2/features/Screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routName,
      routes: {
        Login.routName:(context) => Login(),
        Register.routeName:(context) => Register(),

      },
    );
  }
}
