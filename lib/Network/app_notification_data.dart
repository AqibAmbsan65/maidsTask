import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';

import '../Const/Colors/App_Colors.dart';
import '../Const/Strings/App_Strings.dart';

class AppNotificationData {

  //
  // final bottomBarController = Get.put(BottomBarController());
  // final bottomBarControllerEmployee = Get.put(BottomBarControllerEmployee());


  void foregroundNotificationData(
      {BuildContext? context, required Map<String, dynamic> notificationData}) {
    print("App Notification Foreground data is:${notificationData.toString()}");
    log("Notification Type:${notificationData["notification_type"].toString()}");
    // Map<String,dynamic> notificationObject= jsonDecode(notificationData["notification"]);
    // log("Notification Object:${notificationData["notification_type"]}");
    // log("Notification Vote:${notificationData["notification_route"]}");
    //Agar notification ma service receive aya to service receive api hit hogi
    if (notificationData["notification_type"] ==
        "approvedAndDisapproved") {
     // AppNavigation.navigateTo(context, MemeFeed());

      getx.Get.snackbar("Alert", "${notificationData['sender_name']} Accepted your Job",
          backgroundColor: App_Colors.primaryColor,
          colorText: App_Colors.THEME_COLOR_WHITE,onTap: (index){

            // bottomBarControllerEmployee.updateTabSelection(1, "Jobs");
          });

    } else if (notificationData["notification_type"] ==
        "applied") {
      getx.Get.snackbar("Alert", "${notificationData['sender_name']} applied on your job",
          backgroundColor: App_Colors.primaryColor,
          colorText: App_Colors.THEME_COLOR_WHITE,onTap: (index){
            // bottomBarController.updateTabSelection(2, "Applicants");
          });
    }else if (notificationData["notification_type"] ==
        "completed") {
      getx.Get.snackbar("Alert", "${notificationData['sender_name']} completed your job",
          backgroundColor: App_Colors.primaryColor,
          colorText: App_Colors.THEME_COLOR_WHITE,onTap: (index){
            // bottomBarController.updateTabSelection(2, "Applicants");
          });
    } else if (notificationData["notification_type"] == "began") {
      getx.Get.snackbar("Alert", "${notificationData['sender_name']} began your job",
          backgroundColor: App_Colors.primaryColor,
          colorText: App_Colors.THEME_COLOR_WHITE,onTap: (index){
            // bottomBarController.updateTabSelection(2, "Applicants");
          });
    }else if (notificationData["notification_type"] == "chatNotification") {
      getx.Get.snackbar("Alert", "${notificationData['sender_name']} send you a message",
          backgroundColor: App_Colors.primaryColor,
          colorText:  App_Colors.THEME_COLOR_WHITE,
          onTap: (index){
            // bottomBarController.updateTabSelection(2, "Applicants");
          });
    }

  }

