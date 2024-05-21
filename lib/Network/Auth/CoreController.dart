import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zohatech/Screens/Home/Model/TodoModel.dart';
import 'package:zohatech/Screens/Home/Repo/Repo.dart';

class CoreController extends GetxController {
  static CoreController i = Get.put(CoreController());

  // void searchCourses(String key) {
  //   if (key.trim().isNotEmpty) {
  //     myCourses.value.data = myCourses.value.data!
  //         .where((element) =>
  //             element!.title!.toLowerCase().contains(key.toLowerCase()))
  //         .toList();
  //   } else {
  //     myCourses.value.data = _myCourses.data;
  //   }
  //   myCourses.update((val) {});
  // }
  Rx<TodoModel> todoModel = TodoModel().obs;


  Todo({BuildContext? context}) {
    TodoRepo().TodoRepoMethode(context: context);
  }
}
