import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:path_provider/path_provider.dart';

void proposalUploadMediaFiles(
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
   // final list = item.path.split(".");
    if (item.path.contains(".png")) {
      final Map<String, dynamic> _details = {
        "contactId": _contactID,
        "filePath": item.path,
      };
      _mediaFiles.add(_details);
    }
  }
  Future.delayed(const Duration(milliseconds: 600), () async {
    String response = await APIManager().uploadMediFiles(_mediaFiles);
    if (response.length >= 0) {
      final data = jsonDecode(response);
      final _mediaData = data["ObjDocuments"] as List;
      _apiRequest(
          _webRefNumber,
          _sectionSubSectionDetails,
          ((_mediaData.length > 0) ? _mediaData : List()),
          _mediaFiles,
          _isProceedToPayment,
          context,
          _globalKeys);
    }
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
    final _contactID = serviceResponseID[0].contactID;
    final tempJsonObject = await DBHelper().getJsonObject(_webRefNumber);
    if (tempJsonObject[0].incompleteProposalInfo.length <= 0) {
      //  Utility().activity(context);
      // Future.delayed(const Duration(milliseconds: 600), () async {
      String response = await APIManager()
          .getInCompleteProposalPoolWithUsername(UserManager().userID);
      if (response.length > 0) {
        final inCompleteProposalData = jsonDecode(response);
        if (inCompleteProposalData["objProposalDetails"].length > 0) {
          final tempProposalPollData =
              inCompleteProposalData["objProposalDetails"] as List;
          final proposalDetails = tempProposalPollData
              .where((element) =>
                  element["QuoteNo"] == serviceResponseID[0].quotationNumber)
              .toList();
          if (proposalDetails.length > 0) {
            String response = await APIManager()
                .getFetchProposalInfoWithUsername(
                    UserManager().userID, proposalDetails[0]["PolicyID"]);
            if (response.length > 0) {
              final fetchProposalData = jsonDecode(response);
              if (fetchProposalData["objMemberDetails"].length > 0) {
                final _memberID = (fetchProposalData["objMemberDetails"][0]
                    as Map)["MemberID"];
                final _memberLifeStyleID =
                    ((fetchProposalData["objMemberDetails"][0]
                            as Map)["objLifeStyleQuetions"]
                        as Map)["MemberLifeStyleID"];
                saveProposal(
                    _memberID.toString(),
                    _contactID,
                    tempJsonObject[0],
                    _memberLifeStyleID.toString(),
                    response,
                    __mediaFiles,
                    _mediaData,
                    _isProceedToPayment,
                    context,
                    _globalKeys,
                    _sectionSubSectionDetails,
                    _webRefNumber);
                ////await DBHelper().insertJsonObject(webRefNumber,response,"incompleteProposalInfo");
              } else {
                saveProposal(
                    "0.0",
                    _contactID,
                    tempJsonObject[0],
                    "",
                    null,
                    __mediaFiles,
                    _mediaData,
                    _isProceedToPayment,
                    context,
                    _globalKeys,
                    _sectionSubSectionDetails,
                    _webRefNumber);
              }
            }
          } else {
            saveProposal(
                "0.0",
                _contactID,
                tempJsonObject[0],
                "",
                null,
                __mediaFiles,
                _mediaData,
                _isProceedToPayment,
                context,
                _globalKeys,
                _sectionSubSectionDetails,
                _webRefNumber);
          }
        }else{
           saveProposal(
                "0.0",
                _contactID,
                tempJsonObject[0],
                "",
                null,
                __mediaFiles,
                _mediaData,
                _isProceedToPayment,
                context,
                _globalKeys,
                _sectionSubSectionDetails,
                _webRefNumber);
        }
      }
      // });
    } else {
      saveProposal(
          "0.0",
          _contactID,
          tempJsonObject[0],
          "",
          null,
          __mediaFiles,
          _mediaData,
          _isProceedToPayment,
          context,
          _globalKeys,
          _sectionSubSectionDetails,
          _webRefNumber);
    }
  }
}

Future<void> saveProposal(
    String _memberID,
    String _contactID,
    JsonObject jsonObject,
    String _memberLifeStyleID,
    dynamic fetchProposalInfo,
    List _mediaFiles,
    List _mediaData,
    bool _isProceedToPayment,
    BuildContext context,
    List _globalKeys,
    Map _sectionSubSectionDetails,
    String _webRefNumber) async {
  for (int pageIndex = 0; pageIndex < _globalKeys.length; pageIndex++) {
    if (_globalKeys[pageIndex].currentState != null) {
      if (_globalKeys[pageIndex].currentState.validate()) {
        if (pageIndex + 1 == _globalKeys.length) {
          final _validationMessage =
              FormValidator().isValidate(_sectionSubSectionDetails, 1024);
          if (_validationMessage.length == 0) {
            //Save Prposal
            bool _ = await DBHelper().insertIntoFieldResponse(
                _sectionSubSectionDetails, _webRefNumber, true, false);
            saveProposalProccedToPayment(
                _memberID,
                _contactID,
                jsonObject,
                _memberLifeStyleID,
                fetchProposalInfo,
                _mediaFiles,
                _mediaData,
                _isProceedToPayment,
                _sectionSubSectionDetails,
                _webRefNumber,
                context);
          } else {
            Utility().showToastMessage(_validationMessage);
            Navigator.pop(context);
          }
        }
      }
    }
  }
}

