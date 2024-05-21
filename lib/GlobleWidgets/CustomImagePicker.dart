import 'dart:io';

import 'package:flutter/material.dart';

import '../Const/Colors/App_Colors.dart';

class CustomUserProfileImageWidget extends StatelessWidget {


  final String? imagePath, imageType;
  final VoidCallback? onTap;
  bool? circleAvatarShow;
  String? groupImageUrl,img;
  bool? edit ;
  int? ns;
  bool? setprofile;
  bool? internetimg;

  CustomUserProfileImageWidget(
      {this.imagePath,
        this.imageType,
        this.groupImageUrl,
        this.onTap,
        required this.circleAvatarShow,
        this.edit =false,
        this.ns = 1,
        this.setprofile = false,
        this.img,
        this.internetimg
      });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          circleAvatarShow == true
              ? Stack(
            children: [
              InkWell(
                onTap: onTap,
                child: CircleAvatar(
                    radius: 65,
                    backgroundColor: App_Colors.THEME_COLOR_Yellow,
                    child: imageType == "NETWORK" ? SizedBox()
                        : imageType == "FILE" ?
                    CircleAvatar(
                        radius: 60,
                        backgroundImage:
                        FileImage(File(imagePath!))) : setprofile==false?const CircleAvatar(
                      radius: 60,
                      backgroundColor: App_Colors.THEME_COLOR_Yellow,
                      child: Icon(Icons.camera_alt,
                        color: App_Colors.THEME_COLOR_WHITE,
                      size: 32,),
                    ):internetimg==false?CircleAvatar(
                      radius: 60,
                      backgroundColor: App_Colors.THEME_COLOR_LIGHT_BLUE,
                      backgroundImage: AssetImage(img.toString()),
                    ):CircleAvatar(
                      radius: 60,
                      backgroundColor: App_Colors.THEME_COLOR_LIGHT_BLUE,
                      backgroundImage: NetworkImage(img.toString()),
                    )
                ),
              ),

              // Edit Options

              edit == true?Positioned(
                bottom: 5,
                right: 5,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child:
                      Icon(Icons.edit, size: 20, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            50,
                          ),
                        ),
                        color: Color(0xff77A2D6),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 4),
                            color: Colors.black.withOpacity(
                              0.3,
                            ),
                            blurRadius: 3,
                          ),
                        ]),
                  ),
                ),
              ):Container(),
            ],
          )
              : SizedBox(),
        ],
      ),
    );
  }
}