  waitAndNavigate(channelName, token, image,receiverId,title) async {
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      // getx.Get.snackbar("Alert", "Someone is Calling",
      //   backgroundColor:AppColors.PurpleColor,
      //   colorText:AppColors.WhiteColor,
      // );
      // getx.Get.to(
        // AudioCallingPage(
        //   channelId: channelName,
        //   token: token,
        //   broadcaster: true,
        //   userID: getx.Get.find<SplashScreenController>().storage.read(AppStrings.CURRENT_USER_DATA_ID).toString(),
        // receiverId: receiverId,
        //   userImage: image,
        //   fromWhere: "notification",
        //   title: title,
        // ),
      // );
    });
  }

  // void postAgoraResponse(senderId,receiverId) async {
  //   try {
  //     Response response = await Dio()
  //         .post('http://server.appsstaging.com:3007/rtctoken', data: {
  //       "reciever_id": receiverId,
  //       "sender_id": senderId,
  //       "name": "",
  //       "type": "voice"
  //     });
  //
  //     log("Agora Response: $response");
  //     log("Channel ID: " + response.data['call_channel']);
  //     log("Token: " + response.data['token']);
  //     waitAndNavigate(response.data['call_channel'], response.data['token'],senderId);
  //   } catch (e) {
  //     print("Error On CALLING: $e");
  //   }
  // }
  //
  // waitAndNavigate(channelName, channelToken,userid) async {
  //   await Future.delayed(const Duration(seconds: 5)).then((value) {
  //     getx.Get.to(AudioCallingPage(channelName, channelToken, true, userid));
  //   });
  // }

  //This data has been called when notification comes and app is in background
  void backgroundNotificationData(
      {BuildContext? context,
      required Map<String, dynamic> notificationData}) async {
    log("App Notification Background data is:${notificationData.toString()}");
    log('App Notification Sent Time:${notificationData["notification_type"]}');

    //Agar notification ma service receive aya to service receive api hit hogi
    if (notificationData["notification_type"] == "voice") {
      // Get.snackbar("Alert", "Someone is Calling",
      // backgroundColor: AppColors.PRIMARY_COLOR2_BLUE,
      // colorText: AppColors.WHITE_COLOR);
      // Get.to(ChatScreen());

      log("pay load a rha hai");
    } else if (notificationData["notification_type"] == "GROUP_INVITATION") {
      // CustomToastPop().
      // showToast("Alert","Someone is Adding in a group",
      //     true);

      // Get.to(ChatScreen());
    }
    // if (notificationData["type"] == NetworkStrings.NOTIFICATION_CHAT) {
    //   // DateTime currentNotificationTapDate = await NTP.now();
    //   //print('NTP DateTime Now: ${currentNotificationTapDate}');
    //   // DateTime notificationSentDate = DateTime.parse(notificationData["sentTime"].toString());
    //
    //   DateTime notificationSentDate = DateTime.fromMillisecondsSinceEpoch(
    //       int.parse(notificationData["sentTime"]) * 1000);
    //
    //   // int notificationSeconds = currentNotificationTapDate.difference(notificationSentDate).inSeconds;
    //   // if (notificationSeconds < 120) {
    //   // Get.to(ChatScreen());
    //   // serviceReceiveBloc.ServiceReceiveBlocMethod(
    //   //     context: context,
    //   //     requestId: notificationData["request_id"],
    //   //     popUpTime: 120 - notificationSeconds,
    //   //     setProgressBar: () {
    //   //       AppDialogs.progressAlertDialog(context: context);
    //   //     }
    //   // );
    //   // }
    //
    // } else {
    //   log("This service has been expired");
    //   // AppDialogs.showToast(message: "This service has been expired");
    // }
  }

  //This data has been called when notifiation comes and app is closed or terminated
  void terminateNotificationData(
      {BuildContext? context,
      required Map<String, dynamic> notificationData}) async {
    log("App Notification terminate Background data is:${notificationData.toString()}");
    log("App Notification Sent Time:${notificationData["sentTime"]}");

    //Agar notification ma service receive aya to service receive api hit hogi
    if (notificationData["type"] == AppStrings.NOTIFICATION_TEXT) {
      // DateTime currentNotificationTapDate = await NTP.now();
      //print('NTP DateTime Now: ${currentNotificationTapDate}');
      //DateTime notificationSentDate = DateTime.parse(notificationSentTime);
      DateTime notificationSentDate = DateTime.fromMillisecondsSinceEpoch(
          int.parse(notificationData["sentTime"]) * 1000);
      // print('Notification Sent Date: ${notificationSentDate}');
      // Get.to(ChatScreen());
      // int notificationSeconds = currentNotificationTapDate
      //     .difference(notificationSentDate)
      //     .inSeconds;
      //
      // // print("Notification seconds difference:${notificationSeconds}");

      // if (notificationSeconds < 120) {

      // serviceReceiveBloc.ServiceReceiveBlocMethod(
      //     context: context,
      //     requestId: notificationData["request_id"],
      //     popUpTime: 120 - notificationSeconds,
      //     setProgressBar: () {
      //       AppDialogs.progressAlertDialog(context: context);
      //     }
      // );
      // }

    } else {
      log("This service has been expired");
      // AppDialogs.showToast(message: "This service has been expired");
    }
  }
}
