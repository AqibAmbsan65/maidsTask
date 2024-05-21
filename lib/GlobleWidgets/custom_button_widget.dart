
import 'package:flutter/material.dart';

import '../Const/Colors/App_Colors.dart';
import 'CustomText.dart';

class CustomButtonImageIconWidget extends StatelessWidget {
  final double containerWidth;
  final double? containerheight;
  final double? fontSize, borderRadius;
  final double? paddingTop, paddingBottom, paddingLeft;
  final String buttonText;
  final VoidCallback? onTap;
  final Icon? icon;
  double? widthSpace;
  final Color? textColor, buttonColor;
  final bool? isIconShow;
  final Image? image;
  final bool? isImageShow;
  bool? isGradientShow, borderRadiusCircular, showShadow;
  double? leftImagePadding;
  CustomButtonImageIconWidget(
      {required this.containerWidth,
      this.containerheight,
      this.borderRadiusCircular = false,
      this.paddingTop,
      this.showShadow = false,
      this.leftImagePadding,
      this.icon,
      this.isGradientShow,
      required this.widthSpace,
      this.image,
      this.isImageShow = false,
      this.isIconShow = false,
      this.paddingBottom,
      this.paddingLeft,
      this.textColor,
      this.fontSize,
      this.borderRadius,
      this.buttonColor,
      required this.buttonText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    print(borderRadiusCircular);
    return Container(
      width: containerWidth,
      height: containerheight ?? 55,
      decoration: BoxDecoration(
          boxShadow: [
            showShadow == true
                ? const BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                : const BoxShadow(
                    color: Colors.grey,
                    blurRadius: 0.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      0.0, // Move to bottom 5 Vertically
                    ))
          ],
          borderRadius: borderRadiusCircular == false
              ? BorderRadius.circular(borderRadius ?? 10.0)
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
          color: buttonColor ?? App_Colors.THEME_COLOR_WHITE,
          gradient: isGradientShow == true
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0XFFF192150),
                    Color(0XFF004694),
                  ],
                )
              : null),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadiusCircular == false
              ? BorderRadius.circular(borderRadius ?? 50.0)
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
                top: paddingTop ?? 14.0,
                bottom: paddingBottom ?? 14.0,
                left: paddingLeft ?? 0),
            child: Row(
              children: [
                SizedBox(
                  width: leftImagePadding ?? 25,
                ),
                isIconShow! ? icon! : Container(),
                isImageShow! ? image! : Container(),
                SizedBox(
                  width: widthSpace,
                ),
                CustomText(
                  text: buttonText,
                  textcolor: textColor ?? App_Colors.THEME_COLOR_WHITE,
                  fontsize: fontSize ?? 17,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  maxlines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
