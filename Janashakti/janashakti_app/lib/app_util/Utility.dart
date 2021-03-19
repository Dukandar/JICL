import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_screens/BusinessCardScreen.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';

class Utility {
  static Utility _shareInstance;
  factory Utility() => _shareInstance ?? Utility._();
  Utility._();

  void activity(BuildContext context) {
    showDialog(
        context: context,
       // barrierDismissible: false,
        builder: (BuildContext ctxt) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: new Row(children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.orange,
              ),
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(LabelConstant.kLoadingMessage))
            ]),
            backgroundColor: Colors.white,
          );
        });
  }

  returnWebRefNumber() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  alertDialog(BuildContext context, String message, int id) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(ButtonLableConstant.kOK),
      onPressed: () {
        Navigator.pop(context);
        rootNavigation(context, id);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(LabelConstant.kJICL),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showToastMessage(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 8,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showAlertDialog(BuildContext context, int businessId) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(ButtonLableConstant.kOK),
      onPressed: () {
        Navigator.pop(context);
        rootNavigation(context, businessId);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(LabelConstant.kJICL),
      content: Text(returnTextWithBusinessID(businessId)),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  returnTextWithBusinessID(int businessID) {
    switch (businessID) {
      case 1000:
        return LabelConstant.kDataSave;
      case 1001:
        return LabelConstant.kProspectStage;
      case 2001:
        return LabelConstant.kConfirmedProspectStage;
      case 20021:
        return LabelConstant.kNeedAnalysisCompletedStage;
      case 20022:
        return LabelConstant.kQuotationdStage;
      case 20034:
        return LabelConstant.kServerError;
      case 23000:
        return LabelConstant.kOTPMessage; 
        case 23001:
           return LabelConstant.kOTPError; 
      default:
        return LabelConstant.kDataSave;
    }
  }

  void rootNavigation(BuildContext context, int businessId) {
    switch (businessId) {
      case 1000:
        final object = {
          "title": LabelConstant.ksuspectPool,
          "businessID": 1000,
          "businessSubID": 1001,
          "poolname": Poolname.kSuspect
        };
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BusinessCardScreen(refreshState, object)));
        break;
      case 1001:
        Navigator.popAndPushNamed(context, newBusinessRoute);
        break;
      case 2001:
        Navigator.popAndPushNamed(context, newBusinessRoute);
        break;
      case 20021:
        Navigator.popAndPushNamed(context, newBusinessRoute);
        break;
      case 200000:
        Navigator.popAndPushNamed(context, newBusinessRoute);
        break;
      case 20022:
        Navigator.popAndPushNamed(context, newBusinessRoute);
        break;
      case 40002:
        Navigator.popAndPushNamed(context, newBusinessRoute);
        break;
      case 8000:
        DBHelper().deleteLoginDataWithUsername(UserManager().userID);
        Navigator.pushNamed(context, loginRoute);
        break;
    }
  }

  void refreshState() {}
//Return days left
  int returnDaysLeftWithMilliSecound(String milliSecound) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(milliSecound));
    Duration duration = DateTime.now().difference(dateTime);
    final numberOfDays = (duration.inDays > 0) ? duration.inDays : 0;
    return (60 - ((numberOfDays > 60) ? 60 : numberOfDays));
  }

  returnDateOfBirthAgeGenderFromNICNumber(String nicNumber) {
    var dayText = 1;
    var year = "";
    var month = "";
    var day = "";
    var gender = "";
    var tempDic = {};

    // Year
    if (nicNumber.length == 10) {
      year = "19" + nicNumber.substring(0, 2);
      dayText = int.parse(nicNumber.substring(2, 5));
    } else if (nicNumber.length == 12) {
      year = nicNumber.substring(0, 4);
      dayText = int.parse(nicNumber.substring(4, 7));
    }

    // Gender
    if (dayText > 500) {
      gender = "Female";
      dayText = dayText - 500;
    } else {
      gender = "Male";
    }

    // Day Digit Validation
    if (dayText < 1 && dayText > 366) {
      //Validate
    } else {
      //Month
      if (dayText > 335) {
        day = (dayText - 335).toString();
        month = "12";
      } else if (dayText > 305) {
        day = (dayText - 305).toString();
        month = "11";
      } else if (dayText > 274) {
        day = (dayText - 274).toString();
        month = "10";
      } else if (dayText > 244) {
        day = (dayText - 244).toString();
        month = "09";
      } else if (dayText > 213) {
        day = (dayText - 213).toString();
        month = "08";
      } else if (dayText > 182) {
        day = (dayText - 182).toString();
        month = "07";
      } else if (dayText > 152) {
        day = (dayText - 152).toString();
        month = "06";
      } else if (dayText > 121) {
        day = (dayText - 121).toString();
        month = "05";
      } else if (dayText > 91) {
        day = (dayText - 91).toString();
        month = "04";
      } else if (dayText > 60) {
        day = (dayText - 60).toString();
        month = "03";
      } else if (dayText > 31) {
        day = (dayText - 31).toString();
        month = "02";
      } else if (dayText < 32) {
        month = "01";
        day = dayText.toString();
      }
      if (day.length < 2) {
        day = '0' + day;
      }

      final selectedDate = DateTime.parse(year + '-' + month + '-' + day);
      Duration duration = DateTime.now().difference(selectedDate);
      final numberOfYears = (((duration.inDays / 365).floor()) + 1).toString();

      if (int.parse(numberOfYears) > 0) {
        tempDic["date"] = year + '-' + month + '-' + day;
        tempDic["age"] = numberOfYears;
        tempDic["gender"] = gender;
      }
      return tempDic;
    }
  }

  static getGenderFromCode(int code) {
    switch (code) {
      case 0:
        return 'Male';
        break;
      case 1:
        return 'Male';
        break;
      case 2:
        return 'Male';
        break;
      case 3:
        return 'Male';
        break;

      case 5:
        return "Female";
        break;
      case 6:
        return "Female";
        break;
      case 7:
        return "Female";
        break;
      case 8:
        return "Female";
        break;
    }
  }

  returnKeyPadType(SectionSubSection _sectionSubSection) {
    switch (_sectionSubSection.fieldType) {
      case "numeric":
        return [WhitelistingTextInputFormatter.digitsOnly];
        break;
      case "phone":
        return [WhitelistingTextInputFormatter.digitsOnly];
        break;
      case "emailID":
        return [
          WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú 0-9 @ .]"))
        ];
        break;
      default:
        return [
          WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú 0-9]"))
        ];
        break;
    }
  }

