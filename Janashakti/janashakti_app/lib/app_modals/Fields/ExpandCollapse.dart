import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/Fields/Button.dart';
import 'package:jiclapp/app_modals/Fields/CustomCheckbox.dart';
import 'package:jiclapp/app_modals/Fields/CustomDocument.dart';
import 'package:jiclapp/app_modals/Fields/CustomDropDown.dart';
import 'package:jiclapp/app_modals/Fields/CustomSelection.dart';
import 'package:jiclapp/app_modals/Fields/CustomUpload.dart';
import 'package:jiclapp/app_modals/Fields/CustomeSpinner.dart';
import 'package:jiclapp/app_modals/Fields/DatePicker.dart';
import 'package:jiclapp/app_modals/Fields/DropDown.dart';
import 'package:jiclapp/app_modals/Fields/ImagePicker.dart';
import 'package:jiclapp/app_modals/Fields/Label.dart';
import 'package:jiclapp/app_modals/Fields/RadioButton.dart';
import 'package:jiclapp/app_modals/Fields/Signature.dart';
import 'package:jiclapp/app_modals/Fields/TextArea.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_modals/Fields/TextBox.dart';

class ExpandCollapse extends StatefulWidget {
  final _subSectionDetails;
  final Function _function;
  final _webRefNumber;
  ExpandCollapse(
      Key key, this._function, this._subSectionDetails, this._webRefNumber)
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ExpandCollapseState(_subSectionDetails.isHide);
  }
}

