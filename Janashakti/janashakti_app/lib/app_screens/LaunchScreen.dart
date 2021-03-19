import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/CSVReader.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'dart:async';
import 'package:jiclapp/app_util/constant.dart';

class LaunchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login-bg.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(),
              Row(),
              Image.asset('assets/images/AppIcon.png', width: 100, height: 100),
              Row(),
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.yellow,
              ),
            ],
          )),
    );
  }

//MARK:- Init
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isValidMaster();
      //_autonavigateToHomeState();
    });
  }

  Timer _timer;

//MARK:- Deinit
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<bool> isValidMaster() async {
    List<SectionMaster> list = await DBHelper().getSectionMasterList();
    bool validUser = await UserManager().isValidUser();
    if (list.length > 0) {
      //Share prefrence instance
      final _ = await UserManager().returnPrefs();
      _timer = new Timer(const Duration(milliseconds: 1200), () {
        if (validUser) {
          Navigator.pushNamed(context, homeRoute);
        } else {
          Navigator.pushNamed(context, loginRoute);
        }
      });
    } else {
      bool isVliad = await CSVReader().prepareDBWithCSVFiles();
      if (isVliad) {
        _timer = new Timer(const Duration(milliseconds: 1200), () {
       if (validUser) {
          Navigator.pushNamed(context, homeRoute);
        } else {
          Navigator.pushNamed(context, loginRoute);
        }
          return true;
        });
      }
    }
    return true;
  }
}
