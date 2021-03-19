import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/Fields/Button.dart';
import 'package:jiclapp/app_modals/Fields/CustomHeaderLabel.dart';
import 'package:jiclapp/app_modals/Fields/DropDown.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_modals/Fields/TextBox.dart';
import 'package:path_provider/path_provider.dart';
import 'DatePicker.dart';
import 'ImagePicker.dart';
import 'Label.dart';

class CustomDocument extends StatefulWidget {
  final _subSectionDetails;
  final Function _function;
  final _webRefNumber;
  CustomDocument(
      Key key, this._function, this._subSectionDetails, this._webRefNumber)
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CustomDocumentState(_subSectionDetails.isHide);
  }
}

class CustomDocumentState extends State<CustomDocument> {
  var isHide;
  CustomDocumentState(this.isHide);
  List<Map<String, dynamic>> _documentDetails = List();
  List<SectionSubSection> _fieldDetails = List();
  var filterList = [];
  var fieldData = [];
  var mediaDetails = {};
  var _selectedIndex = 0;
  int _documentCount = 0;
  bool _isUpdate = false;
  String _fieldValue = "";
  File imageURI;
  String selectedValue;

  void initState() {
    super.initState();
    setInitateValues();
  }

  void childCallBack(fieldValue) {
    widget._function(
        widget._subSectionDetails.sectionID,
        widget._subSectionDetails.subSectionID,
        widget._subSectionDetails.fieldID,
        fieldValue,
        widget._subSectionDetails.index);
  }

  void setInitateValues() async {
    Future.delayed(const Duration(milliseconds: 600), () async {
      List<ExpandCollapseData> _expandCollapseDetails =
          await DBHelper().getExpandCollapseMasterList();
      final _ecDetails = _expandCollapseDetails
          .where(
              (element) => element.fieldID == widget._subSectionDetails.fieldID)
          .toList();
      if (_ecDetails.length > 0) {
        List<SectionSubSection> _fieldMasterData = await DBHelper()
            .getFieldMasterDataWith(_ecDetails[0].fieldID,
                widget._subSectionDetails.sectionID, widget._webRefNumber);
        if (_fieldMasterData.length > 0) {
          _fieldDetails = _fieldMasterData;
          updateTheFiledValue();
        }
      }
    });
  }

  void updateTheFiledValue() {
    String fieldValue = "";
    final _sectionSubSection = widget._subSectionDetails as SectionSubSection;
    if (_isUpdate) {
      fieldValue = _fieldValue;
    } else {
      fieldValue = _sectionSubSection.fieldValue;
    }
    if (fieldValue.length > 0) {
      List _decodeDetails = List();
      if (json.decode(fieldValue) is List) {
        _decodeDetails = json.decode(fieldValue);
      } else {
        _decodeDetails = json.decode(json.decode(fieldValue));
      }
      if (_decodeDetails.length > 0) {
        _selectedIndex = 0;
      }
      List<Map<String, dynamic>> tempArray = List();
      var _fieldIndex = 0;
      for (final value in _decodeDetails) {
        if (_fieldIndex == 0) {
          var index = 0;
          for (final item in _fieldDetails) {
            item.fieldValue = value["$index"];
            index = index + 1;
          }
        }
        tempArray.add(value);
        _fieldIndex = _fieldIndex + 1;
      }
      _documentDetails = tempArray;
      _documentCount = _documentDetails.length;
      if (this.mounted) {
        setState(() {});
      }
    } else {
      _documentCount = 0;
      setState(() {});
    }
    if (!_isUpdate &&
        _sectionSubSection.fieldDependencyID == 1421 &&
        _sectionSubSection.fieldValue.length <= 0) {
      setInitDataForFamilyHistory(_sectionSubSection);
    }else if (_isUpdate &&
        _sectionSubSection.fieldDependencyID == 1421 &&
        _sectionSubSection.fieldValue.length <= 0 && selectedValue == "Spouse") {
      setInitDataForFamilyHistory(_sectionSubSection);
    } else if (!_isUpdate &&
        _sectionSubSection.fieldDependencyID == 1673 &&
        _sectionSubSection.fieldValue.length <= 0) {
      _addBtnTapped();
    }
    // else if(!_isUpdate && _sectionSubSection.fieldDependencyID == 1701 && _sectionSubSection.fieldValue.length <= 0){
    //     _addBtnTapped();
    // }
  }

