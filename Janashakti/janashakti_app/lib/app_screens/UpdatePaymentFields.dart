import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/Fields/CustomDocument.dart';
import 'package:jiclapp/app_modals/Fields/DatePicker.dart';
import 'package:jiclapp/app_modals/Fields/DropDown.dart';
import 'package:jiclapp/app_modals/Fields/TextBox.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_screens/SuspectScreen.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';

Future<void> updatePaymentFields(Map _sectionSubSectionDetails,
    SectionSubSection _sectionSubSection, List _headerSectionFields) async {
  List _subsectionDetails =
      _sectionSubSectionDetails[_sectionSubSection.subSectionID];
  await Future.forEach(_subsectionDetails, (item) async {
    SectionSubSection _sectionDetails = item as SectionSubSection;
    if (isUpdateDeptID(_sectionDetails.fieldDependencyID)) {
      _sectionDetails.fieldValue = returnFieldValue(_subsectionDetails,
          _sectionDetails, _headerSectionFields, _sectionSubSection);
      final globalKey = _sectionDetails.globalKey;
      final currentState = globalKey.currentState;
      if (currentState is TextBoxState) {
        currentState.updateValue(_sectionDetails.fieldValue);
      } else if (currentState is CustomDocumentState) {
        currentState.updateDocumentWithDetails(_sectionDetails.fieldValue,"");
      }
    }
  });
  clearFields(_sectionSubSectionDetails, _sectionSubSection);
  if (_sectionSubSection.fieldDependencyID == 1701) {
    _updatePaymentOptionFields(_sectionSubSection, _subsectionDetails);
  }
}

void clearFields(
    Map _sectionSubSectionDetails, SectionSubSection _sectionSubSection) {
  List _deptFields = [1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691, 1711];
  List _subsectionDetails =
      _sectionSubSectionDetails[_sectionSubSection.subSectionID];
  for (final id in _deptFields) {
    SectionSubSection _sectionDetails =
        _subsectionDetails.where((e) => e.fieldDependencyID == id).toList()[0];
    if (_sectionDetails.fieldDependencyID == 1684 ||
        (_sectionDetails.fieldDependencyID == 1689 &&
            _sectionSubSection.fieldValue.length <= 0)) {
    } else {
      _sectionDetails.fieldValue = "";
    }
    final globalKey = _sectionDetails.globalKey;
    final currentState = globalKey.currentState;
    if (currentState is TextBoxState) {
      currentState.updateValue(_sectionDetails.fieldValue);
    } else if (currentState is DropDownWidgetState) {
      currentState.setUpdatedFiedValueWithFieldID(
          _sectionDetails.fieldID, _sectionDetails.fieldValue);
    } else if (currentState is DatePickerState) {
      currentState.updateVale(_sectionDetails.fieldValue);
    } else if (currentState is CustomDocumentState) {}
  }
}

