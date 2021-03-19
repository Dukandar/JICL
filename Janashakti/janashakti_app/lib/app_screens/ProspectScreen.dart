import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';

void prospectInsertIntoFieldResponse(Map _sectionSubSectionDetails,
    String _webRefNumber, BuildContext _context) async {
  bool _ = await DBHelper().insertIntoFieldResponse(
      _sectionSubSectionDetails, _webRefNumber, false, false);
  Utility().check().then((internet) => {
        if (internet != null && internet)
          {prospectAPI(_sectionSubSectionDetails, _context, _webRefNumber)}
      });
}

void prospectAPI(Map _sectionSubSectionDetails, BuildContext _context,
    String _webRefNumber) async {
  List<ServiceResponseID> serviceResponseID =
      await DBHelper().getServiceResponseIDWith(_webRefNumber);
  if (serviceResponseID.length > 0) {
    final contactID = serviceResponseID[0].contactID;
    String response = await APIManager().saveProspect(
        _sectionSubSectionDetails, contactID, UserManager().userID);
    if (response.length > 0) {
      final saveProspectData = jsonDecode(response);
      if (saveProspectData["Message"] == LabelConstant.kSuccess) {
        await DBHelper()
            .insertJsonObject(_webRefNumber, response, "prospectObject");
        stopActivity(_context, 1001);
      }
    } else {
      stopActivity(_context, 0);
    }
  }
}

void stopActivity(BuildContext context, int businessSubID) {
  Navigator.pop(context);
  Utility().showAlertDialog(context, businessSubID);
}
