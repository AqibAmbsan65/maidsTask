// import 'dart:developer';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// // import 'package:agora_rtc_engine/rtc_engine.dart';
//
// class CallService {
//   RtcEngine? _rtcEngine;
//
//   CallService._();
//
//   static CallService? _instance;
//   static CallService? get instance {
//     if (_instance == null) {
//       _instance = CallService._();
//     }
//     return _instance;
//   }
//
//   RtcEngine? get rtcEngine => _rtcEngine;
//
//   // void initializeRtcEngine() async{
//   //   await _initAgoraRtcEngine();
//   //   _addAgoraEventHandlers();
//   //   await _joinChannel();
//   // }
//
//   Future<void> initializeRtcEngine({required String? callType}) async {
//     _rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(Constants.appID));
//     if (callType == CallType.video.name) {
//       await _rtcEngine?.enableVideo();
//       log("VIDEO CALL INITIALIZE");
//     } else {
//       await _rtcEngine?.enableAudio();
//     }
//
//     await _rtcEngine?.startPreview();
//     await _rtcEngine?.setChannelProfile(ChannelProfile.Communication);
//     // bool? speakerEnabled = await _rtcEngine?.isSpeakerphoneEnabled();
//     // print("Speaker Enabled:${speakerEnabled}");
//     //  await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
//     // await _engine.setClientRole(ClientRole.Broadcaster);
//   }
//
//   void addAgoraEventHandlers(
//       {required Function(String, int, int) joinChannelSuccess,
//       required Function(int, int) userJoinedStatus,
//       required Function(int, UserOfflineReason) userOfflineStatus,
//       required Function(RtcStats) leaveChannelStatus}) {
//     _rtcEngine?.setEventHandler(
//       RtcEngineEventHandler(
//         firstRemoteAudioFrame: (uid, elapsed) {
//           log("firstRemoteAudioFrame: $uid");
//         },
//         firstRemoteVideoFrame: (uid, width, height, elapsed) {
//           log("firstRemoteVideoFrame: $uid");
//         },
//         remoteVideoStats: (stats) {
//           log("remoteVideoStats: ${stats}");
//         },
//         warning: (warningCode) {
//           log("warningCode: $warningCode");
//         },
//         error: (errorCode) {
//           print("Agora error is: $errorCode");
//         },
//         joinChannelSuccess: joinChannelSuccess,
//         userInfoUpdated: (uid, info) {
//           log("userInfoUpdated: $uid ${info.toJson()}");
//         },
//         userJoined: userJoinedStatus,
//         userOffline: userOfflineStatus,
//         leaveChannel: leaveChannelStatus,
//       ),
//     );
//   }
//
//   Future<void> joinChannel({required String token, required String channelName, required String userId}) async {
//     log("Token Inside Join Channel Method");
//     log(token);
//     //_rtcEngine?.joinChannel(token, channelName, null, int.parse(userId));
//     _rtcEngine?.joinChannelWithUserAccount(token, channelName, userId);
//   }
//
//   void onToggleMute({required bool muted}) {
//     _rtcEngine?.muteLocalAudioStream(muted);
//     //_engine.muteLocalAudioStream(muted);
//   }
//
//   void onSwitchCamera() {
//     _rtcEngine?.switchCamera();
//   }
//
//   void onToggleSpeaker({required bool speaker}) {
//     _rtcEngine?.setEnableSpeakerphone(speaker);
//   }
//
//   void dispose() {
//     _rtcEngine?.leaveChannel();
//     _rtcEngine?.destroy();
//   }
// }
