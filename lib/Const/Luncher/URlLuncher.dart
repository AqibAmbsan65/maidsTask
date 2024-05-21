// import 'package:flutter/foundation.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class UrlLauncher {
//   static Future<void> launchInWebViewOrVC(String url) async {
//     Uri parsedUrl = Uri.parse(url);
//     try {
//       if (!await launchUrl(
//         parsedUrl,
//         mode: LaunchMode.externalApplication,
//         // webViewConfiguration: const WebViewConfiguration(
//         //     headers: <String, String>{'my_header_key': 'my_header_value'}),
//       )) {
//         throw 'Could not launch $url';
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }