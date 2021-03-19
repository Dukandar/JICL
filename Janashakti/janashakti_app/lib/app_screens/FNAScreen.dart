import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:path_provider/path_provider.dart';

void fNAUploadMediaFiles(
    String _webRefNumber,
    bool _isProceedToPayment,
    Map _sectionSubSectionDetails,
    BuildContext context,
    List _globalKeys) async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final dir = Directory((documentsDirectory.path) + '/' + _webRefNumber);
  final files = await dir.list().toList();
  List<ServiceResponseID> serviceResponseID =
      await DBHelper().getServiceResponseIDWith(_webRefNumber);
  final _contactID = serviceResponseID[0].contactID;
  List _mediaFiles = [];
  for (final item in files) {
    //final list = item.path.split(".png");
    if (item.path.contains(".png")) {
      final Map<String, dynamic> _details = {
        "contactId": _contactID,
        "filePath": item.path,
      };
      _mediaFiles.add(_details);
    }
  }
  Future.delayed(const Duration(milliseconds: 600), () async {
    String response = "";
    if(_mediaFiles.length > 0){
       response = await APIManager().uploadMediFiles(_mediaFiles);
    }
    List _mediaData = List();
    if (response.length > 0) {
      final data = jsonDecode(response);
       _mediaData = data["ObjDocuments"] as List;
    }
      _apiRequest(
          _webRefNumber,
          _sectionSubSectionDetails,
          ((_mediaData.length > 0) ? _mediaData : List()),
          _mediaFiles,
          _isProceedToPayment,
          context,
          _globalKeys);
  });
}

void _apiRequest(
    String _webRefNumber,
    Map _sectionSubSectionDetails,
    List _mediaData,
    List __mediaFiles,
    bool _isProceedToPayment,
    BuildContext context,
    List _globalKeys) async {
  List<ServiceResponseID> serviceResponseID =
      await DBHelper().getServiceResponseIDWith(_webRefNumber);
  if (serviceResponseID.length > 0) {
    final contactID = serviceResponseID[0].contactID;
     //Get fieldData
    List<FieldData> fieldDataDetails = await DBHelper().getFieldDataList();
    String response = await APIManager().saveSaveNeedAnalysis(
        _sectionSubSectionDetails, contactID, UserManager().userID, _mediaData,fieldDataDetails);
    if (response.length > 0) {
      final saveFNAData = jsonDecode(response);
      if (saveFNAData["Message"] == LabelConstant.kSuccess) {
        bool _ = await DBHelper().insertIntoFieldResponse(
                        _sectionSubSectionDetails, _webRefNumber, false, false);
        await DBHelper().insertJsonObject(_webRefNumber, response, "fnaObject");
        stopActivity(context, 20022);
      } else {
        stopActivity(context, 20034);
      }
    } else {
      stopActivity(context, 0);
    }
  }
}

void stopActivity(BuildContext context, int businessSubID) {
  Navigator.pop(context);
  Utility().showAlertDialog(context, businessSubID);
}
