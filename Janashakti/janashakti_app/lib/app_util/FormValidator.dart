import 'dart:convert';

import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';

import 'Constant.dart';

class FormValidator {
  static FormValidator _instance;

  factory FormValidator() => _instance ??= new FormValidator._();

  FormValidator._();

  String validatePassword(String value) {
    String patttern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d@)[a-zA-Z\d]{6,}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Password is Required";
    } else if (value.length < 8) {
      return "Password must contain minimum eight characters";
    } else if (!regExp.hasMatch(value)) {
      return null;
      //return "Password must contain at least one uppercase, one lowercase letter and one number";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^&<>()[\]\\.,;:\s@\"]+(\.[^&<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String validUserID(String value) {
    if (value.isEmpty) {
      return "Invalid User id";
    }
    return null;
  }

  String validateInputText(String value, SectionSubSection _subSectionDetails) {
    if (value.isEmpty &&
        _subSectionDetails.isManditory &&
        !_subSectionDetails.isHide) {
      return _subSectionDetails.validationMessage +
          " " +
          _subSectionDetails.fieldName;
    } else if (_subSectionDetails.isManditory && !_subSectionDetails.isHide) {
      if (value.length > 0) {
        switch (_subSectionDetails.fieldID) {
          case 1003:
            // if (value.length == 9){
            //     final firstTwoString = value.substring(0,2);
            //     if(!firstTwoString.contains("78")){
            //         return _subSectionDetails.validationMessage + " " + _subSectionDetails.fieldName;
            //     }
            // }else{
            //        return _subSectionDetails.validationMessage + " " + _subSectionDetails.fieldName;
            // }
            return null;
            break;
          case 1004:
            if (value.length >= 9) {
              // final firstTwoString = value.substring(0,2);
              // if(!firstTwoString.contains("11")){
              //     return _subSectionDetails.validationMessage + " " + _subSectionDetails.fieldName;
              // }
              return null;
            } else {
              return _subSectionDetails.validationMessage +
                  " " +
                  _subSectionDetails.fieldName;
            }
            break;
          case 1005:
            if (value.length >= 9) {
              // final firstTwoString = value.substring(0,2);
              // if(!firstTwoString.contains("11")){
              //     return _subSectionDetails.validationMessage + " " + _subSectionDetails.fieldName;
              // }
              return null;
            } else {
              return _subSectionDetails.validationMessage +
                  " " +
                  _subSectionDetails.fieldName;
            }
            break;
          case 1006:
            String pattern =
                r'^(([^&<>()[\]\\.,;:\s@\"]+(\.[^&<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = new RegExp(pattern);
            if (!regExp.hasMatch(value)) {
              return _subSectionDetails.validationMessage +
                  " " +
                  _subSectionDetails.fieldName;
            }
            break;
        }
      }
    }
    return null;
  }

  String validateNICNo(String value, _subSectionDetails) {
    if (value.isEmpty && _subSectionDetails.isManditory) {
      return _subSectionDetails.validationMessage +
          " " +
          _subSectionDetails.fieldName;
    } else if (_subSectionDetails.isManditory) {
      String pattern = "";
      if (value.length == 10) {
        pattern = r'^[0-9]{2}([0-3]|[5-8])[0-9]{6}[V|v|X|x]$';
      } else {
        pattern = r'^[0-9]{4}([0-3]|[5-8])[0-9]{7}$';
      }
      RegExp regExp = new RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return "Invalid NIC Number";
      } else {
        return null;
      }
    }
    return null;
  }

//Premium validation
  String validPremiumInputText(
      String value, PremiumDetails premiumDetails, String benifitCode) {
    switch (benifitCode) {
      case "BSA":
        return (value.length <= 0) ? "Please enter sumassured" : null;
      case "HRCL":
        return (value.length <= 0) ? "Please select sumassured" : null;
      case "HCB":
        return null;
        break;
      default:
        if (value.length <= 0) {
          return null; //"Please enter sumassured";
          //between ${premiumDetails.minTextEditingController.text} and ${premiumDetails.maxTextEditingController.text}
        } else if (value.length > 0) {
          if (int.parse(value.replaceAll(',', '')) >
              int.parse(premiumDetails.maxTextEditingController.text
                  .replaceAll(',', ''))) {
            return "Sumassured should not greater than Max value";
          } else if (int.parse(value.replaceAll(',', '')) <
              int.parse(premiumDetails.minTextEditingController.text
                  .replaceAll(',', ''))) {
            return "Sumassured should not lesser than Min value";
          }
        }
    }
    return null;
  }