String returnFieldValue(
    List _subsectionDetails,
    SectionSubSection _sectionDetails,
    List _headerSectionFields,
    SectionSubSection _selectedSectionSubSection) {
  switch (_sectionDetails.fieldDependencyID) {
    case 1701:
      SectionSubSection _selectedOption = _subsectionDetails
          .where((e) => e.fieldDependencyID == 1682)
          .toList()[0];
      SectionSubSection _amount = _subsectionDetails
          .where((e) =>
              e.fieldDependencyID ==
              ((_selectedOption.fieldValue == "0") ? 1689 : 1711))
          .toList()[0];

      SectionSubSection _totalPaidAmount = _subsectionDetails
          .where((e) => e.fieldDependencyID == 1700)
          .toList()[0];

      List _documentDetails = List();
      if (_sectionDetails.fieldValue.length > 0) {
        _documentDetails = (json.decode(_sectionDetails.fieldValue) is List)
            ? json.decode(_sectionDetails.fieldValue)
            : List();
      }
      final _entAmount =
          (_amount.fieldValue.length > 0) ? _amount.fieldValue : "0.0";
      final _entTotalPaidAmount = (_totalPaidAmount.fieldValue.length > 0)
          ? double.parse(_totalPaidAmount.fieldValue.replaceAll(",", ""))
          : 0.0;

      Map<String, dynamic> _mapDetails = {
        "0": (_headerSectionFields[1] as HeaderSectionFields).fieldValue,
        "1": (_headerSectionFields[0] as HeaderSectionFields).fieldValue,
        "2": (_selectedOption.fieldValue == "0") ? "Cheque" : "Cash",
        "3": (_headerSectionFields[5] as HeaderSectionFields).fieldValue,
        "4": _entAmount,
        "5": _subsectionDetails[5].fieldValue,
        "6": _subsectionDetails[6].fieldValue,
        "7": _subsectionDetails[7].fieldValue,
        "8": _subsectionDetails[8].fieldValue,
        "9": _subsectionDetails[10].fieldValue,
        "10": _subsectionDetails[11].fieldValue,
      };
      if (_selectedSectionSubSection.fieldDependencyID != 1701) {
        _documentDetails.add(_mapDetails);
      }
      return (_entTotalPaidAmount > 0) ? jsonEncode(_documentDetails) : "";
    case 1694:
      SectionSubSection _selectedOption = _subsectionDetails
          .where((e) => e.fieldDependencyID == 1682)
          .toList()[0];
      if ((_selectedOption.fieldValue == "1")) {
        SectionSubSection _deptIDieldDetails = _subsectionDetails
            .where((e) => e.fieldDependencyID == 1711)
            .toList()[0];
        final _totalValue = (_sectionDetails.fieldValue.length > 0)
            ? (double.parse(_sectionDetails.fieldValue) +
                (((_deptIDieldDetails.fieldValue.length > 0)
                    ? double.parse(
                        _deptIDieldDetails.fieldValue.replaceAll(",", ""))
                    : 0.0)))
            : ((_deptIDieldDetails.fieldValue.length > 0)
                ? double.parse(
                    _deptIDieldDetails.fieldValue.replaceAll(",", ""))
                : 0.0);
        return (_selectedOption.fieldValue == "1")
            ? _totalValue.toString()
            : (_totalValue <= 0)
                ? "0.0"
                : _totalValue.toString();
      }else{
        return _sectionDetails.fieldValue;
      }
      break;
    case 1695:
      SectionSubSection _selectedOption = _subsectionDetails
          .where((e) => e.fieldDependencyID == 1682)
          .toList()[0];
      if (_selectedOption.fieldValue == "0") {
        SectionSubSection _deptIDieldDetails = _subsectionDetails
            .where((e) => e.fieldDependencyID == 1689)
            .toList()[0];
        final _totalValue = (_sectionDetails.fieldValue.length > 0)
            ? (double.parse(_sectionDetails.fieldValue) +
                (((_deptIDieldDetails.fieldValue.length > 0)
                    ? double.parse(
                        _deptIDieldDetails.fieldValue.replaceAll(",", ""))
                    : 0.0)))
            : double.parse(_deptIDieldDetails.fieldValue.replaceAll(",", ""));
        return (_selectedOption.fieldValue == "0")
            ? _totalValue.toString()
            : (_totalValue <= 0)
                ? "0.0"
                : _totalValue.toString();
      }else{
        return _sectionDetails.fieldValue;
      }
      break;
    case 1700:
      SectionSubSection _cashAmountField = _subsectionDetails
          .where((e) => e.fieldDependencyID == 1694)
          .toList()[0];
      SectionSubSection _chequeAmountField = _subsectionDetails
          .where((e) => e.fieldDependencyID == 1695)
          .toList()[0];
      final _totalValue = ((_cashAmountField.fieldValue.length > 0)
              ? double.parse(_cashAmountField.fieldValue.replaceAll(",", ""))
              : 0.0) +
          ((_chequeAmountField.fieldValue.length > 0)
              ? double.parse(_chequeAmountField.fieldValue.replaceAll(",", ""))
              : 0.0);
      return _totalValue.toString();
  }
  return "";
}

bool isUpdateDeptID(int _fieldDependencyID) {
  return [1694, 1695, 1700, 1701].contains(_fieldDependencyID) ? true : false;
}

