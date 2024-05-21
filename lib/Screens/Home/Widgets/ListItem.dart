import 'package:flutter/material.dart';

import '../../../Const/Colors/App_Colors.dart';
import '../../../Const/constants/MyConst.dart';
import '../../../GlobleWidgets/CustomText.dart';



class ListItem extends StatelessWidget {
  String? todo;
  bool? status;
  VoidCallback? deleteontap;
  VoidCallback? editontap;

  ListItem({this.todo, this.deleteontap, this.editontap, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: h10v5,
      padding: h10v5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: App_Colors.THEME_COLOR_WHITE,
          boxShadow: [
            BoxShadow(
                color: App_Colors.THEME_COLOR_BLACK.withOpacity(0.5),
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 2)
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "$todo",
                  textcolor: App_Colors.primaryColor,
                  weight: FontWeight.w500,
                  fontsize: 16,
                ),
                h5,
                Row(
                  children: [
                    CustomText(
                      text: "Status: ",
                      fontsize: 14,
                      textcolor: App_Colors.THEME_COLOR_BLACK,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "$status",
                      textcolor: status == false
                          ? App_Colors.THEME_COLOR_RED
                          : App_Colors.THEME_COLOR_GREEN,
                      fontsize: 14,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                h5,
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: deleteontap,
                  icon: const Icon(
                    Icons.delete,
                    color: App_Colors.THEME_COLOR_RED,
                    size: 32,
                  )),
              IconButton(
                  onPressed: editontap,
                  icon: const Icon(
                    Icons.edit,
                    color: App_Colors.THEME_COLOR_BLUE,
                    size: 32,
                  ))
            ],
          )
        ],
      ),
    );
  }
}


