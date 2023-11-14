import 'package:flutter/material.dart';
import 'package:mustproject2shopify2/core/utils/App_strings.dart';
import 'package:mustproject2shopify2/features/Screens/HomeScreen/Presentation/Screens/HomeLayout.dart';

class Login extends StatelessWidget {
  // const Login({super.key});

  static const String routName = "login";
  var logKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: logKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                MyappStrings.Shopify,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ])),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 15, right: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyappStrings.LetsLogin,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(MyappStrings.Donthaveacc),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return MyappStrings.usernameerror;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Color(0xfff5f8fa),
                      filled: true,
                      hintText: MyappStrings.username,
                      focusColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return MyappStrings.passworderror;
                      }
                      return null;


                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xfff5f8fa),
                      filled: true,
                      hintText: MyappStrings.password,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (logKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLayout(),));
                          }
                        },
                        child: Text(MyappStrings.Login),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff000dae)),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/images/facebook.png"),
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(MyappStrings.Facebook,
                                    style: TextStyle(color: Colors.grey))
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black87),
                                    borderRadius: BorderRadius.circular(5)))),
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              // ImageIcon(AssetImage("assets/images/gmail-icon-png-black-51.png"),color: Colors.grey, size: 15,),
                              Image.asset(
                                "assets/images/gmail-icon-png-black-51.png",
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                MyappStrings.Gmail,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
