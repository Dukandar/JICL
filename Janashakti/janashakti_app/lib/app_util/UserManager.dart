
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager{
static final UserManager _shareInstance = new UserManager._internal();
factory UserManager(){
  return _shareInstance;
}
UserManager._internal();
  // static UserManager _shareInstance;
  static SharedPreferences _preferences;
  // factory UserManager()=>_shareInstance??UserManager._();
  var loginUserID = 0;
  var userID = "";
  var iD = "";
  var userName = "";
  var themColorIndex = 0;
  //UserManager._();
  
  void loginData(Map data,BuildContext context){
    inserIntoLoginDetailsWithData(data,context);
  }
  
 Future<bool>isValidUser() async {
    int iD = await getLoginDetails();
    loginUserID = iD;
    return (iD > 0) ? true : false;
  }

  inserIntoLoginDetailsWithData(Map data,BuildContext context) async {
    bool isValid =  await DBHelper().insertIntoLoginDetails(data);
    if (isValid){
      bool validUser = await isValidUser();
      if(validUser){
          Navigator.pushNamed(context, homeRoute);
      }
    }
  }

  Future<int> getLoginDetails() async {
     List<Login> loginDetails = await DBHelper().getLoginDetails();
      if (loginDetails.length > 0){
        final loginDetail = loginDetails[0];
        userName = loginDetail.username;
        userID = loginDetail.userID;
        iD = loginDetail.iD;
        themColorIndex = ( int.parse(loginDetail.themcolor) == 3000) ? 1 : 0;
        return int.parse((loginDetail.iD.length > 0) ? "20000" : 0);
      }
      return 0;
  }

  setThemIWithndex(int index) async {
    if (_preferences != null) {
         _preferences.setInt(LabelConstant.kThemIndex,index);
     }
  }

  Future<void> returnPrefs() async{
   if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  static int returnThemIndex()  {
    if (_preferences != null) {
         if(_preferences.get(LabelConstant.kThemIndex) != null){
            return _preferences.get(LabelConstant.kThemIndex);
        }
    }
    return 0;
  }
}
