import 'package:flutter/services.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';
import '../DBHelper.dart';
import '../MasterModals.dart';
import 'package:intl/intl.dart';

class TextBox extends StatefulWidget {
  final _subSectionDetails;
  final Function _function;
  TextBox(Key key, this._function, this._subSectionDetails) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TextBoxState(_subSectionDetails.isHide);
  }
}

class TextBoxState extends State<TextBox> with AutomaticKeepAliveClientMixin {
  var isHide;
  TextBoxState(this.isHide);
  final TextEditingController _textEditingController = TextEditingController();
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(LabelConstant.kLocale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: LabelConstant.kLocale)
          .currencySymbol;
  FocusNode _focusNode;
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
    // Start listening to changes.
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (widget._subSectionDetails.fieldType == "numeric") {
          if ((widget._subSectionDetails.fieldValue == "0")) {
            _textEditingController.clear();
          } else if (_textEditingController.text.length > 0) {
            _textEditingController.text =
                '${_formatNumber(_textEditingController.text.replaceAll(',', ''))}';
          }
        }
      }
    });
    setFieldValue();
    // Start listening to changes.
    _textEditingController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    // if(_textEditingController.text.length <= 0 && (widget._subSectionDetails.fieldType == "numeric")){
    //   _textEditingController.text = "0";
    // }
  }

  setFieldValue() async {
    if (widget._subSectionDetails.fieldValue.length > 0 &&
        widget._subSectionDetails.fieldDependencyID == 1233 || widget._subSectionDetails.fieldDependencyID == 1285) {
      List<FieldData> fieldDataDetails = await DBHelper()
          .getFieldDataWithFieldDataID(
              widget._subSectionDetails.fieldValue, (widget._subSectionDetails.fieldDependencyID == 1285) ? 1029 : 1081);
      if (fieldDataDetails.length > 0) {
        final fieldDataDetail = fieldDataDetails[0];
        childCallBack(fieldDataDetail.fieldValue);
        _textEditingController.text = fieldDataDetail.fieldValue;
      } else {
        _textEditingController.text =
            (widget._subSectionDetails.fieldValue.length > 0)
                ? widget._subSectionDetails.fieldValue
                : "";
      }
    } else if (widget._subSectionDetails.fieldValue.length > 0 &&
        widget._subSectionDetails.subSectionID == 1019) {
      final string = widget._subSectionDetails.fieldValue.split(",")[0];
      _textEditingController.text = string;
    } else {
      if (widget._subSectionDetails.fieldType == "numeric" &&
          widget._subSectionDetails.fieldValue.length > 0) {
        _textEditingController.text =
            (widget._subSectionDetails.fieldValue.length > 0)
                ? widget._subSectionDetails.fieldValue
                : "";
      } else {
        _textEditingController.text =
            (widget._subSectionDetails.fieldValue.length > 0)
                ? widget._subSectionDetails.fieldValue
                : "";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !isHide
        ? Container(
            child: new Opacity(
            opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      width: MediaQuery.of(context).size.width - 64.0,
                      child: new Theme(
                        data: new ThemeData(
                            hintColor: Utility()
                                .returnPlaceHolderColorWithIndex(
                                    Utility().returnThemColorIndex())),
                        child: new TextFormField(
                            focusNode: _focusNode,
                            inputFormatters: (_subSectionDetails.fieldType ==
                                    "numeric"
                                ? [NumericTextFormatter()]
                                :
                                // ignore: deprecated_member_use
                                (_subSectionDetails.fieldType == "emailID"
                                    ? [
                                        WhitelistingTextInputFormatter(
                                            RegExp("[a-z A-Z á-ú Á-Ú 0-9 @ .]"))
                                      ]
                                    :
                                    // ignore: deprecated_member_use
                                    (_subSectionDetails.fieldID == 1001 ||
                                            _subSectionDetails.fieldID == 1002)
                                        ? [
                                            WhitelistingTextInputFormatter(
                                                RegExp("[a-z A-Z á-ú Á-Ú]"))
                                          ]
                                        : [
                                            WhitelistingTextInputFormatter(
                                                RegExp("[a-z A-Z á-ú Á-Ú 0-9]"))
                                          ])),
                            controller: _textEditingController,
                            readOnly:
                                (_subSectionDetails.isEditable) ? false : true,
                            keyboardType:
                                returnKeyBoardType(_subSectionDetails),
                            style:
                                Utility().returnBusinssDetailsNormalTextStyle(),
                            maxLength: _returnMaxLength(_subSectionDetails),
                            autofocus: false,
                            decoration: InputDecoration(
                                counterText: '',
                                counterStyle: TextStyle(fontSize: 0),
                                prefixText: _currency,
                                labelText: _subSectionDetails.placeHolder,
                                labelStyle: Utility().returnLabelStyle(),
                                prefixIcon: (isFieldID(
                                        _subSectionDetails.fieldID))
                                    ? null
                                    : ImageIcon(
                                        //1371 fieldDependencyID
                                        //(_subSectionDetails.fieldDependencyID == 1371) ? 'ic_premiumTotalImg' : _subSectionDetails.fieldDependencyID
                                        AssetImage(
                                            "assets/images/${(_subSectionDetails.fieldDependencyID == 1656) ? "ic_premiumTotalImg" : _subSectionDetails.fieldID}.png"),
                                        size: 10.0,
                                        color: Colors.orange),
                                border: InputBorder.none,
                                hintText: _subSectionDetails.placeHolder,
                                hintStyle: Utility().returnHintStyle(),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                                errorStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: Theme.of(context).errorColor)),
                            validator: (value) {
                              if (_subSectionDetails.fieldID == 1027 ||
                                  _subSectionDetails.fieldID == 1115) {
                                return FormValidator()
                                    .validateNICNo(value, _subSectionDetails);
                              } else {
                                return FormValidator().validateInputText(
                                    value, _subSectionDetails);
                              }
                            },
                            onChanged: (text) {
                              if (_subSectionDetails.fieldType == "numeric") {
                                text = (text.length > 0)
                                    ? '${_formatNumber(text.replaceAll(',', ''))}'
                                    : text;
                              }
                              childCallBack(
                                  (_subSectionDetails.fieldType == "emailID")
                                      ? text.toLowerCase()
                                      : text);
                            }),
                      )),
                ),
                //new Spacer(),
                _subSectionDetails.isManditory == true
                    ? Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
                        child: Icon(Icons.star, color: Colors.red, size: 10.0),
                      )
                    : Container(),
              ],
            ),
          ))
        : Container();
  }

  int _returnMaxLength(SectionSubSection _subSectionDetails) {
    switch (_subSectionDetails.fieldID) {
      case 1027:
        return 12;
      case 1006:
        return 40;
      case 1419:
        return 7;
      default:
        return ((_subSectionDetails.fieldType == "numeric") ? 10 : 25);
    }
  }

  TextInputType returnKeyBoardType(SectionSubSection _subSectionDetail) {
    switch (_subSectionDetail.fieldType) {
      case "numeric":
        return TextInputType.numberWithOptions(signed: true, decimal: true);
        break;
      case "emailID":
        return TextInputType.emailAddress;
        break;
      default:
        return TextInputType.text;
    }
  }

  bool isFieldID(int fieldID) {
    final fieldAray = [
      1008,
      1014,
      1015,
      1019,
      1027,
      1065,
      1066,
      1067,
      1072,
      1142
    ];
    if (fieldAray.contains(fieldID)) {
      return true;
    }
    return false;
  }

  Future<void> updateValueWithFieldId(int fieldId, String fieldValue) async {
    List<FieldData> fieldDataDetails =
        await DBHelper().getFieldDataWithFieldDataID(fieldValue, fieldId);
    if (fieldDataDetails.length > 0) {
      final fieldDataDetail = fieldDataDetails[0];
      _textEditingController.text = fieldDataDetail.fieldValue;
    } else {
      _textEditingController.text = fieldValue;
    }
  }

  void updateValue(String value) {
    _textEditingController.text = value;
  }

  void refreshState(String value, bool tempIsHide) {
    if ((value == "0" || value == "") && tempIsHide) {
      isHide = true;
      setState(() {});
    } else if (value == "1" && tempIsHide) {
      isHide = false;
      setState(() {});
    } else {
      _textEditingController.text = value;
    }
  }

  void updateState(bool value) {
    setState(() {
      isHide = value;
    });
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

//MARK:- TextInput
class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = NumberFormat("#,###");
      final number =
          int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
