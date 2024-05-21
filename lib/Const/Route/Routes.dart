import 'package:get/get.dart';
import 'package:zohatech/Const/Route/Named_route.dart';
import 'package:zohatech/Screens/Auth/View/Login_Screen.dart';
import 'package:zohatech/Screens/Home/Screen/Home.dart';
import 'package:zohatech/Screens/Splash/Screen/Splash_Screen.dart';

class Routes {
  static AppRoutes() => [
        GetPage(name: Named_route.Splash_Screen, page: () => Splash_Screen()),
        GetPage(name: Named_route.Login_Screen, page: () => Login_Screen()),
        GetPage(name: Named_route.Home_Screen, page: () => MyHome()),
      ];
}
