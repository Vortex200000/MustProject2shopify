

import 'package:flutter/material.dart';

import '../../core/utils/App_strings.dart';

class Register extends StatelessWidget {
  // const Register({super.key});
  static const String routeName = "Register";
  var regkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: regkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Container(),
              Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[  Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
                        ),

                      ), SizedBox(width: 5,),Text(
                        MyappStrings.Shopify,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),]
                  )),
              SizedBox(height: 30,),
              Center(
                child: Text(
                  MyappStrings.Letsregister,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(MyappStrings.DoYouhave)),
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 15, right: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty)
                          {
                            return MyappStrings.FirstnError;
                          }
                      },
                      decoration: InputDecoration(
                        fillColor: Color(0xfff5f8fa),
                        filled: true,
                        hintText: MyappStrings.firstname,
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
                        if(value == null || value.isEmpty)
                        {
                          return MyappStrings.FirstnError;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Color(0xfff5f8fa),
                        filled: true,
                        hintText: MyappStrings.lastname,
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
                        if(value == null || value.isEmpty)
                        {
                          return MyappStrings.FirstnError;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Color(0xfff5f8fa),
                        filled: true,
                        hintText: MyappStrings.Email,
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
                        if(value == null || value.isEmpty)
                        {
                          return MyappStrings.FirstnError;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Color(0xfff5f8fa),
                        filled: true,
                        hintText: MyappStrings.Phone,
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
                        if(value == null || value.isEmpty)
                        {
                          return MyappStrings.FirstnError;
                        }
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
                            if(regkey.currentState!.validate())
                              {
                                return ;
                              }

                          },
                          child: Text(MyappStrings.Register),
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
                                  ImageIcon(AssetImage("assets/images/facebook.png"), color: Colors.grey, size: 15,),
                                  SizedBox(width: 5,),
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
                                Image.asset("assets/images/gmail-icon-png-black-51.png",width: 20 , height: 20,),
                                SizedBox(width: 5,),
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
      ),
    );;
  }
}
