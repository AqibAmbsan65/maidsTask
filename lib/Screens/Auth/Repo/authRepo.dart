import 'package:flutter/material.dart';
import 'package:zohatech/Const/App_Navigation/App_navigation.dart';
import 'package:zohatech/Const/Colors/App_Colors.dart';
import 'package:zohatech/Const/Route/Named_route.dart';
import 'package:zohatech/Const/Utiles/Utiles.dart';
import 'package:zohatech/Network/Auth/AuthController.dart';
import 'package:zohatech/Network/User_perference/User_Preference_View_Model.dart';
import 'package:zohatech/Network/api_endpoints.dart';
import 'package:zohatech/Screens/Auth/Model/LoginModel.dart';
import '../../../Network/dio_client/dio_client.dart';
import '../../../Network/listner.dart';
import 'dart:convert';

class LoginRepo extends ResponseListener{


  BuildContext? mainContext;


  void LoginRepoMethod({String? username ,String? password, BuildContext? context}) async{

    Map<String, dynamic> map =  {
      "username":username,
      "password":password
    };

    mainContext = context;

    var response = await DioClient().postRequest(
      endPoint: APIEndpoints.login,
      data: map,
      isHeaderRequire: false,
      responseListener: this,
    );

    DioClient().validateResponse(response: response,responseListener: this,message: false);

  }

  @override
  void onSuccess({response}) async {
    // TODO: implement onSuccess
    print(response);
    AuthController.i.loginModel.value = LoginModel.fromJson(response);
    print("hello Aqib${AuthController.i.loginModel.value.id}");


    SharedPreference().setUser(user: jsonEncode(response));
    SharedPreference().setBearerToken(token: AuthController.i.loginModel.value.token);
    print(SharedPreference().getUser()!.firstName);
    utiles.ShowSnackBar("Login", "Login Successfully", App_Colors.THEME_COLOR_BLUE);
    AppNavigation.navigateToRemovingAll(mainContext, Named_route.Home_Screen);

    //
    // "username":"atuny0",
    // "password":"9uQFF1Lh"


  }

  @override
  void onFailure({response}) {
    // TODO: implement onFailure
    print(response);

  }
}



