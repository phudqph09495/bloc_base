import 'package:bloc_base/screen/Cart/xacNhanScreen.dart';
import 'package:bloc_base/screen/auth/login_screen.dart';
import 'package:bloc_base/screen/home/notifi_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../screen/home/home_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
    switch (settings.name) {
      case RouterName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
    switch (settings.name) {
      case RouterName.xacNhanScreen:
        return MaterialPageRoute(builder: (context) => const XacNhanScreen());
    }
    switch (settings.name) {
      case RouterName.simpleBarcodeScannerPage:
        return MaterialPageRoute(
            builder: (context) => const SimpleBarcodeScannerPage());
    }
    switch (settings.name) {
      case RouterName.notifyScreen:
        return MaterialPageRoute(builder: (context) => const NotifyScreen());
    }
    switch (settings.name) {
      case RouterName.notifyScreen:
        return MaterialPageRoute(builder: (context) => const NotifyScreen());
    }
    return null;
  }
}

class RouterName {
  static const homeScreen = "/homeScreen";
  static const loginScreen = "/loginScreen";
  static const xacNhanScreen = "/xacNhanScreen";
  static const simpleBarcodeScannerPage = "/simpleBarcodeScannerPage";
  static const notifyScreen = "/notifyScreen";
  static const infoSpaScreen = "/infoSpaScreen";
}
