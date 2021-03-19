import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:intl/intl.dart';


class MediaController extends StatefulWidget{
  final _subSectionDetails;
  final mediaIndex;
  final  Function _function;
  MediaController(Key key,this._function,this._subSectionDetails,this.mediaIndex) : super(key : key);
  @override
  State<StatefulWidget> createState(){
    return MediaControllerState();
  }
}

class MediaControllerState extends State<MediaController>with AutomaticKeepAliveClientMixin{
  bool checkBoxBool = false;
  var mediaDetails = {};
  var filterList = [];
  var fieldData = [];
  final TextEditingController  _dropDownTextEditingController = TextEditingController();
  final TextEditingController  _textEditingController = TextEditingController();
  String _formatNumber(String s) => NumberFormat.decimalPattern(LabelConstant.kLocale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: LabelConstant.kLocale).currencySymbol;
  void childCallBack(fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }

  @override
  void initState () {
    super.initState();
    if(widget._subSectionDetails.fieldValue.length > 0){
      final tempMediDetails = widget._subSectionDetails.fieldValue;
       var valueMap = jsonDecode(tempMediDetails);
       mediaDetails["1"] = valueMap["1"];
       checkBoxBool = (valueMap["1"] == "1") ? true : false;
       mediaDetails["2"] = valueMap["2"];
       _textEditingController.text = valueMap["2"];
       mediaDetails["3"] = valueMap["3"];
       _dropDownTextEditingController.text = valueMap["3"];
    }else{
       mediaDetails["1"] = "";
       mediaDetails["2"] = "";
       mediaDetails["3"] = "";
    }
  }
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    final mediaIndex = widget.mediaIndex;
    return Container(
      decoration: (_subSectionDetails.index %2 != 0) ? 
        BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/selectbackground.png"),
              fit: BoxFit.fill,
          ) ,
      ) : BoxDecoration() ,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
      child: new Opacity(
        opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: AbsorbPointer(
          absorbing : (_subSectionDetails.isEditable) ? false : true,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 129.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          // Container(
                          //   width: MediaQuery.of(context).size.width/2 - 108.0,
                          //   child: Text(returnLabelTtitleWithIndex(1),
                          //     textAlign: TextAlign.left,
                          //     maxLines: 2,
                          //     style: (_subSectionDetails.index %2 != 0) ?  Configuration().retuenTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
                          //   ),
                          // ),
                          Container(
                            padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
                            width: MediaQuery.of(context).size.width - 130.0,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(returnNeedsConstantWithIndex(mediaIndex),
                                maxLines: 2,
                                style: Utility().retuenAnalysisTextStyle() //(_subSectionDetails.index %2 != 0) ?  Configuration().retuenAnalysisTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 108.0,
                            child: Text(returnLabelTtitleWithIndex(2),
                              maxLines: 2,
                              style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            //width: MediaQuery.of(context).size.width - 280.0,
                            height: 40.0,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: (_subSectionDetails.index %2 != 0) ?  Colors.grey : Utility().returnTextFieldBoarderColorWithIndex(Utility().returnThemColorIndex()),
                                ),
                                child:Checkbox(
                                  checkColor: Colors.orange,  // color of tick Mark
                                  activeColor: Colors.grey,
                                  value: checkBoxBool,
                                  onChanged: (bool value) {
                                    setState(() {
                                      checkBoxBool = value;
                                      // ignore: unnecessary_statements
                                      (checkBoxBool == true) ?  _textEditingController : _textEditingController.clear();
                                      
                                       // ignore: unnecessary_statements
                                      (checkBoxBool == true) ?  _dropDownTextEditingController : _dropDownTextEditingController.clear();
                                      mediaDetails["1"] = (value) ? 1.toString() : 0.toString();
                                      mediaDetails["2"] = (checkBoxBool == false) ? "" :  mediaDetails["2"];
                                      mediaDetails["3"] = (checkBoxBool == false) ? "" :  mediaDetails["3"];
                                      childCallBack(mediaDetails);
                                    });
                                  },
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 129.0,
                            height: 60.0,
                            child:new Theme(
                          data: new ThemeData(
                            hintColor: (_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex()),
                          ),
                          child: TextFormField(
                             
                            readOnly: (checkBoxBool == false) ? true : false,
                             controller: _textEditingController,
                            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            inputFormatters: [NumericTextFormatter()],//Utility().returnKeyPadType(_subSectionDetails),
                              style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle(),
                              autofocus: false,
                             maxLength: 9,
                              onChanged: (text){
                                text = '${_formatNumber(text.replaceAll(',', ''))}';
                                mediaDetails["2"] = text;
                                childCallBack(mediaDetails);
                              },
                              decoration: InputDecoration(
                                counterText : "",
                                labelText: returnLabelTtitleWithIndex(3),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.amber),
                                ),
                                enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:(_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnTextFieldBoarderColorWithIndex(Utility().returnThemColorIndex()), width: 0.5),
                            ),
                              ),
                              validator: (value){
                                if (value.length <= 0 && checkBoxBool) {
                                  return "Please enter value";
                                }
                                return null;
                              }
                            ),
                            )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 129.0,
                            height: 48.0,
                            child: GestureDetector(
                              onTap:()=>{
                                if (checkBoxBool){
                                   _returnDialogWithBuildContext(context,returnLabelTtitleWithIndex(4))
                                }
                              },
                              child :
                              Container(
                                height: 48.0,
                                width: MediaQuery.of(context).size.width - 129.0,
                                child: new Row(
                                    children:<Widget>[
                                      Container(
                                        width: MediaQuery.of(context).size.width - 129,
                                        child: returnDropDownWith(_subSectionDetails, context),
                                      ),
                                    ]
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 109.0,
                            child: Text(returnLabelTtitleWithIndex(5),
                              maxLines: 2,
                              style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle(),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 21.0,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(returnSuggestionConstantWithIndex(mediaIndex),
                                maxLines: 2,
                                style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Spacer(),
              Container(
                width: 38.0,
                child: IconButton(
                  padding: const EdgeInsets.all(5.0),
                  iconSize: 40,
                  icon: new Image.asset("assets/images/${returnImageNameWithIndex(mediaIndex)}"), onPressed: () {  },
                ),
              ),
            ],
          ),
        )
      )
    );
 }

 returnDropDownWith(SectionSubSection _subSectionDetails, BuildContext context){
  return AbsorbPointer(
    child: Container(
        height: 60.0,
        child:new Theme(
          data: new ThemeData(
            hintColor: (_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex()),
          ),
          child: new TextFormField(
          controller: _dropDownTextEditingController,
          style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle(),
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Piority",
            labelStyle: Utility().returnLabelStyle(),
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
            suffixIcon: new Icon(Icons.keyboard_arrow_down,color: Colors.orange),
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.amber),
            ),
           enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:(_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnTextFieldBoarderColorWithIndex(Utility().returnThemColorIndex()), width: 0.5),
            ),
          ),
           validator: (value){
             if (value.length <= 0 && checkBoxBool) {
              return "Please select priority";
             }
             return null;
           },
        ),
        )
    ),
  );
}

