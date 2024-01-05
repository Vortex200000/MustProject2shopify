import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustproject2shopify2/config/routes/routes.dart';
import 'package:mustproject2shopify2/core/API/API_Manager.dart';
import 'package:mustproject2shopify2/core/utils/App_strings.dart';
import 'package:mustproject2shopify2/features/HomeScreen/Presentation/Screens/TheHomeScreen.dart';


import 'package:mustproject2shopify2/features/Login/data/remote/data_sources/LoginRemoteDs.dart';
import 'package:mustproject2shopify2/features/Login/data/repository/LoginRepoImpl.dart';
import 'package:mustproject2shopify2/features/Login/domain/Login_Use_Cases/Login_usecase.dart';
import 'package:mustproject2shopify2/features/Login/presentation/bloc/login_bloc.dart';

import '../../../HomeScreen/Presentation/Screens/HomeLayout.dart';
import '../../data/remote/data_sources/LoginRemoteDsImpl.dart';

class Login extends StatelessWidget {
  // const Login({super.key});

  static const String routName = "login";
  var logKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context ) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenState == ScreenState.Loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                )),
              ),
            );
          } else if (state.screenState == ScreenState.LoginError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error Occurred"),
                content: Text(state.failures?.message ?? ""),
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
          } else if (state.screenState == ScreenState.LoginSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => TheHome(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            body: Form(
              key: logKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50))),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          MyappStrings.Shopify,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ])),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, top: 15, right: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyappStrings.LetsLogin,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(MyappStrings.Donthaveacc),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: LoginBloc.get(context).EmailController,
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
                          controller: LoginBloc.get(context).PassController,

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
                                  LoginBloc.get(context)
                                      .add(SignInBtnClicked());
                                }
                              },
                              child: Text(MyappStrings.Login),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff000dae)),
                            )),
                        SizedBox(
                          height: 5,
                        ),

                        InkWell(
                            onTap: () {},
                            child:
                                Center(child: Text("Forget Your Password ?"))),
                        SizedBox(
                          height: 5,
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.signup);
                          },
                          child: Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(text: "Dont Have An Account ?"),
                              TextSpan(
                                  text: " Create One.",
                                  style: TextStyle(color: Color(0xff000dae)))
                            ])),
                          ),
                        )
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: ElevatedButton(
                        //           onPressed: () {},
                        //           child: Row(
                        //             children: [
                        //               ImageIcon(
                        //                 AssetImage(
                        //                     "assets/images/facebook.png"),
                        //                 color: Colors.grey,
                        //                 size: 15,
                        //               ),
                        //               SizedBox(
                        //                 width: 5,
                        //               ),
                        //               Text(MyappStrings.Facebook,
                        //                   style: TextStyle(color: Colors.grey))
                        //             ],
                        //           ),
                        //           style: ElevatedButton.styleFrom(
                        //               backgroundColor: Colors.white,
                        //               elevation: 0,
                        //               shape: RoundedRectangleBorder(
                        //                   side:
                        //                       BorderSide(color: Colors.black87),
                        //                   borderRadius:
                        //                       BorderRadius.circular(5)))),
                        //     ),
                        //     SizedBox(
                        //       width: 26,
                        //     ),
                        //     Expanded(
                        //       child: ElevatedButton(
                        //         onPressed: () {},
                        //         child: Row(
                        //           children: [
                        //             // ImageIcon(AssetImage("assets/images/gmail-icon-png-black-51.png"),color: Colors.grey, size: 15,),
                        //             Image.asset(
                        //               "assets/images/gmail-icon-png-black-51.png",
                        //               width: 20,
                        //               height: 20,
                        //             ),
                        //             SizedBox(
                        //               width: 5,
                        //             ),
                        //             Text(
                        //               MyappStrings.Gmail,
                        //               style: TextStyle(color: Colors.grey),
                        //             )
                        //           ],
                        //         ),
                        //         style: ElevatedButton.styleFrom(
                        //             backgroundColor: Colors.white,
                        //             elevation: 0,
                        //             shape: RoundedRectangleBorder(
                        //                 side: BorderSide(color: Colors.black87),
                        //                 borderRadius:
                        //                     BorderRadius.circular(5))),
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
