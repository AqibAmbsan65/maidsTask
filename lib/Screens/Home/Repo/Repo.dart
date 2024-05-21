import 'package:flutter/material.dart';
import 'package:zohatech/Network/Auth/CoreController.dart';
import 'package:zohatech/Network/api_endpoints.dart';
import 'package:zohatech/Screens/Home/Model/TodoModel.dart';
import '../../../Network/dio_client/dio_client.dart';
import '../../../Network/listner.dart';
class TodoRepo extends ResponseListener{


  BuildContext? mainContext;


  void TodoRepoMethode({BuildContext? context,int pagelimit = 10}) async{


    mainContext = context;

    var response = await DioClient().getRequest(
      endPoint: APIEndpoints.todos,
      isHeaderRequire: false,
      responseListener: this,
    );

    DioClient().validateResponse(response: response,responseListener: this,message: false);

  }

  @override
  void onSuccess({response}) async {
    // TODO: implement onSuccess
    print(response);

    TodoModel model = TodoModel.fromJson(response);
    CoreController.i.todoModel.value = model;




  }

  @override
  void onFailure({response}) {
    // TODO: implement onFailure
    print(response);

  }
}



