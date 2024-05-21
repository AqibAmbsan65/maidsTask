import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  String? text;
  Color? textcolor;
  FontWeight? weight;
  double? fontsize ;
  TextAlign? textAlign;
  TextDecoration? textDecoration;
  int? maxlines;
  TextOverflow? textOverflow;


  CustomText({this.text, this.textcolor, this.weight, this.fontsize = 16 , this.textAlign ,this.textDecoration,this.maxlines,this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        overflow: textOverflow,
        style: TextStyle(color: textcolor,fontWeight: weight,fontSize: fontsize,decoration: textDecoration),textAlign: textAlign,maxLines: maxlines,
    );
  }
}


