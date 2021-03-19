import 'package:flutter/material.dart';
import 'package:jiclapp/app_screens/Dashboard.dart';
import 'package:jiclapp/app_screens/HomeScreen.dart';
import 'package:jiclapp/app_screens/JICLSetting.dart';
import 'package:jiclapp/app_screens/LaunchScreen.dart';
import 'package:jiclapp/app_screens/LoginScreen.dart';
import 'package:jiclapp/app_screens/ChangePasswordScreen.dart';
import 'package:jiclapp/app_screens/WebView.dart';
import 'package:jiclapp/app_util/Constant.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newBusinessRoute:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(BusinessIDS.kNewBusinessID));
      case homeRoute:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case launchRoute:
        return MaterialPageRoute(builder: (_) => LaunchScreen());
      case logoutRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case jiclSeeting:
        return MaterialPageRoute(builder: (_) => JICLSetting());
      case changePassword:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case adminRoute:
        return MaterialPageRoute(builder: (_) => JICLWebView());
      case paymentRoute:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(BusinessIDS.kPaymentID));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