void _updatePaymentOptionFields(
    SectionSubSection _sectionSubSection, List _subsectionDetails) {
  if (_sectionSubSection.fieldValue.length > 0) {
    final _listDetails = json.decode(_sectionSubSection.fieldValue);
    var _cashAmount = 0.0;
    var _chequeAmount = 0.0;
    for (final item in _listDetails) {
      if (item["2"] == "Cheque") {
        _chequeAmount =
            _chequeAmount + double.parse(item["4"].replaceAll(",", ""));
      } else {
        _cashAmount = _cashAmount + double.parse(item["4"].replaceAll(",", ""));
      }
    }
    List _deptFields = [1694, 1695, 1700];
    for (final id in _deptFields) {
      SectionSubSection _sectionDetails = _subsectionDetails
          .where((e) => e.fieldDependencyID == id)
          .toList()[0];
      _sectionDetails.fieldValue = ((id == 1694)
          ? _cashAmount.toString()
          : (id == 1695)
              ? _chequeAmount.toString()
              : (_cashAmount + _chequeAmount).toString());
      final globalKey = _sectionDetails.globalKey;
      final currentState = globalKey.currentState;
      if (currentState is TextBoxState) {
        currentState.updateValue(_sectionDetails.fieldValue);
      }
    }
  }
}

void submitProposalPaymentOTPInfo(
    List _headerSectionFields, BuildContext context) async {
  Map object = {
    "quoteNo": _headerSectionFields[0].fieldValue,
    "userName": UserManager().userID
  };
  Utility().activity(context);
  Future.delayed(const Duration(milliseconds: 600), () async {
    final _response = await APIManager().submitProposalPaymentOTPInfo(object);
    if (_response.length > 0) {
      final jsonObject = jsonDecode(_response);
      // if (jsonObject["Message"] == null) {
        stopActivity(context, 23000);
      // }
    }
  });
}

void verifyProposalPaymentOTPInfo(Map _sectionSubSectionDetails,
    BuildContext _context, String _webRefNumber) async {
  List _list = _sectionSubSectionDetails[1026];
  if (_list[24].fieldValue.length > 0) {
    Utility().activity(_context);
    Future.delayed(const Duration(milliseconds: 600), () async {
      Map object = {
        "userName": UserManager().userID,
        "paymentOTP": _list[24].fieldValue.replaceAll(",", "")
      };
      String _response =
          await APIManager().verifyProposalPaymentOTPInfo(object);
      if (_response.length > 0) {
        final jsonObject = jsonDecode(_response);
        if (jsonObject["Message"] == "Success") {
          saveProposalPaymentInfo(
              _sectionSubSectionDetails, _context, _webRefNumber);
        } else {
          Navigator.pop(_context);
          Utility().alertDialog(_context, jsonObject["Message"], 0);
        }
      }
    });
  } else {
    Utility().showAlertDialog(_context, 23001);
  }
}

//SaveProposalPaymentInfo
void saveProposalPaymentInfo(Map _sectionSubSectionDetails,
    BuildContext _context, String _webRefNumber) async {
  Future.delayed(const Duration(milliseconds: 600), () async {
    String _response = await APIManager().saveProposalPaymentInfo(
        _sectionSubSectionDetails, UserManager().userID);
    if (_response.length > 0) {
      final jsonObject = jsonDecode(_response);
      switch (jsonObject["Message"]) {
        case "Success1":
          final isVliad =
              await DBHelper().updateFieldResponse(4003, _webRefNumber);
          if (isVliad) {
            Navigator.pop(_context);
            Utility().alertDialog(_context, LabelConstant.kPaymentError1, 2001);
          }
          break;
        case "Success2":
          final isVliad =
              await DBHelper().updateFieldResponse(4003, _webRefNumber);
          if (isVliad) {
            final isVliad = await DBHelper()
                .updareProposalNumberWithWebRefNumber(
                    _webRefNumber, jsonObject["ProposalNo"]);
            if (isVliad) {
              Navigator.pop(_context);
              Utility().alertDialog(
                  _context,
                  "Proposal No ${jsonObject["ProposalNo"]} has been created Successfully, but failed to generate receipt. Please contact Admin.",
                  2001);
            }
          }
          break;
        case "Success":
          final isVliad =
              await DBHelper().updateFieldResponse(4001, _webRefNumber);
          if (isVliad) {
            final isVliad = await DBHelper()
                .updareProposalNumberWithWebRefNumber(
                    _webRefNumber, jsonObject["ProposalNo"]);
            if (isVliad) {
              Navigator.pop(_context);
              Utility().alertDialog(
                  _context,
                  "Proposal No ${jsonObject["ProposalNo"]} has been created successfully",
                  2001);
            }
          }
          break;
        default:
          Navigator.pop(_context);
          Utility().alertDialog(_context, jsonObject["Message"], 0);
      }
    }
  });
}
