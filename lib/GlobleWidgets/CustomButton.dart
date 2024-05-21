import 'package:flutter/material.dart';

import '../Const/constants/MyConst.dart';

class CustomButton extends StatelessWidget {


  VoidCallback? onpress;
  double? height , fontsize , width , radius,iconsize;
  Color? btnColor , textcolor , iconcolor;
  String? text;
  IconData? iconData;
  bool iconvissable;


  CustomButton(
      {this.onpress,
        this.height = 50,
        this.fontsize = 19,
        this.width = double.infinity,
        this.radius = 28,
        this.btnColor = const Color(0xff4CE5A3),
        this.textcolor = Colors.white,
        this.text = "Next",
        this.iconData,
        this.iconcolor,
        this.iconsize,
        this.iconvissable = false
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(radius!)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            iconvissable==true?Icon(iconData
              ,color: iconcolor,size: iconsize,):SizedBox(),
            iconvissable==true?w7:Container(),
            Center(child: Text("${text}",style: TextStyle(
                color: textcolor,fontSize: fontsize
            ),)),
          ],
        ),
      ),
    );
  }
}
