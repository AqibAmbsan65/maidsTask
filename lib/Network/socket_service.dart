// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:ecpreneurs/Network/Auth/CoreController.dart';
// import 'package:ecpreneurs/Screens/Users/Mesaage_Screen/Model/ChatModel.dart';
// import 'package:ecpreneurs/Screens/Users/Popular_Coaches/Model/ChatListModel.dart';
// import 'package:socket_io_client/socket_io_client.dart';
//
// import '../Const/Strings/App_Strings.dart';
//
//
//
// class SocketService {
//   static Socket? _socket;
//
//   SocketService._();
//
//   static SocketService? _instance;
//
//   static SocketService? get instance {
//     if (_instance == null) {
//       _instance = SocketService._();
//     }
//     return _instance;
//   }
//
//
//   // 17:00:01
//   // send_message
//   // {
//   // "sender_id": 5,
//   // "reciever_id": "26",
//   // "message": "JKbdwbhdbhjbdhjwbd",
//   // "chat_type": "text"
//   // }
//   //
//   // 16:58:32
//   // socketio-client
//   // {
//   // "sender_id": 5,
//   // "reciever_id": "26"
//   // }
//
//   Socket? get socket => _socket;
//
//   void initializeSocket() {
//     _socket = io(AppStrings.SOCKET_CONNECTION, <String, dynamic>{
//       'autoConnect': false,
//       'transports': ['websocket'],
//     });
//   }
//
//   void connectSocket(context) {
//     // _socket = io(NetworkStrings.SOCKET_API_BASE_URL, <String, dynamic>{
//     //   'autoConnect': false,
//     //   'transports': ['websocket'],
//     // });
//
//     _socket?.connect();
//
//     _socket?.on("connect", (data) {
//       log('Connected socket ');
//       // socketResponseMethod(context);
//       // checkSocketConnection(true);
//     });
//
//     _socket?.on("disconnect", (data) {
//       log('Disconnected ' + data.toString());
//     });
//
//     _socket?.on("connect_error", (data) {
//       log('Connect Error ' + data.toString());
//     });
//
//     _socket?.on("error", (data) {
//       log('Error ' + data.toString());
//       // SocketNavigationClass.instance
//       //     ?.socketErrorMethod(errorResponseData: data);
//     });
//
//     //log("Socket Connect:${socket?.connected}");
//   }
//
//   void socketEmitMethod(
//       {required String eventName, required dynamic eventParamaters}) {
//     _socket?.emit(
//       eventName,
//       eventParamaters,
//     );
//   }
//
//   void socketSendEmitMethod(
//       {required String eventName, required dynamic eventParamaters}) {
//     _socket?.emit(
//       eventName,
//       eventParamaters,
//     );
//   }
//
//
//   // SingleChatProvider? singleChatProvider;
//   void socketResponseMethod(context) {
//     _socket?.on("response", (data) {
//       log("socket!.on function chal rha hai");
//
//       if (data["object_type"] == "get_messages") {
//         log("get_messages");
//
//         log(data.toString());
//
//         ChatModel model = ChatModel.fromJson(data);
//         CoreController.i.mainModel.value = model;
//
//         // singleChatProvider = Provider.of<SingleChatProvider>(context, listen: false);
//         // singleChatProvider!.setSingleChatModel(singleChatData: data);
//       }
//       else if (data["object_type"] == "get_message") {
//         log("GET MESSAGE");
//         print(data.toString());
//
//         appendSingleChat(singleData: data["data"]);
//         // singleChatProvider!.appendSingleChat(singleData: data["data"]);
//       }else if(data["object_type"] == "join_room"){
//         log("Join Room");
//         print(data.toString());
//
//       }else if(data["object_type"] == "chat_list"){
//         log("chat list");
//         print(data.toString());
//
//         ChatListModel model = ChatListModel.fromJson(data);
//         CoreController.i.chatListModel.value = model;
//
//       }
//
//     });
//
//     //log("response data ha:$data");
//     // SocketNavigationClass.instance?.socketResponseMethod(responseData: data);
//   }
//
//   void appendSingleChat({dynamic singleData})
//   {
//
//     if(singleData != null)
//     {
//       log("singleData.toString()");
//       log(singleData.toString());
//
//       SingleChatData? _getOneToOneData = SingleChatData.fromJson(singleData);
//       CoreController.i.mainModel.value.data?.add(_getOneToOneData);
//       CoreController.i.mainModel.refresh();
//     }
//
//   }
//
//   void dispose() {
//     _socket?.dispose();
//   }
// }
