import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zohatech/Screens/Auth/Model/LoginModel.dart';
import 'package:zohatech/Screens/Auth/Repo/authRepo.dart';

class AuthController extends GetxController {
  static AuthController i = Get.put(AuthController());
  File? profileTempFileImage,
      profileFileImage,
      taskFileImage,
      CourseTempImage,
      CourseImage,
      ProfileModuleImage;
  String? profileImagePath,
      profileNetworkPath,
      CourseImagePath,
      moduleImagePath;


  RxBool check = false.obs;
  RxBool checkbox1 = false.obs;

  RxString selectRole = ''.obs;

  String? temp;
  RxString verificationId = "".obs;

  RxString eventname = "".obs;

  RxBool not = false.obs;
  RxBool inactive = false.obs;

  String? merchentID;

  RxString nextNamaz = "".obs;

  List<String> iqahmalist = [];
  RxList azanlist = [].obs;

  Rx<DateTime> datetime = DateTime.now().obs;

  Rx<LoginModel> loginModel = LoginModel().obs;
  // Rx<OtpModel> otpModel = OtpModel().obs;
  // Rx<CreateMerchentModel> createMerchentModel = CreateMerchentModel().obs;
  //


  // Rx<GetAzanTimingModel> azanTiming = GetAzanTimingModel().obs;
  //
  Login({String? username, String? password, BuildContext? context}) {
    LoginRepo().LoginRepoMethod(username: username,password: password,context: context);
  }


}
