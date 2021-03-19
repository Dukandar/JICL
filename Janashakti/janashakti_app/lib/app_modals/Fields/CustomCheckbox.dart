import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

class CustomCheckbox extends StatefulWidget {
  final _subSectionDetails;
  final Function _function;
  CustomCheckbox(Key key, this._function, this._subSectionDetails)
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CustomCheckboxState(_subSectionDetails.isHide);
  }
}

class CustomCheckboxState extends State<CustomCheckbox> with AutomaticKeepAliveClientMixin{
  bool isHide;
  bool _checkBoxBool = false;
  CustomCheckboxState(this.isHide);
  void childCallBack(String fieldValue) {
    widget._function(
        widget._subSectionDetails.sectionID,
        widget._subSectionDetails.subSectionID,
        widget._subSectionDetails.fieldID,
        fieldValue,
        widget._subSectionDetails.index);
  }

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
     super.build(context);
    var _subSectionDetails = widget._subSectionDetails as SectionSubSection;
    if (_subSectionDetails.fieldValue.length > 0 &&
        _subSectionDetails.subSectionID == 1019) {
      final _fieldValue = widget._subSectionDetails.fieldValue.split(",")[0];
      _checkBoxBool = (_fieldValue == "1") ? true : false;
    } else {
      _checkBoxBool = _subSectionDetails.fieldValue == "1" ? true : false;
    }
    return !isHide
        ? Container(
            // height: 40.0,
            width: MediaQuery.of(context).size.width,
            // color: Colors.yellow,
            child: Row(children: <Widget>[
              Container(
                height: 40.0,
                width: 40.0,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor:
                              (_subSectionDetails.index % 2 != 0)
                                  ? Colors.grey
                                  : Utility()
                                      .returnTextFieldBoarderColorWithIndex(
                                          Utility().returnThemColorIndex()),
                        ),
                        child: Checkbox(
                          checkColor: Colors.orange, // color of tick Mark
                          activeColor: Colors.grey,
                          value: _checkBoxBool,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxBool = value;
                              childCallBack(
                                  (_checkBoxBool == true) ? "1" : "0");
                            });
                          },
                        ))),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width - 135.0,
                  child: Text(
                    _subSectionDetails.fieldName,
                    style: (_subSectionDetails.index % 2 != 0)
                        ? Utility().returnNormalTextStyle()
                        : Utility().returnBusinssDetailsNormalTextStyle(),
                  ),
                ),
              )
            ]))
        : Container();
  }

  void refreshState(String value) {
    _checkBoxBool = value == "1" ? true : false;
    setState(() {});
  }

  void refreshIsDepdent(bool tempIsHide) {
    setState(() {
      if (tempIsHide) {
        isHide = true;
      } else {
        isHide = false;
      }
    });
  }
  @override
  bool get wantKeepAlive => true;
}
