//Hide UnHide details

import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/Fields/Button.dart';
import 'package:jiclapp/app_modals/Fields/CustomDocument.dart';
import 'package:jiclapp/app_modals/Fields/DatePicker.dart';
import 'package:jiclapp/app_modals/Fields/DropDown.dart';
import 'package:jiclapp/app_modals/Fields/Label.dart';
import 'package:jiclapp/app_modals/Fields/TextBox.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_screens/UpdatePaymentFields.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

//Hide UnHide details
Future<void> hideUnHideFields(Map _sectionSubSectionDetails,
    SectionSubSection _sectionSubSection, List _headerSectionFields,BuildContext context) async {
  var depdentIDs = _sectionSubSection.dependentIDs.split(",");
  depdentIDs.removeLast();
  List _subsectionDetails =
      _sectionSubSectionDetails[_sectionSubSection.subSectionID];
  if (_validatingPaidAndPayableAmount(_sectionSubSection, _subsectionDetails,_headerSectionFields,context)) {
    List<HideUnHide> _hideUnHideList = await DBHelper()
        .getHideUnHideList(_sectionSubSection.fieldDependencyID);
    if (_hideUnHideList.length > 0) {
      final _deptList = _hideUnHideList
          .where((e) => e.value == int.parse(_sectionSubSection.fieldValue))
          .toList();
      if (_deptList.length > 0) {
        for (final item in _subsectionDetails) {
          SectionSubSection _sectionDetails = item as SectionSubSection;
          final _list = _deptList
              .where(
                  (e) => e.deptFieldDeptID == _sectionDetails.fieldDependencyID)
              .toList();
          if (_list.length > 0) {
            _sectionDetails.isHide = false;
          } else {
            final _list = _hideUnHideList
                .where((e) =>
                    e.deptFieldDeptID == _sectionDetails.fieldDependencyID)
                .toList();
            if (_list.length > 0) {
              _sectionDetails.isHide = true;
            }
          }
          final globalKey = _sectionDetails.globalKey;
          final currentState = globalKey.currentState;
          if (currentState is TextBoxState) {
            currentState.updateState(_sectionDetails.isHide);
          } else if (currentState is DropDownWidgetState) {
            currentState.refreshIsDepdent(_sectionDetails.isHide);
          } else if (currentState is DatePickerState) {
            currentState.setRefreshState(_sectionDetails.isHide);
          } else if (currentState is ButtonWidgetState) {
            currentState.setRefreshState(_sectionDetails.isHide);
          } else if (currentState is CustomeLabelState) {
            currentState.refreshIsDepdent(_sectionDetails.isHide);
          } else if (currentState is LabelState) {
            currentState.refreshIsDepdent(_sectionDetails.isHide);
          } else if (currentState is CustomDocumentState) {}
        }
      }
    }
    if (_sectionSubSection.fieldDependencyID == 1692 ||
        _sectionSubSection.fieldDependencyID == 1701) {
      updatePaymentFields(
          _sectionSubSectionDetails, _sectionSubSection, _headerSectionFields);
    }
  }
}

bool _validatingPaidAndPayableAmount(
    SectionSubSection _sectionSubSection, List _subsectionDetails,List _headerSectionFields,BuildContext context)  {
  if (_sectionSubSection.fieldDependencyID == 1702) {
    SectionSubSection _payableAmtSectionDetails = _subsectionDetails
        .where((e) => e.fieldDependencyID == 1699)
        .toList()[0];
    SectionSubSection _paidAmtSectionDetails = _subsectionDetails
        .where((e) => e.fieldDependencyID == 1700)
        .toList()[0];
    if ((double.parse(
            _payableAmtSectionDetails.fieldValue.replaceAll(",", ""))) >
        (double.parse(_paidAmtSectionDetails.fieldValue.replaceAll(",", "")))) {
      Utility().showToastMessage(LabelConstant.kTotalPayingError);
      return false;
    }else{
      submitProposalPaymentOTPInfo(_headerSectionFields,context);
    }
  }
  return true;
}