//Checking Save proposla or proceed to payment
void saveProposalProccedToPayment(
    String _memberID,
    String _contactID,
    JsonObject jsonObject,
    String _memberLifeStyleID,
    dynamic fetchProposalInfo,
    List _mediaFiles,
    List _mediaData,
    bool _isProceedToPayment,
    Map _sectionSubSectionDetails,
    String _webRefNumber,
    BuildContext context) async {
  switch (_isProceedToPayment) {
    case true:
      //Procced to payment
      String response = await saveProposlAPI(
          _memberID,
          _contactID,
          jsonObject,
          _memberLifeStyleID,
          fetchProposalInfo,
          _mediaFiles,
          _mediaData,
          false,
          _sectionSubSectionDetails,
          _webRefNumber);
      if (response.length > 0) {
        final saveProspectData = jsonDecode(response);
        if (saveProspectData["Status"] == LabelConstant.kSuccess) {
          Map object = {
            "ProposalNo": saveProspectData["ProposalNo"],
            "PolicyID": saveProspectData["PolicyID"],
            "QuoteNo": saveProspectData["QuoteNo"]
          };
          dynamic documentResponse = await APIManager().saveDocument(object);
          if (documentResponse != null) {
            //  final documentData = jsonDecode(documentResponse);
            String response = await saveProposlAPI(
                _memberID,
                _contactID,
                jsonObject,
                _memberLifeStyleID,
                fetchProposalInfo,
                _mediaFiles,
                _mediaData,
                _isProceedToPayment,
                _sectionSubSectionDetails,
                _webRefNumber);
            if (response.length > 0) {
              final saveProspectData = jsonDecode(response);
              if (saveProspectData["Status"] == LabelConstant.kSuccess) {
                bool _isValid = await DBHelper().insertIntoFieldResponse(
                    _sectionSubSectionDetails, _webRefNumber, false, false);
                if (_isValid) {
                  bool _isValid = await DBHelper().updateProposalPayment(
                      jsonObject, 6000, 1359, _webRefNumber);
                  if (_isValid) {
                    stopActivity(context, 40002);
                  }
                }
              }
            }
          } else {
            stopActivity(context, 0);
          }
        } else {
          stopActivity(context, 0);
        }
      }
      break;
    default:
      String response = await saveProposlAPI(
          _memberID,
          _contactID,
          jsonObject,
          _memberLifeStyleID,
          fetchProposalInfo,
          _mediaFiles,
          _mediaData,
          _isProceedToPayment,
          _sectionSubSectionDetails,
          _webRefNumber);
      if (response.length > 0) {
        final saveProspectData = jsonDecode(response);
        if (saveProspectData["Status"] == LabelConstant.kSuccess) {
          // widget.object["businessSubID"] = 20021;
          stopActivity(context, 40002);
        }
      } else {
        stopActivity(context, 0);
      }
      break;
  }
}

//API=> Save Proposal
Future<String> saveProposlAPI(
    String _memberID,
    String _contactID,
    JsonObject jsonObject,
    String _memberLifeStyleID,
    dynamic fetchProposalInfo,
    List _mediaFiles,
    List _mediaData,
    bool _isProceedToPayment,
    Map _sectionSubSectionDetails,
    String _webRefNumber) async {
  //Get fieldData
  List<FieldData> fieldDataDetails = await DBHelper().getFieldDataList();
  String response = await APIManager().saveProposal(
      _sectionSubSectionDetails,
      _contactID,
      UserManager().userID,
      jsonObject,
      _memberID,
      _memberLifeStyleID,
      fetchProposalInfo,
      fieldDataDetails,
      _mediaFiles,
      _mediaData,
      _webRefNumber,
      _isProceedToPayment);
  if (response.length > 0) {
    final saveProspectData = jsonDecode(response);
    if (saveProspectData["Status"] == LabelConstant.kSuccess) {
      return response;
    }
  }
  return "";
}

void stopActivity(BuildContext context, int businessSubID) {
  Navigator.pop(context);
  Utility().showAlertDialog(context, businessSubID);
}
