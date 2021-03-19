import 'package:flutter/material.dart';
import 'app_util/AppRouter.dart';
import 'app_util/constant.dart';
import 'package:jiclapp/app_util/Configuration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlavorConfiguration(flavor: Flavor.DEV);
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: launchRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}