import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Utility.dart';
import '../DBHelper.dart';
import '../MasterModals.dart';
import 'package:jiclapp/app_util/FormValidator.dart';

class DropDownWidget extends StatefulWidget {
  final _subSectionDetails;
  final _response;
  final Function _function;
  DropDownWidget(Key key, this._function, this._subSectionDetails,this._response)
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DropDownWidgetState(_subSectionDetails.isHide);
  }
}

class DropDownWidgetState extends State<DropDownWidget>
    with AutomaticKeepAliveClientMixin {
  var isHide;
  DropDownWidgetState(this.isHide);
  final TextEditingController _textEditingController = TextEditingController();
  var filterList = [];
  var fieldData = [];
  var depdentID = "";
  void childCallBack(String fieldValue) {
    widget._function(
        widget._subSectionDetails.sectionID,
        widget._subSectionDetails.subSectionID,
        widget._subSectionDetails.fieldID,
        fieldValue,
        widget._subSectionDetails.index);
  }

  void initState() {
    super.initState();
    setFieldValue();
  }

  setFieldValue() async {
    if (widget._subSectionDetails.fieldValue.length > 0) {
      var fieldValue = "";
      if (widget._subSectionDetails.subSectionID == 1019) {
        fieldValue = widget._subSectionDetails.fieldValue.split(",")[0];
      } else {
        fieldValue = widget._subSectionDetails.fieldValue;
      }
       if(fieldValue == "5"){
        print("");
      }
      List<FieldData> fieldDataDetails = await DBHelper()
          .getFieldDataWithFieldDataID(
              fieldValue, widget._subSectionDetails.fieldID);
      if (fieldDataDetails.length > 0) {
        final fieldDataDetail = fieldDataDetails[0];
        _textEditingController.text = fieldDataDetail.fieldValue;
      } else {
        _textEditingController.text = fieldValue;
      }
    } else {
      _textEditingController.text = widget._subSectionDetails.fieldValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return new GestureDetector(
        onTap: () => {
              FocusScope.of(context).unfocus(),
              if (_subSectionDetails.isEditable)
                {
                  _getFiedData(
                      _subSectionDetails.fieldID, context, _subSectionDetails)
                }
            },
        child: !isHide
            ? Container(
                child: new Opacity(
                opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
                child: new Row(children: <Widget>[
                  Flexible(
                      child: Container(
                    width: MediaQuery.of(context).size.width - 64.0,
                    child: returnDropDownWith(_subSectionDetails),
                  )),
                  _subSectionDetails.isManditory == true
                      ? Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
                          child: Icon(Icons.star,
                              color: Colors.red,
                              size:
                                  10.0), //(_subSectionDetails.isMandatory == true) ? Icon(Icons.star, color: Colors.red, size: 10.0) : Icon(Icons.star, size: 0.0),
                        )
                      : Container(),
                ]),
              ))
            : Container());
  }

  returnDropDownWith(SectionSubSection _subSectionDetails) {
    return AbsorbPointer(
      child: Container(
          child: new Theme(
              data: new ThemeData(
                  hintColor: Utility().returnPlaceHolderColorWithIndex(
                      Utility().returnThemColorIndex())),
              child: new TextFormField(
                controller: _textEditingController,
                style: Utility().returnBusinssDetailsNormalTextStyle(),
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: _subSectionDetails.placeHolder,
                    labelStyle: Utility().returnLabelStyle(),
                    hintText: _subSectionDetails.placeHolder,
                    hintStyle: Utility().returnHintStyle(),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                        color: Utility().returnIconColor()),
                    prefixIcon: (isFieldID(_subSectionDetails.fieldID))
                        ? null
                        : ImageIcon(
                            AssetImage(
                                "assets/images/${_subSectionDetails.fieldID}.png"),
                            size: 10.0,
                            color: Colors.orange),
                    errorStyle: TextStyle(fontSize: 14.0)),
                validator: (value) {
                  return FormValidator()
                      .validateInputText(value, _subSectionDetails);
                },
              ))),
    );
  }

  bool isFieldID(int fieldID) {
    final fieldAray = [
      1029,
      1016,
      1017,
      1018,
      1050,
      1081,
      1156,
      1157,
      1159,
      1148,
      1150
    ];
    if (fieldAray.contains(fieldID)) {
      return true;
    }
    return false;
  }

