import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zohatech/Const/Route/Routes.dart';
import 'package:zohatech/Screens/Splash/Screen/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        child = ResponsiveBreakpoints.builder(
          child: child,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
        return child;
      },
      // builder: (context, child) => ResponsiveWrapper.builder(
      //     child,
      //     maxWidth: 2400,
      //     minWidth: 480,
      //     defaultScale: true,
      //     breakpoints: [
      //       ResponsiveBreakpoint.resize(480, name: MOBILE),
      //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //       ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //       ResponsiveBreakpoint.autoScale(2400, name: "4K"),
      //
      //     ],
      //     background: Container(color: Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      title: "Todo List",
      getPages: Routes.AppRoutes(),
      // home: DemoScreen(),
      home: Splash_Screen(),
    );

    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Login_Screen(),
    // );
  }
}
