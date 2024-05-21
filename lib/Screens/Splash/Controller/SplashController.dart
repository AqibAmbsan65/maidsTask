import 'dart:async';

import 'package:get/get.dart';
import 'package:zohatech/Const/App_Navigation/App_navigation.dart';
import 'package:zohatech/Const/Route/Named_route.dart';
import 'package:zohatech/Network/User_perference/User_Preference_View_Model.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _SharePreference();
    OnCheck();
  }

  void _SharePreference() {
    SharedPreference().sharedPreference;
  }


  void OnCheck(){
    Timer(Duration(seconds: 3),() => onComplete());

  }


  void onComplete(){

    if (SharedPreference().getUser() == null) {
      Get.offNamed(Named_route.Login_Screen);
    }  else{
      Get.offNamed(Named_route.Home_Screen);
    }


  }



}