import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:zohatech/Const/Colors/App_Colors.dart';
import 'package:zohatech/Network/Auth/AuthController.dart';

class utiles{

  static void fieldfocuschange(BuildContext context , FocusNode current , FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static ToastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG
    );
  }

  static ToastMessageCenter(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.red,
      gravity: ToastGravity.CENTER,

    );
  }
  static ShowSnackBar(String title,String message,Color color){
    Get.snackbar(title, message,
        backgroundColor: color = App_Colors.THEME_COLOR_BLUE,colorText: App_Colors.THEME_COLOR_WHITE);
  }



  ///-------------------- Show Dialog -------------------- ///
  static void showDialogs({BuildContext? context, Widget? widget,
    EdgeInsets? insetPadding, bool barrierDismissible = true
    
    ,
    
    
    }) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context!,
      builder: (BuildContext buildContext) => Dialog(
        elevation: 0.0,
        insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 4.0),
        backgroundColor: Colors.transparent,
        child: widget,
      ),
    );
  }


  static void showProgressAlert(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: App_Colors.THEME_COLOR_WHITE,
              color: App_Colors.THEME_COLOR_blue,
            ),
          );
        });
  }


  static const googleApiKey = "AIzaSyBmaS0B0qwokES4a_CiFNVkVJGkimXkNsk";


  // static Future<Prediction?> addressPicker(BuildContext context) {
  //   return PlacesAutocomplete.show(
  //     offset: 0,
  //     logo: Text(""),
  //     types: [],
  //     strictbounds: false,
  //     context: context,
  //     apiKey: googleApiKey,
  //     mode: Mode.overlay,
  //     language: "en",
  //   );
  // }

  // static Future<Map<String, dynamic>> findStreetAreaMethod(
  //     {required BuildContext context,
  //       String? prediction,
  //       String? placeId}) async {
  //   Map<String, dynamic>? addressDetail = {
  //     "address": null,
  //     "city": null,
  //     "state": null,
  //     "latitude": null,
  //     "longitude": null
  //   };
  //   try {
  //     GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: googleApiKey);
  //     PlacesDetailsResponse detail =
  //     await _places.getDetailsByPlaceId(placeId!);
  //     List? addressInArray = prediction?.split(",");
  //     print("Address in array:${addressInArray}" +
  //         detail.result.geometry!.location.toString());
  //     String address = "";
  //     if (addressInArray != null) {
  //       if (addressInArray.length == 1) {
  //         addressDetail["address"] = addressInArray;
  //       } else {
  //         for (int i = 0; i < addressInArray.length - 2; i++) {
  //           address = address + addressInArray[i];
  //         }
  //         addressDetail["latitude"] = detail.result.geometry!.location.lat;
  //         addressDetail["longitude"] = detail.result.geometry!.location.lng;
  //         addressDetail["address"] = prediction;
  //         addressDetail["state"] =
  //         (addressInArray[addressInArray.length - 2] ?? "");
  //         addressDetail["city"] =
  //         (addressInArray[addressInArray.length - 3] ?? "");
  //         print(addressDetail.toString()+ "Addrus");
  //       }
  //     }
  //   } catch (e) {
  //     print("error:${e}");
  //   }
  //   return addressDetail;
  // }


  static String convertDateTimeDisplay2(String date , {String? pattren}) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSS');
    final DateFormat serverFormater = DateFormat(pattren??'HH:mm a');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  // static String getTime(DateTime storyTime) {
  //   final now = DateTime.now();
  //   int differenceHours = now.difference(storyTime).inHours;
  //   int differenceMinutes = now.difference(storyTime).inMinutes;
  //   // If the time is today
  //   if (differenceHours == 0 && differenceMinutes < 15) {
  //     return 'Just Now';
  //   }
  //   if (differenceHours < 0 && differenceMinutes > 15) {
  //     return '$differenceMinutes minutes ago';
  //   }
  //   if (differenceHours > 0 && differenceHours < 24) {
  //     return '${differenceHours}h ago';
  //   }
  //   // If the time is yesterday
  //   else if (differenceHours >= 24 && differenceHours <= 48) {
  //     return 'Yesterday';
  //   }
  //   // If the time is this week
  //   else if (differenceHours <= 7 * 24) {
  //     return DateFormat('EEE').format(storyTime);
  //   }
  //   // If the time is older than a week
  //   else {
  //     return DateFormat('MMM d').format(storyTime);
  //   }
  // }


  static String convertDateToTime(String newDate, BuildContext context) {
    DateTime date = DateTime.parse(newDate);
    return TimeOfDay.fromDateTime(date).format(context);
  }

  //
  // static Future<String?> makePayment(BuildContext context,
  //     {String? cardNumber,
  //       String? cardNumberCvv,
  //       String? paymentCardExpMonth,
  //       String? paymentCardExpYear}) async {
  //   try {
  //     await Stripe.instance.dangerouslyUpdateCardDetails(CardDetails(
  //         number: cardNumber,
  //         cvc: cardNumberCvv,
  //         expirationMonth: int.parse(paymentCardExpMonth!),
  //         expirationYear: int.parse(paymentCardExpYear!)));
  //     final token = await Stripe.instance
  //         .createToken(const CreateTokenParams.card(params: CardTokenParams()));
  //     print("card token:: ${token.id}");
  //     CoreController.i.CardID = token.id;
  //
  //     if (token.id.isNotEmpty) {
  //
  //       await CoreController.i.AddCard(cardId: CoreController.i.CardID);
  //       return token.id;
  //     }
  //   } on StripeException catch (e) {
  //
  //
  //     ShowSnackBar("Error Accur","${e.error.localizedMessage!}",Colors.white);
  //     // AppNavigation.showSnackBar(
  //     //     context: context, content: e.error.localizedMessage!);
  //     log(e.error.localizedMessage!);
  //     return null;
  //   }
  // }


  static String utcTo12HourFormat(String bigTime) {
    DateTime tempDate = DateFormat("HH:mm").parse(bigTime);
    var dateFormat = DateFormat("hh:mm a"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));
    print("------------$createdDate");
    return createdDate;
  }

  static Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = new Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
    AuthController.i.profileFileImage = file;
    print("aqi   ${file.path}");

// temporary directory and image bytes from response is written to // that file.
    return file;
  }

}