  void setInitDataForFamilyHistory(SectionSubSection _sectionSubSection) {
    //1201,1202
    _documentCount = 2;
    for (var index = 0; index < _documentCount; index++) {
      Map<String, dynamic> _dependentDic = Map();
      for (var subIndex = 0; subIndex < _fieldDetails.length; subIndex++) {
        _dependentDic["$subIndex"] =
            returnRelationShipWithIndex(index, subIndex);
      }
      _documentDetails.add(_dependentDic);
    }
    _sectionSubSection.fieldValue = jsonEncode(_documentDetails);
    List<Map<String, dynamic>> tempArray = List();
    var _fieldIndex = 0;
    for (final value in _documentDetails) {
      if (_fieldIndex == 0) {
        var index = 0;
        for (final item in _fieldDetails) {
          item.fieldValue = value["$index"];
          index = index + 1;
        }
      }
      tempArray.add(value);
      _fieldIndex = _fieldIndex + 1;
    }
    _documentDetails = tempArray;
    _documentCount = _documentDetails.length;
    setState(() {});
  }

  returnRelationShipWithIndex(int index, int subIndex) {
    switch (index) {
      case 0:
        return (subIndex == 1) ? "1201" : "";
        break;
      case 1:
        return (subIndex == 1) ? "1202" : "";
        break;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    var _subSectionDetails = widget._subSectionDetails as SectionSubSection;
    return !isHide
        ? Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                (widget._subSectionDetails.fieldID != 1382)
                    ? Container(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: (_subSectionDetails.fieldDependencyID ==
                                      1673 ||
                                  _subSectionDetails.fieldDependencyID == 1701)
                              ? Container()
                              : RaisedButton(
                                  onPressed: () {
                                    _addBtnTapped();
                                  },
                                  child: Text(_subSectionDetails.placeHolder,
                                      style: TextStyle(fontSize: 16)),
                                  color: Colors.orange,
                                  textColor: Colors.white,
                                  elevation: 5,
                                ),
                        ),
                      )
                    : Container(),
                Container(
                    height: 60.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _documentCount,
                        itemBuilder: (context, listIndex) {
                          return GestureDetector(
                              onTap: () => {
                                    FocusScope.of(context).unfocus(),
                                    gestureTappedWithIndex(listIndex)
                                  },
                              child: _subSectionDetails.fieldDependencyID ==
                                      1673
                                  ? Container()
                                  : Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                          color: (listIndex == _selectedIndex)
                                              ? Colors.orange
                                              : Utility()
                                                  .returnContainerColorWithIndex(
                                                      Utility()
                                                          .returnThemColorIndex()),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.6),
                                                blurRadius: 8,
                                                offset: Offset(6.0, 6.0))
                                          ]),
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      margin: EdgeInsets.fromLTRB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Center(
                                        child: Text(
                                          "Type ${listIndex + 1}",
                                          textAlign: TextAlign.center,
                                          style: (listIndex == _selectedIndex)
                                              ? Utility()
                                                  .retuenWhilteTextStyle()
                                              : Utility()
                                                  .returnBusinssDetailsNormalTextStyle(),
                                        ),
                                      )));
                        })),
                Container(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: (_documentCount == 0) ? 0 : 1,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/selectbackground.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                            margin: EdgeInsets.all(5.0),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width -
                                        132.0,
                                    child: _returnDependentField(
                                        context, _subSectionDetails, index),
                                  ),
                                ),
                                Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    iconSize: 20,
                                    color: Colors.orange,
                                    onPressed: () {
                                      if (_subSectionDetails.isEditable ||
                                          (!_subSectionDetails.isEditable &&
                                              _subSectionDetails
                                                      .fieldDependencyID ==
                                                  1701)) {
                                        _documentCount = _documentCount - 1;
                                        _documentDetails
                                            .removeAt(_selectedIndex);
                                        setState(() {});
                                        childCallBack(
                                            jsonEncode(_documentDetails));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
              ],
            ),
          )
        : Container();
  }

  _returnDependentField(BuildContext context, _subSectionDetails, int index) {
    return new Opacity(
        opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: Container(
          height: 78.0 * _fieldDetails.length,
          padding: EdgeInsets.all(5.0),
          child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: _fieldDetails.length,
              itemBuilder: (BuildContext ctxt, int subIndex) {
                return Wrap(children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    child: _returnSubStateBody(_fieldDetails[subIndex]),
                    decoration: BoxDecoration(
                      color: returnContainerBackgroundColorWith(
                          _fieldDetails[subIndex]),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: returnShadowColorWithFields(
                                _fieldDetails[subIndex]),
                            blurRadius: 18,
                            offset: Offset(0.0, 6.0))
                      ],
                    ),
                  )
                ]);
              }),
        ));
  }

  _returnSubStateBody(SectionSubSection secSubSecDetails) {
    switch (secSubSecDetails.fieldType) {
      case "dropdown":
        return DropDownWidget(
            secSubSecDetails.globalKey, callBackFromChild, secSubSecDetails,"");
        break;
      case "textbox":
        return TextBox(
            secSubSecDetails.globalKey, callBackFromChild, secSubSecDetails);
        break;
      case "imagePicker":
        return MyImagePicker(secSubSecDetails.globalKey, callBackFromChild,
            secSubSecDetails, widget._webRefNumber);
        break;
      case "label":
        return Label(secSubSecDetails.globalKey, secSubSecDetails);
        break;
      case "numeric":
        return TextBox(
            secSubSecDetails.globalKey, callBackFromChild, secSubSecDetails);
        break;
      case "date":
        return DatePicker(
            secSubSecDetails.globalKey, callBackFromChild, secSubSecDetails);
        break;
      case "button":
        return ButtonWidget(secSubSecDetails.globalKey,
            _buttonActionWithSectionID, secSubSecDetails);
        break;
      case "customheaderlabel":
        return CustomHeaderLable(secSubSecDetails.globalKey, secSubSecDetails);
        break;
    }
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

//MARK:- ButtonAction
  void _buttonActionWithSectionID(SectionSubSection _sectionDetails) async {}

//MARK:- callBackFromChild
  Future<void> callBackFromChild(int sectionID, int subSectionId, int fieldID,
      fieldValue, int index) async {
    var _dependentDic = _documentDetails[_selectedIndex];
    if (fieldID == 1196) {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      String directoryPath =
          (documentsDirectory.path) + '/' + widget._webRefNumber + '/';
      String oldPath = directoryPath + fieldValue;
      final _tempFieldValue = "$_selectedIndex" + "_" + fieldValue;
      String newPath = directoryPath + _tempFieldValue;
      var _ = await moveFile(File(oldPath), newPath);
      final _item = _fieldDetails[2];
      final globalKey = _item.globalKey;
      _dependentDic["$index"] = _tempFieldValue;
      if (globalKey.currentState != null) {
        final currentState = globalKey.currentState as MyImagePickerState;
        currentState.updateImageViewWith(_tempFieldValue, widget._webRefNumber);
      }
      childCallBack(jsonEncode(_documentDetails));
    } else {
      _dependentDic["$index"] = fieldValue;
      childCallBack(jsonEncode(_documentDetails));
    }
  }

  Future<File> moveFile(File sourceFile, String newPath) async {
    try {
      return await sourceFile.rename(newPath);
    } catch (e) {
      final newFile = await sourceFile.copy(newPath);
      //  await sourceFile.delete();
      return newFile;
    }
  }

//MARK:- Gesture tapped
  Future<void> gestureTappedWithIndex(int index) async {
    _isUpdate = false;
    _selectedIndex = index;
    if (_documentDetails.length > 0) {
      var _dependentDic = _documentDetails[_selectedIndex];
      var _fieldindex = 0;
      for (final _item in _fieldDetails) {
        final globalKey = _item.globalKey;
        switch (_item.fieldType) {
          case "date":
            if (globalKey.currentState != null) {
              final currentState = globalKey.currentState as DatePickerState;
              currentState.updateVale(_dependentDic["$_fieldindex"]);
            }
            break;
          case "numeric":
            if (globalKey.currentState != null) {
              final currentState = globalKey.currentState as TextBoxState;
              currentState.refreshState(_dependentDic["$_fieldindex"], false);
            }
            break;
          case "textbox":
            if (globalKey.currentState != null) {
              final currentState = globalKey.currentState as TextBoxState;
              currentState.refreshState(_dependentDic["$_fieldindex"], false);
            }
            break;
          case "dropdown":
            if (globalKey.currentState != null) {
              final currentState =
                  globalKey.currentState as DropDownWidgetState;
              currentState.setUpdatedValue(
                  _dependentDic["$_fieldindex"], _item);
            }
            break;
          case "imagePicker":
            if (globalKey.currentState != null) {
              final currentState = globalKey.currentState as MyImagePickerState;
              currentState.updateImageViewWith(
                  _dependentDic["$_fieldindex"], widget._webRefNumber);
            }
            break;
          case "customheaderlabel":
            if (globalKey.currentState != null) {
              final currentState =
                  globalKey.currentState as CustomeHeaderLableState;
              currentState.updateCurrentState(_dependentDic["$_fieldindex"]);
            }
            break;
        }
        _fieldindex = _fieldindex + 1;
      }
      setState(() {});
    }
  }

// Future<void> updatePaymentDetails() async {
//      final fields = [1264,1272,1266,1267,1359,1264];
//     List<FieldResponse> _fieldResponse = await DBHelper().getFieldResponseDetails();
//     List<FieldResponse> _proposalResponse = _fieldResponse.where((element)=>element.webRefNumber == widget._webRefNumber).toList();
//     var index = 0;
//     if(_proposalResponse.length > 0){
//       for(final filedID in fields){
//           final sectionSubsection = _proposalResponse.where((element) => element.fieldDependencyID == filedID).toList()[0];
//           _documentDetails[0]["$index"] = sectionSubsection.fieldValue;
//            index = index + 1;
//       }
//       setState(() {});
//     }
// }

//MARK:- Button Action
  void _addBtnTapped() {
    _documentCount = _documentCount + 1;
    Map<String, dynamic> _dependentDic = Map();
    for (var i = 0; i < _fieldDetails.length; i++) {
      _dependentDic["$i"] = "";
    }
    _documentDetails.add(_dependentDic);
    setState(() {});
  }

  void refreshState(String value) {
    isHide = (value == "1") ? false : true;
    setState(() {});
  }

  void updateDocumentCount(int count) {
    isHide = (count == 0) ? true : false;
    _documentDetails = List();
    _documentCount = count;
    _selectedIndex = 0;
    for (var i = 0; i < _documentCount; i++) {
      Map<String, dynamic> _dependentDic = Map();
      for (var j = 0; j < _fieldDetails.length; j++) {
        _dependentDic["$j"] = "";
      }
      _documentDetails.add(_dependentDic);
    }
    setState(() {});
  }

  void updateDocumentWithDetails(String _tempFieldValue,String _selectedValue) {
      _isUpdate = (_selectedValue == "MainLife" && _tempFieldValue.length <= 0) ? false : true;
      _documentDetails = [];
      _fieldValue = _tempFieldValue;
      selectedValue = _selectedValue;
      setInitateValues();
  }
}
