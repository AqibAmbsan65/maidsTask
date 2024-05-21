import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zohatech/Const/Colors/App_Colors.dart';
import 'package:zohatech/GlobleWidgets/CustomText.dart';
import 'package:zohatech/Screens/Splash/Controller/SplashController.dart';


class Splash_Screen extends StatelessWidget {


  final mycontroller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Colors.forthColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomText(
              text: "TODO Managment System",
              fontsize: 30,
              weight: FontWeight.bold,
              textcolor: App_Colors.THEME_COLOR_BLACK,
            )


          ],
        ),
      ),
    );
  }
}
