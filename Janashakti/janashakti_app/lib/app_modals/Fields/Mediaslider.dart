import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:intl/intl.dart';

class MediaSlider extends StatefulWidget{
  final _subSectionDetails;
  final  Function _function;
  MediaSlider(Key  key,this._function,this._subSectionDetails) : super(key : key);
  @override
  State<StatefulWidget> createState(){
    return MediaSliderState();
  }
}

class MediaSliderState extends State<MediaSlider>with AutomaticKeepAliveClientMixin{
  double _value = 0.0;
  final TextEditingController  _textEditingController = TextEditingController();
  FocusNode _focusNode;
  double _minValue = 0.0;
  double _maxValue = double.parse(LabelConstant.kHouseHoldMaxValue);
  String _formatNumber(String s) => NumberFormat.decimalPattern(LabelConstant.kLocale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: LabelConstant.kLocale).currencySymbol;
  void childCallBack(String fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }

  void initState () {
    super.initState();
      _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
          if ((widget._subSectionDetails.fieldValue == "0")){
                _textEditingController.clear();
          }
      }
    });
    if (widget._subSectionDetails.fieldValue.length > 0){
      final value = double.parse(widget._subSectionDetails.fieldValue.replaceAll(',', ''));
      _textEditingController.text = '${_formatNumber(value.round().toString())}';
      _value = value;
    }
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return Container(
      decoration: (_subSectionDetails.index %2 != 0) ? 
        BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/selectbackground.png"),
            fit: BoxFit.fill,
          ),
      ) : BoxDecoration() ,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
      child: new Opacity(
         opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: AbsorbPointer(
          absorbing : (_subSectionDetails.isEditable) ? false : true,
          child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 125.0,
            child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Flexible(
                          child:Align(
                          alignment: Alignment.topLeft,
                          child: Text(_subSectionDetails.fieldName,
                            style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() 
                          )
                        ),
                        )
                      ),
                       _subSectionDetails.isManditory == true ? Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0,0.0, 0.0),
                        child: Icon(Icons.star, color: Colors.red, size: 10.0),
                      ) : Container(),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 135.0,
                    child: Row(
                        children: <Widget>[
                          Container(
                            width: 10.0,
                            child: Text("0",
                                style:(_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() 
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 195.0,
                            child: Slider(
                                activeColor: Colors.orange,
                                value: (_value != null) ? ((_value > _maxValue ? _maxValue : _value)) : 0.0,
                                min: _minValue,
                                max: _maxValue,
                                divisions: 500,
                                label: _value.toString(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    _value = newValue;
                                    final _currencyText =  '${_formatNumber(newValue.round().toString().replaceAll(',', ''))}';
                                    _textEditingController.text = _currencyText;
                                    childCallBack(_currencyText);
                                  });
                                },
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars';
                                }
                            ),
                          ),
                          Container(
                            width: 50.0,
                            child: Text(LabelConstant.kHouseHoldMaxValue,
                                style:(_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() 
                            ),
                          ),
                        ]
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 135.0,
                    padding: EdgeInsets.all(10.0),
                    child :new Theme(
                      data: new ThemeData(
                        hintColor: (_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex()),
                      ),
                    child: TextFormField(
                      focusNode:_focusNode,
                      maxLength: 9,
                      controller: _textEditingController,
                      readOnly: false,
                      // ignore: deprecated_member_use
                      inputFormatters : [NumericTextFormatter()],
                      keyboardType:TextInputType.numberWithOptions(signed: true, decimal: true),
                      style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
                      autofocus: false,
                      onChanged: (text){
                        _value = (text.length > 0 && text != null) ? double.tryParse('${text.replaceAll(',', '')}') : "0";
                        if(_value <= _maxValue){
                           text = '${_formatNumber(text.replaceAll(',', ''))}';
                            setState(() {
                              childCallBack(text);
                            });
                        }
                        
                      },
                      decoration: InputDecoration(
                          counterText: '',
                          labelText: "0",
                          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:(_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnTextFieldBoarderColorWithIndex(Utility().returnThemColorIndex()), width: 0.5),
                        ),
                          errorStyle: TextStyle(color: Theme.of(context).errorColor)
                       ),
                       validator: (value){
                          if (value.length > 0){
                              if(_value > _maxValue){
                                return LabelConstant.kValueMaxError;
                              }else{
                                return null;
                              }
                          }else{
                            return  LabelConstant.kValueError;
                          }
                        },
                     ),
                    )
                  ),
                ],
            ),
          ),
          new Spacer(),
          Container(
            width: 40.0,
            child: IconButton(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 0.0),
              iconSize: 40,
              icon: new Image.asset("assets/images/household.png"), onPressed: () {  },
            ),
          ),
        ],
      ) ,
        )
        )
    );
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
    }else if (newValue.text.compareTo(oldValue.text) != 0) {
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