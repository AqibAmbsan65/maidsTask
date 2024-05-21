import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Const/Colors/App_Colors.dart';



class TextFormFiled extends StatelessWidget {


  String? Function(String?)? validator;

  VoidCallback? onpress;
  TextEditingController controller;
  String? hint,label;
  IconData? icons,suffixIcon;
  int? lines , maxlength;
  TextInputType textInputType;
  bool? maxlentvalidation ,decoration,surfixicon , prefixicon ;
  double? hintfontsize ;
  Color? hintcolor,bgcolor, iconcolor,surfixiconcolor;
  TextInputAction? textInputAction;
  Function(String)? submit;
  bool readonly,autofocus;
  double raduisss , iconsize;
  List<TextInputFormatter>? inputFormatters;
  bool obsecure;


  TextFormFiled({
    required this.controller ,
    this.inputFormatters,
    this.hint = "",
    this.icons,
    this.lines = 1 ,
    this.textInputType = TextInputType.text,
    this.validator,
    this.surfixicon= false,
    this.prefixicon= false,
    this.suffixIcon,
    this.surfixiconcolor,
    this.maxlength = 35,
    this.maxlentvalidation = false,
    this.hintfontsize = 16.0,
    this.hintcolor = Colors.black,
    this.onpress,
    this.readonly = false,
    this.decoration = false,
    this.bgcolor = App_Colors.THEME_COLOR_WHITE,
    this.textInputAction,
    this.submit,
    this.iconcolor = Colors.white,
    this.raduisss = 10.0,
    this.iconsize = 25.0,
    this.label,
    this.autofocus = false,
    this.obsecure = false
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        onTap: onpress,
        obscureText: obsecure,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        onFieldSubmitted: submit,
        validator: validator,
        readOnly: readonly,
        controller: controller,
        autofocus: autofocus,
        maxLines: lines,
        keyboardType: textInputType,
        maxLength:  maxlength,
        style: TextStyle(
          color: hintcolor
        ),
        decoration: InputDecoration(
          counterText: maxlentvalidation == false?"":"/${maxlength}",
          filled: true,
          fillColor: bgcolor,
          border:InputBorder.none,
          hintText: "$hint",
          // label: Text(label!,style: const TextStyle(fontWeight: FontWeight.bold),),
          focusedBorder: decoration==false?OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(raduisss)):OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLACK.withOpacity(0.5)),borderRadius: BorderRadius.circular(raduisss)),
          enabledBorder: decoration==false?OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(raduisss)):OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLACK.withOpacity(0.5)),borderRadius: BorderRadius.circular(raduisss)),
          errorBorder: decoration==false?OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(raduisss)):OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLACK.withOpacity(0.5)),borderRadius: BorderRadius.circular(raduisss)),
          focusedErrorBorder: decoration==false?OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(raduisss)):OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLACK.withOpacity(0.5)),borderRadius: BorderRadius.circular(raduisss)),
          hintStyle: TextStyle(fontSize: hintfontsize,color: hintcolor),
          prefixIcon: prefixicon == true?Icon(icons,size: iconsize,color: iconcolor):null,
          suffixIcon: surfixicon == true?Icon(suffixIcon,size: 30.0,color: surfixiconcolor):null,
        ),
      ),

    );
  }
}
