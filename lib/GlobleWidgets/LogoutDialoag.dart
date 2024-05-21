
import 'package:flutter/material.dart';

import '../Const/App_Navigation/App_navigation.dart';
import '../Const/Colors/App_Colors.dart';
import '../Const/constants/MyConst.dart';
import 'CustomText.dart';

class logOutExitAppDialogue extends StatelessWidget {
  void Function()? onTap;
  String? message;
  logOutExitAppDialogue({
    this.message,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: App_Colors.THEME_COLOR_TRANSPARENT,
      child: Container(

        // padding: EdgeInsets.all(10),
        // margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: App_Colors.THEME_COLOR_Light_Green,
            border: Border.all(color: App_Colors.THEME_COLOR_Dark_Green,
                width: 3)),
        // height: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  AppNavigation.navigatorPop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 8.0),
                  child: Icon(
                    Icons.clear_outlined,
                    color: App_Colors.THEME_COLOR_RED,
                    size: 25,
                  ),
                ),
              ),
            ),
            h10,
            h20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomText(
                textAlign: TextAlign.center,
                text: message??"Are you sure you want to logout an account?",
                weight: FontWeight.bold,
                textcolor: App_Colors.THEME_COLOR_Dark_Green,
                fontsize: 22,
              ),
            ),
            h20,
            h20,

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      AppNavigation.navigatorPop(context);
                    },
                    child: Container(
                      padding: h20v15,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                color: App_Colors.THEME_COLOR_Dark_Green,
                                // width: 15.0,
                              ),
                              right: BorderSide(
                                color: App_Colors.THEME_COLOR_Dark_Green,
                                width: .5,
                              ))),
                      child: Center(
                        child: CustomText(
                          text: "No",
                          fontsize: 18,
                          textcolor: App_Colors.THEME_COLOR_Dark_Green,
                        ),
                      ),
                      // color: App_Colors.THEME_COLOR_BLUE,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: h20v15,
                      // height: 120,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                color: App_Colors.THEME_COLOR_Dark_Green,
                                // width: 15.0,
                              ),
                              left: BorderSide(
                                color: App_Colors.THEME_COLOR_Dark_Green,
                                width: .5,
                              ))),
                      child: Center(
                        child: CustomText(
                          text: "Yes",
                          fontsize: 18,
                          textcolor: App_Colors.THEME_COLOR_Dark_Green,
                        ),
                      ),

                      // color: App_Colors.THEME_COLOR_BLUE,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