returnFieldData(){
  return ['1','2','3','4','5','6','7'];
}

_returnDialogWithBuildContext(BuildContext context,String title){
  fieldData = returnFieldData();
  filterList = fieldData;
  showDialog(
    context: context,
    builder: (BuildContext ctxt){
      return AlertDialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: StatefulBuilder(
          builder: (BuildContext altCntx,StateSetter setState){
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
                      child: Text(title,
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
                      onChanged: (data){
                         filterList = [];
                        fieldData.forEach((element) {
                          if(element.toLowerCase().contains(data.toLowerCase())){
                            filterList.add(element);
                          }
                        });
                        setState(() {
                          
                        });
                      },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                height: MediaQuery.of(context).size.height * 0.6 - 10.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: filterList.map((data) => ListTile(
                    title: Text(data),
                    onTap: ()=>{
                      FocusScope.of(context).unfocus(),
                      selectedData(data,altCntx)
                    }
                  )).toList(),
                ),
              ),
            ],
          );
          }
        )
      );
    }
  );
}

selectedData(data,BuildContext context){
    _dropDownTextEditingController.text = data;
     mediaDetails["3"] = data;
     childCallBack(mediaDetails);
     Navigator.of(context).pop();
}

//MARK:-
returnLabelTtitleWithIndex(int index){
  switch(index){
    case 1:
      return "";//LabelConstant.kFutureNeeds;
      break;
    case 2:
      return LabelConstant.kNeedsIdentified;
      break;
    case 3:
      return LabelConstant.kValue;
      break;
    case 4:
      return LabelConstant.kPriority;
      break;
   case 5:
      return LabelConstant.kProductSuggestion;
      break;   
    default: 
      return "test$index";
      break;              
  }
}

returnImageNameWithIndex(int index){
  switch(index){
    case 1:
      return "familyprotection.png";
      break;
    case 2:
      return "childrenseducation.png";
      break;
    case 3:
      return "childrensmarriage.png";
      break;
    case 4:
      return "incomeretirement.png";
      break;
    case 5:
      return "funds.png";
      break;
    case 6:
      return "othersaving.png";
      break;
    case 7:
      return "otherliablities.png";
      break; 
    default: 
      return "familyprotection.png";
      break;   
  }
}

returnNeedsConstantWithIndex(int index){
  switch(index){
    case 1:
       return LabelConstant.kFamilyIncomeProtection;
       break;
     case 2:
        return LabelConstant.kChildrensHigherEducation;
        break;
     case 3:
        return LabelConstant.kChildrensMarriage;
        break;
     case 4:
        return LabelConstant.kIncomeonRetirement; 
        break;
     case 5:
        return LabelConstant.kFundsforSicknessandHospitalization; 
        break;
     case 6:
        return LabelConstant.kOtherSavingsNeeds; 
        break;
     case 7:
        return LabelConstant.kOtherLiabilitiesandLoans; 
        break; 
      default: 
         return  "test$index";
        break;                      
  }
}
 returnSuggestionConstantWithIndex(int index){
  switch(index){
    case 1:
       return LabelConstant.kSuggestion1;
       break;
     case 2:
        return LabelConstant.kSuggestion2;
        break;
     case 3:
        return LabelConstant.kSuggestion3;
        break;
     case 4:
        return LabelConstant.kSuggestion4;
        break;
     case 5:
        return LabelConstant.kSuggestion5;
        break;
     case 6:
        return LabelConstant.kSuggestion6;
        break;
     case 7:
        return LabelConstant.kSuggestion7;
        break;
      default: 
         return  "test$index";
        break;         
  }
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