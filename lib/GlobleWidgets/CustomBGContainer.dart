import 'package:flutter/material.dart';


class CustomBackgroundImageContainerWidget extends StatelessWidget {
  final Widget child;
  final Widget? bottom;
  final String? imagePath;
  final BoxFit? boxFit;
  CustomBackgroundImageContainerWidget(
      {required this.child,
        this.boxFit,
        this.imagePath,this.bottom});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(imagePath!), fit: boxFit ?? BoxFit.fill)),
        child: child,
      ),
      bottomNavigationBar: bottom,
    );
  }
}