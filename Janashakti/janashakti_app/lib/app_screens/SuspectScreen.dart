import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

void suspectInsertIntoFieldResponse(Map _sectionSubSectionDetails,
    String _webRefNumber, BuildContext _context) async {
  bool _ = await DBHelper().insertIntoFieldResponse(
      _sectionSubSectionDetails, _webRefNumber, false, false);
  Utility().check().then((internet) => {
        if (internet != null && internet)
          {suspectAPI(_sectionSubSectionDetails, _context, _webRefNumber)}
      });
}

void suspectAPI(Map _sectionSubSectionDetails, BuildContext _context,
    String _webRefNumber) async {
  String response = await APIManager().saveSuspect(_sectionSubSectionDetails);
  if (response.length > 0) {
    final saveSuspectData = jsonDecode(response);
    if (saveSuspectData["Message"] == LabelConstant.kSuccess) {
      await DBHelper()
          .insertJsonObject(_webRefNumber, response, "suspectObject");
      Map object = {
        "contactID": saveSuspectData["ContactID"],
        "quotationNumber": ""
      };
      bool _ =
          await DBHelper().insertIntoServiceResponseID(_webRefNumber, object);
      stopActivity(_context, 1000);
    }
  } else {
    stopActivity(_context, 0);
  }
}

void stopActivity(BuildContext context, int businessSubID) {
  Navigator.pop(context);
  Utility().showAlertDialog(context, businessSubID);
}