//MARK:-
  _returnDialogWithBuildContext(
      BuildContext context, List<FieldData> fieldData, String title) {
    showDialog(
        context: context,
        builder: (BuildContext ctxt) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: StatefulBuilder(
                  builder: (BuildContext altCntx, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 168.0,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              // maxLines: 2,
                              style: Utility().retuenLargeTextStyle(),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            child: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                iconSize: 20,
                                icon: Icon(
                                  Icons.close,
                                ),
                                onPressed: () => Navigator.pop(altCntx),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: LabelConstant.kSearch,
                          //add icon outside input field
                          icon: Icon(Icons.search),
                        ),
                        onChanged: (data) {
                          filterList = [];
                          fieldData.forEach((element) {
                            if (element.fieldValue
                                .toLowerCase()
                                .contains(data.toLowerCase())) {
                              filterList.add(element);
                            }
                          });
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      height: (MediaQuery.of(context).size.height * 0.7) - 10.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: filterList
                            .map((data) => ListTile(
                                title: Text(
                                    (data.fieldValue as String).toUpperCase()),
                                onTap: () => {selectedData(data, altCntx)}))
                            .toList(),
                      ),
                    ),
                  ],
                );
              }));
        });
  }

//MARK:- Search
  searchOperation(String searchText) {}

//MARK: Click
  selectedData(FieldData fieldData, BuildContext context) {
    _textEditingController.text = fieldData.fieldValue;
    childCallBack(_returnFieldValue(fieldData));
    Navigator.of(context).pop();
  }

  String _returnFieldValue(FieldData _fieldData) {
    switch (widget._subSectionDetails.fieldDependencyID) {
      case 1690:
        return _fieldData.fieldValue;
      case 1691:
        return _fieldData.fieldValue;
      default:
        return _fieldData.fieldDataID.toString();
    }
  }

  _getFiedData(int fieldId, BuildContext context, SectionSubSection _subSectionDetails) async {
    if (fieldId == 1017 || fieldId == 1018) {
      List<FieldData> fieldData =
          await DBHelper().getFieldDataWithFieldDepdentID(depdentID, fieldId);
      if (fieldData.length > 0) {
        fieldData = fieldData;
        filterList = fieldData;
        if (filterList.length > 0) {
          _returnDialogWithBuildContext(
              context, filterList, _subSectionDetails.fieldName);
        }
      }
    }else if(_subSectionDetails.fieldDependencyID == 1238){
      final _decodeResponse = jsonDecode(widget._response);
      final _lstPolicyTerm = _decodeResponse["lstPrefMode"];
       List<FieldData> fieldData = List();
      for(final item in _lstPolicyTerm){
        fieldData.add(FieldData(
          dataID : 1000,
          fieldId : _subSectionDetails.fieldID,
          fieldValue : item["Text"],
          fieldDataID :  item["Value"],
          fieldDepdentID : ""
        ));
      }
       fieldData = fieldData;
       filterList = fieldData;
       if (filterList.length > 0) {
        _returnDialogWithBuildContext(
            context, filterList, _subSectionDetails.fieldName);
      }
    }else if(_subSectionDetails.fieldDependencyID == 1235){
      final _decodeResponse = jsonDecode(widget._response);
      final _lstPolicyTerm = _decodeResponse["LstPolicyTerm"];
       List<FieldData> fieldData = List();
      for(final item in _lstPolicyTerm){
        fieldData.add(FieldData(
          dataID : 1000,
          fieldId : _subSectionDetails.fieldID,
          fieldValue : item["Text"],
          fieldDataID : item["Value"],
          fieldDepdentID : ""
        ));
      }
       fieldData = fieldData;
       filterList = fieldData;
       if (filterList.length > 0) {
        _returnDialogWithBuildContext(
            context, filterList, _subSectionDetails.fieldName);
      }
    }
     else {
      List<FieldData> fieldData =
          await DBHelper().getFieldDataWithField(fieldId);
      fieldData = fieldData;
      filterList = fieldData;
      if (filterList.length > 0) {
        _returnDialogWithBuildContext(
            context, filterList, _subSectionDetails.fieldName);
      }
    }
  }

  Future<void> setUpdatedFiedValueWithFieldID(int fieldID, String value) async {
    List<FieldData> fieldDataDetails =
        await DBHelper().getFieldDataWithFieldDataID(value.replaceAll(" ",""), fieldID);
    if (fieldDataDetails.length > 0) {
      final fieldDataDetail = fieldDataDetails[0];
      _textEditingController.text = fieldDataDetail.fieldValue;
    } else {
      _textEditingController.text = value;
    }
  }

  Future<void> setUpdatedValue(
      String value, SectionSubSection _sectionSubSection) async {
    _sectionSubSection = _sectionSubSection;
    setState(() {});
    List<FieldData> fieldDataDetails = await DBHelper()
        .getFieldDataWithFieldDataID(value, _sectionSubSection.fieldID);
    if (fieldDataDetails.length > 0) {
      final fieldDataDetail = fieldDataDetails[0];
      _textEditingController.text = fieldDataDetail.fieldValue;
    } else {
      _textEditingController.text = value;
    }
  }

  void refreshState(String value) {
    depdentID = value;
  }

  void refreshIsDepdent(bool tempIsHide) {
    isHide = tempIsHide;
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
