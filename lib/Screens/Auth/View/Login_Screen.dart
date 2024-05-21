


import 'package:flutter/material.dart';
import 'package:zohatech/Const/Colors/App_Colors.dart';
import 'package:zohatech/Const/constants/MyConst.dart';
import 'package:zohatech/GlobleWidgets/CustomButton.dart';
import 'package:zohatech/GlobleWidgets/CustomText.dart';
import 'package:zohatech/GlobleWidgets/TextEditField.dart';
import 'package:zohatech/Network/Auth/AuthController.dart';

import '../../../Const/Strings/App_Strings.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Colors.forthColor,
      body: Padding(
        padding: h20v10,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomText(
                text: AppStrings.LOGIN_TODAY,
                textcolor: App_Colors.THEME_COLOR_BLACK,
                fontsize: 24,
                weight: FontWeight.bold,
              ),
              CustomText(
                text: "Welcome to Todo App",
                textcolor: App_Colors.THEME_COLOR_BLACK,
                fontsize: 14,
              ),

              h20,

              TextFormFiled(
                controller: username,
                hint: "Enter Username",

                validator: (val){
                  if (val!.isEmpty) {
                    return "Username ${AppStrings.Field_EMPTY_ERROR}";
                  }
                },
              ),
              h10,
              TextFormFiled(
                controller: password,
                hint: "Password",
                validator: (val){
                  if (val!.isEmpty) {
                    return "Password ${AppStrings.Field_EMPTY_ERROR}";
                  }
                },

              ),
              h20,

              CustomButton(
                text: "Login",
                radius: 10,
                btnColor: App_Colors.primaryColor,
                onpress: (){

                  if (_formKey.currentState!.validate()) {

                    AuthController.i.Login(
                      username: username.text.trim(),
                      password: password.text.trim(),
                      context: context
                    );

                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Good")));
                  }
                },

              )


            ],
          ),
        ),
      ),
    );
  }
}
