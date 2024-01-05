import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/config/routes/routes.dart';

import 'core/cashe/Shared_Pref.dart';
import 'core/utils/opserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await SharedPreff.init();
  String start;
  String? token = SharedPreff.GetToken(Key: "token");

  if (token == null) {
    start = "/";
  } else {
    start = "home";
  }
  runApp( MyApp(start));
}

class MyApp extends StatelessWidget {
  String start;
   MyApp( this.start, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: start,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRouter.onGenerate(settings),
    );
  }
}