class ExpandCollapseState extends State<ExpandCollapse>
    with AutomaticKeepAliveClientMixin {
  var isHide;
  ExpandCollapseState(this.isHide);
  List<FieldMaster> haederDetails = List<FieldMaster>();
  Map<int, dynamic> _subSectionDetails = Map<int, dynamic>();
  List<bool> isExpandedList = List();
  String _selectedValue = "MainLife";
  List _headerDetailsList;
  void childCallBack(fieldValue) {
    widget._function(
        widget._subSectionDetails.sectionID,
        widget._subSectionDetails.subSectionID,
        widget._subSectionDetails.fieldID,
        fieldValue,
        widget._subSectionDetails.index);
  }

  void initState() {
    super.initState();
    setInitateValues();
  }

  setInitateValues() async {
    List<FieldMaster> fieldMasterData = await DBHelper().getFieldMaster();
    List<ExpandCollapseData> expandCollapseDetails =
        await DBHelper().getExpandCollapseMasterList();
    final tempHeaderDetails = expandCollapseDetails
        .where((element) =>
            element.fieldID == widget._subSectionDetails.fieldID &&
            element.fieldDependencyID ==
                widget._subSectionDetails.fieldDependencyID)
        .toList();
    if (tempHeaderDetails.length > 0) {
      for (var item in tempHeaderDetails) {
        final fldMasterDetails = fieldMasterData
            .where((element) => element.fieldId == item.ecFieldID)
            .toList();
        if (fldMasterDetails.length > 0) {
          haederDetails.add(fldMasterDetails[0]);
        }
      }
      var index = 0;
      await Future.forEach(tempHeaderDetails, (str) async {
        final detail = tempHeaderDetails[index];
        List<SectionSubSection> fieldMasterData = await DBHelper()
            .getFieldMasterDataWith(
                detail.ecFieldID, detail.fieldID, widget._webRefNumber);
        if (fieldMasterData.length > 0) {
          _subSectionDetails[detail.ecFieldID] = fieldMasterData;
        }
        index++;
      });
    }
    updatePreviousInsureDetails();
  }

//MARK:- Update previous insure details
  void updatePreviousInsureDetails() {
    if (widget._subSectionDetails.fieldDependencyID == 1352) {
      final _list = _subSectionDetails[1179] as List;
      final _policyDetials = _list[1] as SectionSubSection;
      if (_policyDetials.fieldValue == "1") {
        for (int i = 2; i < 9; i++) {
          var _details = _list[i] as SectionSubSection;
          _details.isHide = false;
        }
      }
    }
    updateFiledValuesWith(0, false);
  }

  void updateFiledValuesWith(int segmentIdex, bool isUpdate) {
    //Updated the FiledValue
    if ((widget._subSectionDetails as SectionSubSection).fieldValue.length >
        0) {
      final _tempSectionSubSection =
          (widget._subSectionDetails as SectionSubSection);
      if (_tempSectionSubSection.fieldDependencyID == 1352) {
        final item = _tempSectionSubSection.fieldValue.split("@")[segmentIdex];
        var mainIndex = 0;
        // for(final item in tempArray){
        if (item.length > 0) {
          final _decodeData = jsonDecode(item);
          final keys = _decodeData.keys;
          for (final key in keys) {
            final listDetails = (_decodeData[key]).split("#");
            var index = 0;
            for (final item in listDetails) {
              ((_subSectionDetails[int.parse(key)] as List)[index]
                      as SectionSubSection)
                  .fieldValue = item;
              index = index + 1;
            }
            // }
            mainIndex = mainIndex + 1;
          }
        } else {
          final sectionKeys = _subSectionDetails.keys;
          for (final sectionKey in sectionKeys) {
            final details = _subSectionDetails[sectionKey];
            var index = 0;
            for (final _ in details) {
              ((_subSectionDetails[int.parse("$sectionKey")] as List)[index]
                      as SectionSubSection)
                  .fieldValue = "";
              index = index + 1;
            }
          }
        }
      } else {
        final _decodeData = jsonDecode(_tempSectionSubSection.fieldValue);
        final keys = _decodeData.keys;
        for (final key in keys) {
          final listDetails = (_decodeData[key]).split("#");
          var index = 0;
          for (final item in listDetails) {
            ((_subSectionDetails[int.parse(key)] as List)[index]
                    as SectionSubSection)
                .fieldValue = item;
            index = index + 1;
          }
        }
      }
    }
    //isExpanded init
    for (final _ in haederDetails) {
      isExpandedList.add(false);
    }
    if (isUpdate) {
      updateFileds();
    } else {
      setHideUnHideDependent();
    }
    if (haederDetails.length > 0) {
      if (_selectedValue.toLowerCase().contains("child")) {
        _headerDetailsList = [];
        _headerDetailsList.add(haederDetails[3]);
        _headerDetailsList.add(haederDetails[4]);
      } else {
        _headerDetailsList = haederDetails;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Container(
      child: !isHide
          ? new ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount:
                  (_headerDetailsList != null) ? _headerDetailsList.length : 0,
              itemBuilder: (BuildContext ctxt, int subIndex) {
                return Container(
                    margin: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orange,
                    child: ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          isExpandedList[subIndex] = !isExpandedList[subIndex];
                          setState(() {});
                        },
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Theme(
                                data: Theme.of(context)
                                    .copyWith(cardColor: Colors.orange),
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                      _headerDetailsList[subIndex].fieldName,
                                      style: Utility()
                                          .returnExpansionHeaderTextStyle()),
                                ),
                              );
                            },
                            body: new ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _subSectionDetails[
                                        _headerDetailsList[subIndex].fieldId]
                                    .length,
                                itemBuilder:
                                    (BuildContext ctxt, int itemIndex) {
                                  return _buildExpandableContent(
                                      _subSectionDetails[
                                          _headerDetailsList[subIndex].fieldId],
                                      itemIndex);
                                }),
                            isExpanded: (isExpandedList.length > 0)
                                ? isExpandedList[subIndex]
                                : false,
                          ),
                        ]));
              },
            )
          : Container(),
    );
  }

  _buildExpandableContent(List list, int subIndex) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity, //list[subIndex].isHide ? 0.0 : ,
      ),
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: _returnSubStateBody(list[subIndex]),
      decoration: BoxDecoration(
        color: returnContainerBackgroundColorWith(list[subIndex]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: returnShadowColorWithFields(list[subIndex]),
              blurRadius: 18,
              offset: Offset(0.0, 6.0))
        ],
      ),
    );
  }

  returnContainerBackgroundColorWith(SectionSubSection secSubSecDetails) {
    switch (secSubSecDetails.fieldType) {
      case "customelabel":
        return Colors.orange;
        break;
      case "button":
        return Colors.transparent;
        break;
      case "label":
        return Colors.transparent;
      default:
        return Utility()
            .returnContainerColorWithIndex(Utility().returnThemColorIndex());
        break;
    }
  }

  returnShadowColorWithFields(SectionSubSection secSubSecDetails) {
    switch (secSubSecDetails.fieldType) {
      case "customelabel":
        return Colors.transparent;
        break;
      case "label":
        return Colors.transparent;
        break;
      case "button":
        return Colors.transparent;
        break;
      default:
        return Colors.grey.withOpacity(0.8);
        break;
    }
  }

  _returnSubStateBody(SectionSubSection _secSubSecDetails) {
    switch (_secSubSecDetails.fieldType) {
      case "dropdown":
        return DropDownWidget(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails,"");
        break;
      case "textarea":
        return TextArea(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "label":
        return Label(_secSubSecDetails.globalKey, _secSubSecDetails);
        break;
      case "customDocument":
        return CustomDocument(
            _secSubSecDetails.globalKey,
            callBackFromChildWithMultipleValues,
            _secSubSecDetails,
            widget._webRefNumber);
        break;
      case "customCheckbox":
        return CustomCheckbox(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "signature":
        return SignatureWidget(_secSubSecDetails.globalKey, callBackFromChild,
            widget._webRefNumber, _secSubSecDetails);
        break;
      case "imagePicker":
        return MyImagePicker(_secSubSecDetails.globalKey, callBackFromChild,
            _secSubSecDetails, widget._webRefNumber);
        break;
      case "customUpload":
        return CustomUpload(_secSubSecDetails.globalKey, callBackFromChild,
            _secSubSecDetails, widget._webRefNumber);
        break;
      case "radiogroup":
        return RadioButton(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "textbox":
        return TextBox(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "numeric":
        return TextBox(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "customspinner":
        return CustomeSpinner(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "customedropdown":
        return CustomDropDownWidget(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "customselection":
        return CustomSelectionWidget(
            _secSubSecDetails.globalKey,
            callBackFromChildWithMultipleValues,
            _secSubSecDetails,
            widget._webRefNumber);
        break;
      case "date":
        return DatePicker(
            _secSubSecDetails.globalKey, callBackFromChild, _secSubSecDetails);
        break;
      case "button":
        return ButtonWidget(_secSubSecDetails.globalKey,
            _buttonActionWithSectionID, _secSubSecDetails);
        break;
      case "customheaderlabel":
        return CustomeLabel(_secSubSecDetails.globalKey, _secSubSecDetails);
    }
  }

  //MARK:- ButtonAction
  void _buttonActionWithSectionID(SectionSubSection _sectionDetails) async {
    _sectionDetails.fieldValue = "1";
    childCallBack(_sectionDetails.fieldDependencyID.toString());
    // hideUnHideFileds(_sectionDetails);
  }

  //MARK:- callBackFromChild
  void callBackFromChild(
      int sectionID, int subSectionId, int fieldID, fieldValue, int index) {
    var list = _subSectionDetails[subSectionId] as List;
    var _tempSubSectionDetails = list[index] as SectionSubSection;
    _tempSubSectionDetails.fieldValue = fieldValue;
    final encodeData = returnFieldValue();
    childCallBack(encodeData);
    if (_tempSubSectionDetails.isDependent) {
      updateDepdentFieldWithFieldId(_tempSubSectionDetails, fieldID,
          subSectionId, fieldValue, false, list);
    }
  }

  void callBackFromChildWithMultipleValues(
      int sectionID, int subSectionId, int fieldID, fieldValue, int index) {
    var list = _subSectionDetails[subSectionId] as List;
    var _tempSubSectionDetails = list[index] as SectionSubSection;
    _tempSubSectionDetails.fieldValue = jsonEncode(fieldValue);
    final encodeData = returnFieldValue();
    childCallBack(encodeData);
  }

  returnFieldValue() {
    Map<String, String> _mapDetails = Map();
    final keys = _subSectionDetails.keys;
    for (final key in keys) {
      final details = _subSectionDetails[key] as List;
      List _listDetails = List();
      for (final item in details) {
        final _tempSectionSubsection = item as SectionSubSection;
        _listDetails.add(_tempSectionSubsection.fieldValue);
      }
      _mapDetails["$key"] = _listDetails.join("#");
    }
    return _mapDetails;
  }

//MARK:- return index
  returnIndexWithField(
      int fieldDependencyID, List<SectionSubSection> _sectionDetails) {
    if (_sectionDetails.length > 0) {
      for (var index = 0; index < _sectionDetails.length; index++) {
        final _value = _sectionDetails[index];
        if (_value.fieldDependencyID == fieldDependencyID) {
          return index;
        }
      }
    }
  }

//MARK:- set the hide and unhide depdendent
  void setHideUnHideDependent() {
    _subSectionDetails.forEach((key, value) {
      for (final item in value) {
        final deptSectionSubSection = item as SectionSubSection;
        switch (deptSectionSubSection.fieldDependencyID) {
          case 1666:
            final index = returnIndexWithField(1396, value);
            if (index != null) {
              var _tempSectionSubSection = value[index] as SectionSubSection;
              deptSectionSubSection.isHide =
                  (_tempSectionSubSection.fieldValue == "0") ? false : true;
            }
            break;
          case 1397:
            final index = returnIndexWithField(1396, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1399:
            final index = returnIndexWithField(1398, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1401:
            final index = returnIndexWithField(1400, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1415:
            final index = returnIndexWithField(1414, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1417:
            final index = returnIndexWithField(1416, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1419:
            final index = returnIndexWithField(1418, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1430:
            final index = returnIndexWithField(1429, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1432:
            final index = returnIndexWithField(1431, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1434:
            final index = returnIndexWithField(1433, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1434:
            final index = returnIndexWithField(1433, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1436:
            final index = returnIndexWithField(1435, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1438:
            final index = returnIndexWithField(1437, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1440:
            final index = returnIndexWithField(1439, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1442:
            final index = returnIndexWithField(1441, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1444:
            final index = returnIndexWithField(1443, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1446:
            final index = returnIndexWithField(1445, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1449:
            final index = returnIndexWithField(1448, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
          case 1451:
            final index = returnIndexWithField(1450, value);
            var _tempSectionSubSection = value[index] as SectionSubSection;
            deptSectionSubSection.isHide =
                (_tempSectionSubSection.fieldValue == "1") ? false : true;
            break;
            break;
          default:
        }
      }
    });
     setState(() {});
  }

//Dept fields
  Future<void> updateDepdentFieldWithFieldId(
      SectionSubSection sectionSubSection,
      int fieldID,
      int subSectionId,
      String fieldValue,
      bool isContinue,
      List<SectionSubSection> list) async {
    var depdentIDs = sectionSubSection.dependentIDs.split(",");
    depdentIDs.removeLast();
      if (depdentIDs.length > 0) {
        for (final id in depdentIDs) {
          final index = returnIndexWithField(int.parse(id), list);
          if (index != null) {
            final deptSectionSubSection = list[index];
            final globalKey = deptSectionSubSection.globalKey;
            if (globalKey.currentState != null) {
              final currentState = globalKey.currentState;
              if (currentState is TextBoxState) {
                final _fieldValue =
                    (deptSectionSubSection.fieldDependencyID == 1666 ||
                            deptSectionSubSection.fieldDependencyID == 1465)
                        ? ((fieldValue == "0") ? "1" : "0")
                        : fieldValue;
                currentState.refreshState(_fieldValue, true);
                currentState.updateValue(deptSectionSubSection.fieldValue);
              } else if (currentState is CustomSelectionState) {
                currentState.refreshIsDepdent(fieldValue, fieldID);
              } else if (currentState is CustomDropDownState) {
                currentState
                    .refreshIsDepdent((fieldValue == "1") ? false : true);
              } else if (currentState is CustomDocumentState) {
                currentState.refreshState(fieldValue);
              } else if (currentState is DropDownWidgetState) {
                currentState
                    .refreshIsDepdent((fieldValue == "1") ? false : true);
              }
            }
          }
        }
    }
  }

  Future<void> updateFileds() async {
    final sectionKeys = _subSectionDetails.keys;
    var index = 0;
    await Future.forEach(sectionKeys, (element) async {
      final details = _subSectionDetails[element];
      await Future.forEach(details, (item) async {
        final _tempSectionSubsection = item as SectionSubSection;
        final globalKey = _tempSectionSubsection.globalKey;
        if (_tempSectionSubsection.isDependent) {
          updateDepdentFieldWithFieldId(
              _tempSectionSubsection,
              _tempSectionSubsection.fieldID,
              _tempSectionSubsection.subSectionID,
              _tempSectionSubsection.fieldValue,
              false,
              details);
        }
        switch (_tempSectionSubsection.fieldType) {
          case "customDocument":
            final tempState = globalKey.currentState as CustomDocumentState;
            if (tempState != null) {
              tempState
                  .updateDocumentWithDetails(_tempSectionSubsection.fieldValue,_selectedValue);
            }
            break;
          case "customspinner":
            if (globalKey != null) {
              final tempState = globalKey.currentState as CustomeSpinnerState;
              if (tempState != null) {
                tempState.updateStateWith(_tempSectionSubsection.fieldValue);
              }
            }
            break;
          case "dropdown":
            if (globalKey != null) {
              final tempState = globalKey.currentState as DropDownWidgetState;
              if (tempState != null) {
                tempState.setUpdatedFiedValueWithFieldID(
                    _tempSectionSubsection.fieldID,
                    _tempSectionSubsection.fieldValue);
              }
            }
            break;
          case "textarea":
            if (globalKey != null) {
              final tempState = globalKey.currentState as TextAreaState;
              tempState.refreshValue(_tempSectionSubsection.fieldValue);
            }
            break;
          case "customCheckbox":
            if (globalKey != null) {
              final tempState = globalKey.currentState as CustomCheckboxState;
              tempState.refreshState(_tempSectionSubsection.fieldValue);
            }
            break;
          case "radiogroup":
            if (globalKey != null) {
              final tempState = globalKey.currentState as RadioButtonState;
              if (tempState != null) {
                tempState.updatecurrentTimeValue(
                    (_tempSectionSubsection.fieldValue.length > 0)
                        ? ((_tempSectionSubsection.fieldValue == "0") ? 0 : 1)
                        : 0);
                if (_tempSectionSubsection.isDependent) {
                  if (index + 1 < details.length) {
                    final _prevTempSectionSubsection =
                        details[index + 1] as SectionSubSection;
                    if (_prevTempSectionSubsection.globalKey.currentState
                        is TextBoxState) {
                      final tempState = _prevTempSectionSubsection
                          .globalKey.currentState as TextBoxState;
                      tempState.refreshIsDepdent(
                          _tempSectionSubsection.fieldValue == "1"
                              ? false
                              : true);
                    }
                  }
                }
              }
            }
            break;
          case "textbox":
            if (globalKey != null) {
              final tempState = globalKey.currentState as TextBoxState;
              if (tempState != null) {
                tempState.refreshState(_tempSectionSubsection.fieldValue, true);
              }
            }
            break;
          default:
            break;
        }
      });
      index = index + 1;
    });
  }

  void updateState(int segmentIndex, String selectedValue) {
    _selectedValue = selectedValue;
    updateFiledValuesWith(segmentIndex, true);
  }

  @override
  bool get wantKeepAlive => true;
}
