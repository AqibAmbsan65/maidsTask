import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getP;
import 'package:zohatech/Const/Utiles/Utiles.dart';
import '../../Const/Strings/App_Strings.dart';
import '../User_perference/User_Preference_View_Model.dart';
import '../api_endpoints.dart';



class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path != (APIEndpoints.baseURL + AppStrings.SAVE_MESSAGE))
      // utiles.showDialogs(
      //   barrierDismissible: false,
      //   widget: Center(
      //     child: CircularProgressIndicator(color: App_Colors.primaryColor),
      //   ),
      // );
      return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.path !=
        (APIEndpoints.baseURL + AppStrings.SAVE_MESSAGE))
      return super.onResponse(response, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    if (dioError.requestOptions.path !=
        (APIEndpoints.baseURL + AppStrings.SAVE_MESSAGE));

    Response? response = dioError.response;

    String? errorMessage = _getErrorMessage(response: response);

    utiles.ToastMessage(errorMessage ?? dioError.message.toString());

    // when status code= 401

    if (dioError.response?.statusCode == AppStrings.UNAUTHORIZED_USER_CODE) {
      _invalidAuthorization();
    }
    if (dioError.response?.statusCode == APIEndpoints.NOT_FOUND_CODE) {


      print("aqib error");

      // CoreController.i.slotsModel.refresh();

      EasyLoading.instance.userInteractions = false;
      EasyLoading.dismiss();
      // _invalidAuthorization();
    }
    if (dioError.response?.statusCode == APIEndpoints.SERVER_NOT_FOUND_CODE) {
      // _invalidAuthorization();
      EasyLoading.instance.userInteractions = false;
      EasyLoading.dismiss();
    }
    return null;
  }

  void _invalidAuthorization() {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.dismiss();

    SharedPreference().clear();
    // getP.Get.offAllNamed(Named_route.Pre_Login_Screen);
  }

  String? _getErrorMessage({Response? response}) {
    String? errorMessage;


    if (response?.data is Map<String, dynamic>) {
      // Checking that API is returning JSON Object instead of crashing HTML
      if (response?.data != null) {
        if (response?.data.containsKey("error")) {
          errorMessage = response?.data["error"];
          EasyLoading.instance.userInteractions = false;

        }
      } else {
        errorMessage = response?.statusMessage;
        EasyLoading.instance.userInteractions = false;

      }
    }
    return errorMessage;
  }
}