//MARK:-

  returnPageThemColorWithIndex(int index) {
    switch (index) {
      case 0:
        return Colors.white.withOpacity(0.9);
      case 1:
        return Colors.black.withOpacity(0.9);
    }
  }

  returnIconColor() {
    return Colors.orange;
  }

  TextStyle retuenAnalysisTextStyle() {
    return TextStyle(
        color: Colors.orange,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: "Helvetica");
  }

  TextStyle retuenLargeTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontFamily: "Helvetica",
        fontWeight: FontWeight.bold);
  }

  TextStyle retuenWhilteTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 16.0, fontFamily: "Helvetica");
  }

  returnContainerColorWithIndex(int index) {
    switch (index) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.black;
    }
  }

  returnThemColorWithIndex(int index) {
    switch (index) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.black;
    }
  }

  returnPlaceHolderColorWithIndex(int index) {
    switch (index) {
      case 0:
        return Colors.black;
      case 1:
        return Colors.white;
    }
  }

  returnBoarderColorWithIndex(int index) {
    switch (index) {
      case 0:
        return Colors.grey;
      case 1:
        return Colors.white;
    }
  }

  returnTextFieldBoarderColorWithIndex(int index) {
    switch (index) {
      case 0:
        return Colors.grey;
      case 1:
        return Colors.white;
    }
  }

  returnThemColorIndex() {
    return UserManager.returnThemIndex();
  }

  returnBackgroundImage() {
    return DecorationImage(
        image: AssetImage("assets/images/login-bg.jpg"), fit: BoxFit.cover);
  }

  returnHeaderTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0);
  }

  returnLabelStyle() {
    return TextStyle(
        color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14.0);
  }

  returnHintStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0);
  }

  returnNumericHintStyle() {
    return TextStyle(
        color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14.0);
  }

  returnLableViewHeaderTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0);
  }

  returnNormalTextStyle() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0);
  }

  returnModelPremiumTextStyle() {
    return TextStyle(
        color: (returnThemColorIndex() == 0) ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0);
  }

  returnBenifitTextStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0);
  }

  returnExpansionHeaderTextStyle() {
    return TextStyle(
        color: (returnThemColorIndex() == 0) ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.0);
  }

  returnRiderHeaderTextStyle() {
    return TextStyle(
        color: (returnThemColorIndex() == 0) ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.0);
  }

  returnLabelViewRiderDescTextStyle() {
    return TextStyle(
        color: (returnThemColorIndex() == 0) ? Colors.black : Colors.white,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
        fontSize: 14.0);
  }

  returnRiderDescTextStyle() {
    return TextStyle(
        color: (returnThemColorIndex() == 0) ? Colors.black : Colors.white,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
        fontSize: 12.0);
  }

  returnBusinssDetailsNormalTextStyle() {
    return TextStyle(
        color: (returnThemColorIndex() == 0) ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14.0);
  }

//MARK:- Connectivity
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

//moveFile
  Future<File> moveFile(File sourceFile, String newPath) async {
    try {
      /// prefer using rename as it is probably faster
      /// if same directory path
      return await sourceFile.rename(newPath);
    } catch (e) {
      // /// if rename fails, copy the source file
      // final newFile = await sourceFile.copy(newPath);
      // return newFile;
      return null;
    }
  }

  //MARK:- Device Info
  Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}

extension StringExtension on String {
  String trimChar() {
    return this.replaceAll(" ", "");
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
