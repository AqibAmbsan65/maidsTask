import 'package:shared_preferences/shared_preferences.dart';
import 'package:zohatech/Screens/Auth/Model/LoginModel.dart';
import 'dart:convert' as convert;
import '../../Const/Strings/App_Strings.dart';


class SharedPreference {
  static SharedPreference? _sharedPreferenceHelper;
  static SharedPreferences? _sharedPreferences;


  SharedPreference._createInstance();

  factory SharedPreference() {
    // factory with constructor, return some value
    if (_sharedPreferenceHelper == null) {
      _sharedPreferenceHelper = SharedPreference
          ._createInstance(); // This is executed only once, singleton object
    }
    return _sharedPreferenceHelper!;
  }

  Future<SharedPreferences> get sharedPreference async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _sharedPreferences!;
  }

  ///-------------------- Clear Preference -------------------- ///
  void clear() {
    _sharedPreferences?.clear();
  }

  ///-------------------- Bearer Token -------------------- ///
  String? getBearerToken() {
    return _sharedPreferences?.getString(AppStrings.BEARER_TOKEN);
  }

  void setBearerToken({String? token}) {
    print("aasdadasda" + token.toString());
    _sharedPreferences?.setString(AppStrings.BEARER_TOKEN, token ?? '');
  }

  ///-------------------- User ID Token -------------------- ///


  String? getIDToken() {
    return _sharedPreferences?.getString(AppStrings.ID);
  }

  void setIDToken({String? token}) {
    print("User ID ssdsds" + token.toString());
    _sharedPreferences?.setString(AppStrings.ID, token ?? '');
  }


  ///-------------------- User -------------------- ///
  void setUser({String? user}) {
    print("usersaveby aqib" + user.toString());
    _sharedPreferences?.setString(AppStrings.USER, user ?? '');
  }
  //
  LoginModel? getUser() {
    if (_sharedPreferences?.getString(AppStrings.USER) == null) {
      return null;
    } else {
      var jsonResponse = convert
          .jsonDecode((_sharedPreferences!.getString(AppStrings.USER) ?? ''));
      var user = LoginModel.fromJson(jsonResponse);
      return user;
    }
  }

}
