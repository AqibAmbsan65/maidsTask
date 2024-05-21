import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../Const/Colors/App_Colors.dart';

class ImageGalleryClass {
  ImagePicker picker = ImagePicker();

  XFile? getFilePath;
  File? imageFile;
  //Select Image Start
  void imageGalleryBottomSheet(
      {BuildContext? context,
      VoidCallback? onCameraTap,
      VoidCallback? onGalleryTap}) {
    showModalBottomSheet(
        context: context!,
        builder: (_) {
          return Container(
            color: App_Colors.THEME_COLOR_Dark_Green,
            child: SafeArea(
              child: Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: onCameraTap,
                    child: Container(
                      color: App_Colors.THEME_COLOR_TRANSPARENT,
                      margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: onGalleryTap,
                    child: Container(
                      color: App_Colors.THEME_COLOR_TRANSPARENT,
                      margin: EdgeInsets.only(top: 9.0, bottom: 15.0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void getVideoBottomSheet(
      {BuildContext? context,
      VoidCallback? onCameraTap,
      VoidCallback? onGalleryTap}) {
    showModalBottomSheet(
        context: context!,
        builder: (_) {
          return Container(
            color: App_Colors.THEME_COLOR_DARK_BLUE.withOpacity(1),
            child: SafeArea(
              child: Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: onCameraTap,
                    child: Container(
                      color: App_Colors.THEME_COLOR_TRANSPARENT,
                      margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.video_call,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: onGalleryTap,
                    child: Container(
                      color: App_Colors.THEME_COLOR_TRANSPARENT,
                      margin: EdgeInsets.only(top: 9.0, bottom: 15.0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.video_camera_back,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<String?> getCameraImage() async {
    try {
      getFilePath =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 70);

      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (e) {
      Get.snackbar(e.message.toString(), "Something went Wrong");
    }
    return null;
  }

  Future<String?> getVideoByCamera() async {
    try {
      getFilePath = await picker.pickVideo(
        source: ImageSource.camera,
      );
      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (e) {
      Get.snackbar(e.message.toString(), "Something went Wrong");
    }
    return null;
  }

  Future<String?> getVideoByGallery() async {
    try {
      getFilePath = await picker.pickVideo(
        source: ImageSource.gallery,
      );
      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (e) {
      Get.snackbar(e.message.toString(), "Something went Wrong");
    }
    return null;
  }

  Future<String?> getGalleryImage() async {
    try {
      getFilePath =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (e) {
      log(e.toString());
      // AppDialogs.showToast(
      //     message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
    }
    return null;
  }

  Future<File?> cropImage({String? imageFilePath}) async {
    imageFile = (await ImageCropper().cropImage(
      sourcePath: imageFilePath!,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      // androidUiSettings: AndroidUiSettings(
      //     toolbarTitle: "XXecpreneurs",
      //     toolbarColor: App_Colors.THEME_COLOR_DARK_BLUE.withOpacity(0.9),
      //     toolbarWidgetColor: App_Colors.THEME_COLOR_WHITE,
      //     initAspectRatio: CropAspectRatioPreset.original,
      //     lockAspectRatio: false),
      // iosUiSettings: IOSUiSettings(
      //   minimumAspectRatio: 1.0,
      // )
    )) as File?;
    return imageFile;
  }
}
