import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/DocumentDirectory.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:path_provider/path_provider.dart';

void saveQuote(
    String _webRefNumber,
    BuildContext _context,
    Map<int, dynamic> _benifitOverViewDetails,
    Map _subSectionDetails,
    Map<String, dynamic> _riderMastersDetails,
    int currentPage,
    dynamic _pageControllercontroller) async {
  final tempJsonObject = await DBHelper().getJsonObject(_webRefNumber);
  if (tempJsonObject.length > 0 && tempJsonObject[0].premiumObject.length > 0) {
    Utility().activity(_context);
    Future.delayed(const Duration(milliseconds: 600), () async {
      //  for(int pageIndex=0;pageIndex<_globalKeys.length;pageIndex++){
      //   if(_globalKeys[currentPage].currentState.validate()){
      final premiumDetails =
          (_benifitOverViewDetails[0] as Map)["BSA"] as PremiumDetails;
      if ((premiumDetails.totalModeTextEditingController.text) != "0") {
        bool isValid = await DBHelper()
            .insertIntoRiderDetails(_benifitOverViewDetails, _webRefNumber);
        if (isValid) {
          List<ServiceResponseID> serviceResponseID =
              await DBHelper().getServiceResponseIDWith(_webRefNumber);
          if (serviceResponseID.length > 0) {
            final contactID = serviceResponseID[0].contactID;
            final quoteNo = serviceResponseID[0].quotationNumber;
            String response = await APIManager().saveQuote(
                _subSectionDetails,
                _benifitOverViewDetails,
                _riderMastersDetails,
                currentPage,
                quoteNo,
                contactID,
                UserManager().userID,
                tempJsonObject[0]);
            if (response.length > 0) {
              final saveQuoteData = jsonDecode(response);
              if (saveQuoteData["Message"] == LabelConstant.kSuccess) {
                final _quotationNumber = saveQuoteData["QuoteNo"];
                Future.delayed(const Duration(milliseconds: 600), () async {
                  String encrResponse =
                      await APIManager().encryptionWithData(_quotationNumber);
                  if (encrResponse.length > 0) {
                    final encryptionString = jsonDecode(encrResponse);
                    String mailResponse =
                        await APIManager().sendEmailWithData(encryptionString);
                    if (mailResponse.length > 0) {
                      final mailData = jsonEncode(mailResponse);
                      if (tempJsonObject[0].quotationObject.length > 0) {
                        saveQuotationVersion(
                            _subSectionDetails,
                            tempJsonObject[0],
                            _quotationNumber,
                            response,
                            _webRefNumber,
                            contactID,
                            _benifitOverViewDetails,
                            _context);
                      } else {
                        await DBHelper().insertJsonObject(
                            _webRefNumber, response, "quotationObject");
                        bool _ = await DBHelper()
                            .updareServiceResponseWithWebRefNumber(
                                _webRefNumber, _quotationNumber);
                        Navigator.pop(_context);
                        Utility().alertDialog(
                            _context,
                            "${LabelConstant.kQuotationSave} $_quotationNumber",
                            1001);
                      }
                    } else {
                      Navigator.pop(_context);
                    }
                  }
                });
              } else {
                Utility().alertDialog(
                    _context, "${LabelConstant.kQuotationSave} 1000", 1001);
                Navigator.pop(_context);
              }
            }
          } else {
            Utility().alertDialog(
                _context, "${LabelConstant.kQuotationSave} 1000", 1001);
          }
        }
      } else {
        _pageControllercontroller.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
        Utility().showToastMessage(LabelConstant.kMandatory);
        Navigator.pop(_context);
      }
    });
  } else {
    Utility().showToastMessage(LabelConstant.kMandatory);
  }
}

//MARK:- Quotation Version
Future<void> saveQuotationVersion(
    Map _sectionSubSectionDetails,
    JsonObject _tempJsonObject,
    String _quotationNumber,
    dynamic respone,
    String _oldWebRefNumber,
    String contactID,
    Map<int, dynamic> _benifitOverViewDetails,
    BuildContext _context) async {
  final _tempWebRefNumber = Utility().returnWebRefNumber().toString();
  final Map<String, String> object = {
    "contactID": contactID,
    "quotationNumber": _quotationNumber
  };
  bool _ =
      await DBHelper().insertIntoServiceResponseID(_tempWebRefNumber, object);
  await DBHelper().insertJsonObject(
      _tempWebRefNumber, _tempJsonObject.suspectObject, "suspectObject");
  await DBHelper().insertJsonObject(
      _tempWebRefNumber, _tempJsonObject.proposalObject, "prospectObject");
  await DBHelper().insertJsonObject(
      _tempWebRefNumber, _tempJsonObject.fnaObject, "fnaObject");
  await DBHelper().insertJsonObject(
      _tempWebRefNumber, _tempJsonObject.premiumObject, "premiumObject");
  await DBHelper()
      .insertJsonObject(_tempWebRefNumber, respone, "quotationObject");
  await DBHelper()
      .insertIntoRiderDetails(_benifitOverViewDetails, _tempWebRefNumber);
  final documentsDirectory = await getApplicationDocumentsDirectory();
  DocumentDirectory().createImageDirectory(_tempWebRefNumber);
  final directory =
      Directory((documentsDirectory.path) + '/' + _oldWebRefNumber);
  final files = await directory.list().toList();
  for (final item in files) {
    final list = item.path.split(".");
    if ((list.length > 0 && list[1] == "png")) {
      final imageName = item.path.split(_oldWebRefNumber)[1].split("/")[1];
      final File image = item;
      // copy the file to a new path
      final File _ = await image.copy((documentsDirectory.path) +
          '/' +
          _tempWebRefNumber +
          "/" +
          imageName);
    }
  }
  bool isValid = await DBHelper().insertIntoFieldResponse(
      _sectionSubSectionDetails, _tempWebRefNumber, true, false);
  if (isValid) {
    Navigator.pop(_context);
    Utility().alertDialog(
        _context, "${LabelConstant.kQuotationSave} $_quotationNumber", 1001);
  }
}