//MARK:- is checking the Hose holding income
  Future<bool> isCheckingHouseHoldingIncomeWithAMI(
      Map _sectionSubSectionDetails) async {
    final _subSectionDetails =
        (_sectionSubSectionDetails[1002][14] as SectionSubSection);
    final _holdingIncome =
        (_sectionSubSectionDetails[1004][10] as SectionSubSection);
    if (_subSectionDetails.fieldValue.length > 0 &&
        _holdingIncome.fieldValue.length > 0) {
      List<FieldData> fieldDataDetails = await DBHelper()
          .getFieldDataWithFieldDataID(
              _subSectionDetails.fieldValue, _subSectionDetails.fieldID);
      if (fieldDataDetails.length > 0) {
        final fieldDataDetail = fieldDataDetails[0];
        final tempArray = fieldDataDetail.fieldValue.split("-");
        //final initValue = double.parse(tempArray[0].replaceAll(RegExp(','), ''));
        final endValue = double.parse(tempArray[1].replaceAll(RegExp(','), ''));
        if (endValue >=
            double.parse(
                _holdingIncome.fieldValue.replaceAll(RegExp(','), ''))) {
          return true;
        } else {
          return false;
        }
      }
    }
    return null;
  }

  //MARK:- Prospect,Spouse and Household Total
  Future<bool> isHouseholdTotal(Map _sectionSubSectionDetails) async {
    final _subSectionDetails =
        (_sectionSubSectionDetails[1002][14] as SectionSubSection);
    final _houseHoldDetails =
        (_sectionSubSectionDetails[1006][4] as SectionSubSection);
    if (_subSectionDetails.fieldValue.length > 0) {
      List<FieldData> fieldDataDetails = await DBHelper()
          .getFieldDataWithFieldDataID(
              _subSectionDetails.fieldValue, _subSectionDetails.fieldID);
      if (fieldDataDetails.length > 0) {
        final fieldDataDetail = fieldDataDetails[0];
        final tempArray = fieldDataDetail.fieldValue.split("-");
        final initValue =
            double.parse(tempArray[0].replaceAll(RegExp(','), ''));
        final endValue = double.parse(tempArray[1].replaceAll(RegExp(','), ''));
        if (initValue <=
                double.parse(
                    _houseHoldDetails.fieldValue.replaceAll(RegExp(','), '')) &&
            endValue >=
                double.parse(
                    _houseHoldDetails.fieldValue.replaceAll(RegExp(','), ''))) {
          return true;
        } else {
          return false;
        }
      }
    }
    return null;
  }

  //Form validator
  String isValidate(Map _sectionSubsectionDetails, int _sectionID) {
    var isSpouseCovered = false;
    final _quaSectionSubsections = _sectionSubsectionDetails[1020];
    final _quaList = _quaSectionSubsections[1].fieldValue.split(",");
    if (_quaList.length > 2) {
      isSpouseCovered = (_quaList[2] == "Spouse") ? true : false;
    }
    for (final item in _sectionSubsectionDetails.keys.toList()) {
      switch (item) {
        case 1024:
          final _sectionSubsections = _sectionSubsectionDetails[item];
          final _sectionSubsection =
              _sectionSubsections[1] as SectionSubSection;
          final _fieldValue = _sectionSubsection.fieldValue;
          final _decodeDetails = jsonDecode(_fieldValue);
          final _documentsDeclaration = _decodeDetails["1155"].split("#");
          if (_documentsDeclaration[0].length <= 0) {
            return LabelConstant.kDocumentError;
          } else if (_documentsDeclaration[2] != "1") {
            return LabelConstant.kDeclarationError;
          } else if (_documentsDeclaration[4].length <= 0) {
            return LabelConstant.kProposerImageError;
          } else if (_documentsDeclaration[5].length <= 0 &&
              _documentsDeclaration[6].length <= 0) {
            return LabelConstant.kProposerSignatureError;
          } else if (isSpouseCovered &&
              _documentsDeclaration[8].length <= 0 &&
              _documentsDeclaration[9].length <= 0) {
            return LabelConstant.kSpouseSignatureError;
          }
          break;
        case 1020:
          final _sectionSubsections = _sectionSubsectionDetails[item];
          final _sectionSubsection =
              _sectionSubsections[2] as SectionSubSection;
          final _fieldValue = _sectionSubsection.fieldValue;
          if (isSpouseCovered) {
            final item = _fieldValue.split("@");
            if(item[1].length > 0){
               final _decodeData = jsonDecode(item[1]);
            final keys = _decodeData.keys;
            for (final key in keys) {
              switch (key) {
                case "1175":
                  final _listDetails = (_decodeData[key]).split("#");
                  if(_listDetails[0].length <= 0){
                    return LabelConstant.kSpouseLifeStyleError;
                  }else  if(_listDetails[0].length <= 0){
                    return LabelConstant.kSpouseLifeStyleError;
                  }
                break;
                case "1177":
                 final _listDetails = (_decodeData[key]).split("#");
                 if(_listDetails[0].length <= 0){
                    return LabelConstant.kSpouseLifeStyleError;
                 }else{
                   final _familyHistoryDeode = jsonDecode(jsonDecode(_listDetails[0]));
                   if(_familyHistoryDeode[0]["1"].length <= 0 || _familyHistoryDeode[0]["2"].length <= 0 || _familyHistoryDeode[0]["3"].length <= 0){
                     return LabelConstant.kSpouseLifeStyleError;
                   }else if(_familyHistoryDeode[1]["1"].length <= 0 || _familyHistoryDeode[1]["2"].length <= 0 || _familyHistoryDeode[1]["3"].length <= 0){
                     return LabelConstant.kSpouseLifeStyleError;
                   }
                 }
                break;
                default:break;
              }
             }
            }else{
               return LabelConstant.kSpouseLifeStyleError;
            }
          }
          break;
        default:
          break;
      }
    }
    return "";
  }
}
