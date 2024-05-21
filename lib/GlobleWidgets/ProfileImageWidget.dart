import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zohatech/GlobleWidgets/GalleryWidget.dart';
import '../Const/Strings/App_Strings.dart';
import '../Network/Auth/AuthController.dart';
import 'CustomImagePicker.dart';


class UserProfileimageWidget extends StatefulWidget {
  bool? edit,setprofile;
  String? img;
  bool internetimg;


  UserProfileimageWidget({this.edit, this.setprofile = false, this.img,this.internetimg = false});

  @override
  State<UserProfileimageWidget> createState() => _UserProfileimageWidgetState(edit: edit,img: img,setprofile: setprofile);
}

class _UserProfileimageWidgetState extends State<UserProfileimageWidget> {

  String? img;
  ImageGalleryClass _imageGalleryClass = ImageGalleryClass();
  bool? edit,setprofile;

  _UserProfileimageWidgetState({this.img, this.edit, this.setprofile});

  @override
  Widget build(BuildContext context) {
    return CustomUserProfileImageWidget(
      img: img,
      edit: edit,
      internetimg: widget.internetimg,
      setprofile: setprofile,
      circleAvatarShow: true,
      imagePath: AuthController.i.profileNetworkPath != null
          ? AuthController.i.profileNetworkPath
          : AuthController.i.profileFileImage != null
          ? AuthController.i.profileFileImage!.path
          : null,
      imageType: AuthController.i.profileNetworkPath != null
          ? "NETWORK"
          : AuthController.i.profileFileImage != null
          ? "FILE"
          : null,
      onTap: () {
        imageGalleryOption();
      },
    );
  }

//Select Image Start
  void imageGalleryOption() {
    _imageGalleryClass.imageGalleryBottomSheet(
        context: context,
        onCameraTap: () {
          getImage(imageText: AppStrings.CAMERA_TEXT);
        },
        onGalleryTap: () {
          getImage(imageText: AppStrings.GALLERY_TEXT);
        });
  }
  void getImage({String? imageText}) async {
    if (imageText == AppStrings.CAMERA_TEXT) {
      AuthController.i.profileImagePath = await _imageGalleryClass.getCameraImage();
      cropImage(imagePath: AuthController.i.profileImagePath);
    } else if (imageText == AppStrings.GALLERY_TEXT) {
      AuthController.i.profileImagePath = await _imageGalleryClass.getGalleryImage();
      cropImage(imagePath: AuthController.i.profileImagePath);
    }
  }
  void cropImage({String? imagePath}) async {
    //Ya us hoa modal bottom sheet ko pop krna ka liy
    Get.back();
    if (imagePath != null) {
      AuthController.i.profileTempFileImage =
      await _imageGalleryClass.cropImage(imageFilePath: imagePath);
      if (AuthController.i.profileTempFileImage != null) {
        AuthController.i.profileFileImage = AuthController.i.profileTempFileImage;
        AuthController.i.profileNetworkPath = null;
      }
      setState(() {});
    }
  }

}

