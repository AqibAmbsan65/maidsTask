import 'package:flutter/material.dart';
import 'package:zohatech/Const/constants/MyConst.dart';
import 'package:zohatech/GlobleWidgets/CustomText.dart';
import 'package:zohatech/Network/User_perference/User_Preference_View_Model.dart';

import '../../../Const/App_Navigation/App_navigation.dart';
import '../../../Const/Colors/App_Colors.dart';
import '../../../Const/Route/Named_route.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          Container(
            padding: h15v10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                  NetworkImage("${SharedPreference().getUser()!.image}"
                  ),
                  radius: 40,
                ),
                h10,
                CustomText(
                  text:
                  "${SharedPreference().getUser()!.firstName} ${SharedPreference().getUser()!.lastName}",
                  fontsize: 18,
                  textcolor: App_Colors.THEME_COLOR_BLACK,
                  weight: FontWeight.bold,
                ),
                CustomText(text: "${SharedPreference().getUser()!.email}",
                  textcolor: App_Colors.THEME_COLOR_BLACK,
                  weight: FontWeight.w500,
                )
              ],
            ),
          ),

          Divider(),

          h30,
          GestureDetector(
            onTap: (){
              SharedPreference().clear();
              AppNavigation.navigateToRemovingAll(
                  context, Named_route.Login_Screen);
            },
            child: Container(
              padding: h15v10,
              margin: EdgeInsets.only(right: 100),
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: App_Colors.thirdColor
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Logout",
                      fontsize: 18,
                      textcolor: App_Colors.THEME_COLOR_BLACK,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.logout)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
