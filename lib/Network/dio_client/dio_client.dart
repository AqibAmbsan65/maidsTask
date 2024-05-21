import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as gets;
import 'package:zohatech/Const/Utiles/Utiles.dart';
import '../../Const/Strings/App_Strings.dart';
import '../User_perference/User_Preference_View_Model.dart';
import '../api_endpoints.dart';
import '../connectivity_manager.dart';
import '../listner.dart';
import 'dio_interceptor.dart';

class DioClient {
  // DioClient({this.loading=false});
  // bool? loading;

  static Dio? _dio;
  static DioClient? _dioClient;

  static ConnectivityManager? _connectivityManager;

  static CancelToken? _cancelToken;

  DioClient._createInstance();

  factory DioClient() {
    // factory with constructor, return some value
    if (_dioClient == null) {
      _dioClient = DioClient
          ._createInstance(); // This is executed only once, singleton object

      _getDio();

      _connectivityManager = ConnectivityManager();

      _cancelToken ??= CancelToken();
    }
    return _dioClient!;
  }

  static void _getDio() {
    _dio ??= Dio();

    _dio?.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      error: true,
    ));

    _dio?.interceptors.add(DioInterceptors());
  }

  ///-------------------- Get Request -------------------- ///

  Future<Response?> getRequest({
    String? endPoint,
    String? baseurl,
    Map<String, dynamic>? queryParameters,
    ResponseListener? responseListener,
    bool? isHeaderRequire,
  }) async {
    Response? response;

    if (await _connectivityManager!.isInternetConnected()) {
      EasyLoading.instance.userInteractions = false;
      EasyLoading.show(status: 'Please wait...', dismissOnTap: true);

      try {
        response = await _dio!.get(baseurl ?? APIEndpoints.baseURL  + endPoint!,
            queryParameters: queryParameters,
            cancelToken: _cancelToken,
            options: Options(
              headers: _setHeader(isHeaderRequire: isHeaderRequire),
              sendTimeout: Duration(microseconds: 20000),
            ));

        // log("GET REQUEST API: $response" );
      } on DioError catch (e) {
        _onTimeOut(message: e.message, responseListener: responseListener);
        print("$endPoint TimeOut: " + e.message.toString());
        print("$endPoint RESPONSEsssssss: " + e.response.toString());
        EasyLoading.dismiss();

      }
    }
    else {
      _noInternetConnection(responseListener: responseListener);
    }
    EasyLoading.dismiss();
    return response;
  }

  ///-------------------- Post Request -------------------- ///
  Future<Response?> postRequest({
    String endPoint="",
    String? baseurl,
    dynamic data,
    ResponseListener? responseListener,
    bool? isHeaderRequire,
  }) async {
    Response? response;
    if (await _connectivityManager!.isInternetConnected()) {
      EasyLoading.instance.userInteractions = false;
      EasyLoading.show(status: 'Please wait...', dismissOnTap: true);
      try {
        response = await _dio!.post(baseurl ?? APIEndpoints.baseURL  + endPoint,
            data: data,
            cancelToken: _cancelToken,
            options: Options(
                headers: _setHeader(isHeaderRequire: isHeaderRequire),
               sendTimeout: Duration(milliseconds: 50000),
               receiveTimeout: Duration(milliseconds: 50000)

            ));

      } on DioException catch (e) {
        print("kbdhwhdbwkd  wkhdkw  dwkhbw");
        print(e);
        _onTimeOut(message: e.message, responseListener: responseListener);
        EasyLoading.dismiss();

      }
    } else {
      _noInternetConnection(responseListener: responseListener);
    }
    EasyLoading.dismiss();
    return response;
  }

  ///-------------------- Delete Request -------------------- ///
  Future<Response?> deleteRequest({
    String? endPoint,
    Map<String, dynamic>? queryParameters,
    ResponseListener? responseListener,
    bool? isHeaderRequire,
  }) async {
    Response? response;
    if (await _connectivityManager!.isInternetConnected()) {
      EasyLoading.instance.userInteractions = false;
      EasyLoading.show(status: 'Please wait...', dismissOnTap: true);

      try {
        response = await _dio!.delete(APIEndpoints.baseURL + endPoint!,
            queryParameters: queryParameters,
            cancelToken: _cancelToken,
            options: Options(
              headers: _setHeader(isHeaderRequire: isHeaderRequire),
              sendTimeout: Duration(microseconds: 20000),
            ));
      } on TimeoutException catch (e) {
        _onTimeOut(message: e.message, responseListener: responseListener);
        print("$endPoint TimeOut: " + e.message!);
        EasyLoading.dismiss();

      }
    } else {
      _noInternetConnection(responseListener: responseListener);
    }
    EasyLoading.dismiss();

    return response;
  }

  ///-------------------- Set Header -------------------- ///
  _setHeader({bool? isHeaderRequire}) {
    if (isHeaderRequire == true) {
      String? token = SharedPreference().getBearerToken();
      return {
        'Accept': AppStrings.ACCEPT,
        'Authorization': "Bearer $token",
      };
    } else {
      return {
        'Accept': AppStrings.ACCEPT,
      };
    }
  }

  ///-------------------- Validate Response -------------------- ///
  Future<void> validateResponse({
    Response? response,
    ResponseListener? responseListener,
    bool message = false,
  }) async {
    if (response != null) {
      var jsonResponse = response.data;

      if (jsonResponse != null) {

        print("sa"+response.statusCode.toString());
        print("sa1"+jsonResponse['status'].toString());


        if (response.statusCode == APIEndpoints.SUCCESS_CODE) {

          if (jsonResponse['status'] == APIEndpoints.API_SUCCESS_STATUS) {
            print("abc"+ jsonResponse['status'].toString());
            // When Status Code is 200 and api_status is 1
            if (responseListener != null) {
              responseListener.onSuccess(response: jsonResponse);
            }
          }
          else if (jsonResponse['status'] == null) {
            if (responseListener != null) {
              responseListener.onSuccess(response: jsonResponse);
            }
          } else {
            // When Status Code is 200 and api_status is 0
            if (responseListener != null) {
              responseListener.onSuccess(response: jsonResponse);
            }
          }
        }
        else if (response.statusCode == APIEndpoints.NOT_FOUND_CODE) {
          if (jsonResponse['status'] == APIEndpoints.API_SUCCESS_STATUS) {
            // When Status Code is 200 and api_status is 1
            if (responseListener != null) {

              responseListener.onFailure(response: jsonResponse);
            }
          } else if (jsonResponse['status'] == null) {
            if (responseListener != null) {
              responseListener.onFailure(response: jsonResponse);
            }
          } else {
            // When Status Code is 200 and api_status is 0
            if (responseListener != null) {
              responseListener.onFailure(response: jsonResponse);
            }
          }
         }
        else if (response.statusCode == APIEndpoints.NOT_FOUND_CODE) {
          if (jsonResponse['status'] == APIEndpoints.API_FAILURE_STATUS) {

            print("Aqib text");
            // When Status Code is 200 and api_status is 1
            if (responseListener != null) {

              responseListener.onFailure(response: jsonResponse);
            }
          }
        }
        else {
          // When Status Code is not 200
          if (responseListener != null) {
            responseListener.onFailure(response: jsonResponse);
          }
          log(response.statusCode.toString());
        }
      }
    }
  }

  ///-------------------- No Internet Connection -------------------- ///
  void _noInternetConnection({ResponseListener? responseListener}) {
    // Call Failure Listener
    if (responseListener != null) {
      responseListener.onFailure(response: {});
      EasyLoading.instance.userInteractions = false;
      EasyLoading.dismiss();

    }

    // Display Error Message
    utiles.ToastMessage(APIEndpoints.NO_INTERNET_CONNECTION);
  }

  ///-------------------- On TimeOut -------------------- ///
  void _onTimeOut({String? message, ResponseListener? responseListener}) {
    // Call Failure Listener
    if (responseListener != null) {
      responseListener.onFailure(response: {});

      EasyLoading.instance.userInteractions = false;
      EasyLoading.dismiss();
    }
    // Display Error Message
    utiles.ToastMessage(message.toString());
  }
}
