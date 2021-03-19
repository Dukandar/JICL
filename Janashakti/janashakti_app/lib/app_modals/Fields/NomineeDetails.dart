import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';

class NomineeDetails extends StatefulWidget {

  final _subSectionDetails;
  final Function _function;
  NomineeDetails(Key key,this._function,this._subSectionDetails): super(key : key);

  @override
  State<StatefulWidget>createState(){
    return NomineeDetailsState();
  }
  
}

class NomineeDetailsState extends State<NomineeDetails>with AutomaticKeepAliveClientMixin {

  NomineeDetailsState();

  var filterList = [];
  var fieldData = [];
  var mediaDetails = {};
  List<Map<String,String>> _nomineeDetails = List();
  List<Map<String,dynamic>> _nomineeDetailsTextEditCtr = List();
  var _nomineeCount = 0;

  void childCallBack(fieldValue){
    widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }

  @override
  void initState() {
    super.initState();
    setFieldValue();
  }

   setFieldValue() async {
      final details = widget._subSectionDetails.fieldValue;
      if(details.length > 0){
        final decodeDetails = json.decode(details);
        if (decodeDetails.length > 0){
             _nomineeCount = decodeDetails.length;
              await Future.forEach(decodeDetails, (value) async {
                 Map<String,String> _dependentDic = Map();
                _dependentDic["0"] = value["0"];
                _dependentDic["1"] = value["1"];
                 List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID(value["2"], 1145);
                 var fieldDataValue = "";
                  if (fieldDataDetails.length > 0) {
                    final fieldDataDetail = fieldDataDetails[0];
                     _dependentDic["2"] = fieldDataDetail.fieldValue;
                     fieldDataValue = fieldDataDetail.fieldValue;
                  }else{
                    fieldDataValue = value["2"];
                     _dependentDic["2"] = value["2"];
                  }
                _dependentDic["3"] = value["3"];
                _dependentDic["4"] = value["4"];
                _nomineeDetails.add(_dependentDic);
                Map<String,dynamic> _dependentTxtCtr = Map();
                _dependentTxtCtr["0"] = TextEditingController();
                _dependentTxtCtr["1"] = TextEditingController();
                _dependentTxtCtr["2"] = TextEditingController();
                _dependentTxtCtr["3"] = TextEditingController();
                _dependentTxtCtr["4"] = TextEditingController();
                _nomineeDetailsTextEditCtr.add(_dependentTxtCtr); 
                (_dependentTxtCtr["0"] as TextEditingController).text = value["0"];
                (_dependentTxtCtr["1"] as TextEditingController).text = value["1"];
                (_dependentTxtCtr["2"] as TextEditingController).text = fieldDataValue;
                (_dependentTxtCtr["3"] as TextEditingController).text = value["3"];
                (_dependentTxtCtr["4"] as TextEditingController).text = value["4"];
             });
              setState((){ });
          }
      }
    }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return ListView.builder (
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _nomineeCount,
      itemBuilder: (context, index) {
        return Container(
          decoration: (_subSectionDetails.index %2 !=0) ? 
          BoxDecoration(image: 
            DecorationImage(
              image: AssetImage("assets/images/selectbackground.png"),
              fit: BoxFit.fill,
            ) ,
          ) : BoxDecoration() ,
          padding: EdgeInsets.fromLTRB(10.0,10.0, 0.0, 10.0),
          margin: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 123.0,
                child: _returnDependentField(context, _subSectionDetails,index),
              ),
              new Spacer(),
              Container(
                width: 30.0,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  iconSize: 20,
                  color: Colors.orange,
                  onPressed: () {
                    if(_nomineeCount > 0){
                       _nomineeCount = _nomineeCount - 1;
                       _nomineeDetails.removeAt(index); 
                       _nomineeDetailsTextEditCtr.removeAt(index);
                    }
                    setState(() {
                    });
                    childCallBack(_nomineeDetails);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _returnDependentField(BuildContext context, _subSectionDetails,int _childIndex) {
    return new Opacity(
      opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
      child: Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width - 128,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext ctxt,int subIndex){
            return Wrap(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.fromLTRB(4.0,4.0,4.0, 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                    offset: Offset(6.0,
                    6.0))]
                  ),
                  height: 50.0,
                  width: MediaQuery.of(ctxt).size.width,
                  child: (returnFieldTypeWith(subIndex + 1) == FiledDataType.kTextbox 
                  || returnFieldTypeWith(subIndex +1) == FiledDataType.kNumeric) ? 
                  returnTextBoxWithIndex((subIndex + 1),_subSectionDetails,_childIndex) : 
                  (returnFieldTypeWith(subIndex + 1) == FiledDataType.kDOB) ? 
                  returnDatePickerWithIndex(ctxt,(subIndex + 1),_subSectionDetails,_childIndex) : 
                  returnDropDownWithIndex(ctxt,(subIndex + 1),_subSectionDetails,_childIndex),
                )
              ]
            );
          }
        ),
      )
    );
  }

  returnDatePickerWithIndex(BuildContext context,int index,_subSectionDetails,int _childIndex) {
    return Container(
      color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
      height: 50.0,
      child: GestureDetector(
        onTap:()=>{
          FocusScope.of(context).unfocus(),
          // if (_subSectionDetails.isEditable){
            setDatePicker(context,index,_childIndex)
          // }
        },
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: AbsorbPointer(
            child : new Theme(
              data: new ThemeData(
                hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
              ),
              child: TextFormField(
                controller:(_nomineeDetailsTextEditCtr.length > 0) ? _nomineeDetailsTextEditCtr[_childIndex]["3"] : null,
                style:Utility().returnBusinssDetailsNormalTextStyle(),
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: returnLabelTtitleWithIndex(index),
                  contentPadding: EdgeInsets.fromLTRB(10.0,10.0,20.0, 15.0),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.date_range,color: Colors.orange),
                ),
                validator: (value){
                  return (value.length <= 0) ? "Please select ${returnLabelTtitleWithIndex(index)}"  : null;
                },
              ),
            )
          )
        ),
      ),
    );
  }

  Future<Null>setDatePicker(BuildContext context,int index,int _childIndex) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(kStartDate),
      lastDate: (DateTime.now().subtract(Duration(days: 0))),
      builder: (BuildContext context,
      Widget child) {
        return Theme(
          data: new ThemeData(
            primaryColor: Color(0x335C81),//Head background
            colorScheme: ColorScheme.light(primary : Utility().returnThemColorWithIndex(Utility().returnThemColorIndex())),
            dialogBackgroundColor: Colors.white,//Background color
          ),
          child: child,
        );
      }
    );

    if (picked != null && picked != DateTime.now()) {
     // _datePickertextEditingController.text = "${picked.day.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.year.toString().padLeft(2,'0')}";
      final _datePickertextEditingController = _nomineeDetailsTextEditCtr[_childIndex]["3"] as TextEditingController;
      _datePickertextEditingController.text = "${picked.day.toString()}/${picked.month.toString().padLeft(2,'0')}/${picked.year.toString().padLeft(2,'0')}";
      _nomineeDetails[_childIndex]["3"] = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
      childCallBack(_nomineeDetails);
    }
  }

  //MARK:- TextBox
  returnTextBoxWithIndex(int index,_subSectionDetails,int _childIndex){
    return Container(
      color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
      child: new Theme(
        data: new ThemeData(
          hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
        ),
        child:TextFormField(
          // readOnly: (_subSectionDetails.isEditable) ? false : true,
          maxLength: (index == 2) ? 12 : 20,
          controller:(_nomineeDetailsTextEditCtr.length > 0) ?  ((index == 1) ? _nomineeDetailsTextEditCtr[_childIndex]["0"] : (index == 2) ? _nomineeDetailsTextEditCtr[_childIndex]["1"] : _nomineeDetailsTextEditCtr[_childIndex]["4"]) : null,
          onChanged: (text){
            if(index == 2){
                updateDateOfBirthUsingNICNumber(text,_subSectionDetails,index,_childIndex);
            }
            _nomineeDetails[_childIndex][(index -1).toString()] = text;
            childCallBack(_nomineeDetails);
          },
          keyboardType: TextInputType.text,
          validator: (value){
            if(index == 2 && value.length > 0){
              return FormValidator().validateNICNo(value, _subSectionDetails);
            }else{ 
              return (value.length <= 0) ? "Please enter ${returnLabelTtitleWithIndex(index)}" : null;
            }
           },
          style: Utility().returnBusinssDetailsNormalTextStyle(),
          autofocus: false,
          decoration: InputDecoration(
            counterText: '',
            labelText: returnLabelTtitleWithIndex(index),
            contentPadding: EdgeInsets.fromLTRB(10.0,10.0,20.0, 15.0),
            border: InputBorder.none,
             errorStyle: TextStyle(
                        fontSize:14.0,
                        color: Theme.of(context).errorColor
                    )
          ),
        ) 
      ) 
    );
  }

  //MARK: DropDown
  returnDropDownWithIndex(BuildContext context,int index,_subSectionDetails,int _childIndex){
    return Container(
      color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
      height: 48.0,
      child: GestureDetector(
        onTap:()=>{
          FocusScope.of(context).unfocus(),
          // if (_subSectionDetails.isEditable){
            _returnDialogWithBuildContext(context,returnLabelTtitleWithIndex(index),_childIndex)
          // }
        },
        child:Padding(
          padding: EdgeInsets.all(0.0),
          child: AbsorbPointer(
            child : new Theme(
              data: new ThemeData(
                hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
              ),
              child: TextFormField(
                controller: (_nomineeDetailsTextEditCtr.length > 0) ?  _nomineeDetailsTextEditCtr[_childIndex]["2"] : null,
                style: Utility().returnBusinssDetailsNormalTextStyle(),
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: returnLabelTtitleWithIndex(index),
                  contentPadding: EdgeInsets.fromLTRB(10.0,10.0,20.0, 15.0),
                  suffixIcon: new Icon(Icons.keyboard_arrow_down, color : Colors.orange),
                  border:InputBorder.none,
                ),
                 validator: (value){
                  return (value.length <= 0) ? "Please select ${returnLabelTtitleWithIndex(index)}"  : null;
                },
              ),
            )
          ) 
        ),
      )
    );
  }

  _returnDialogWithBuildContext(BuildContext context,String title,int _childIndex) async {
    List<FieldData> fieldData = await DBHelper().getFieldDataWithField(1145);
    fieldData = fieldData;
    filterList = fieldData;
    if (filterList.length >0) {
      retunrDialog(title,_childIndex);
    }
  }

  //MARK:- Dialog
  retunrDialog(String title,int _childIndex){
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
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: LabelConstant.kSearch,
                            icon: Icon(Icons.search),
                          ),
                          onChanged: (data){
                            filterList = [];
                            fieldData.forEach((element) {
                              if(element.fieldValue.toLowerCase().contains(data.toLowerCase())){
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
                        height: (MediaQuery.of(context).size.height * 0.7) - 4.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          children: filterList.map((data) => ListTile(
                            title: Text(data.fieldValue),
                            onTap: ()=>{
                              FocusScope.of(context).unfocus(),
                              selectedData(data,altCntx,_childIndex)
                            }
                        )
                      ).toList(),
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

  selectedData(FieldData fieldData,BuildContext context,int _childIndex){
  // _relationShiptextEditingController.text = fieldData.fieldValue;
    _nomineeDetails[_childIndex]["2"] = fieldData.fieldDataID;
    final textEditCntr = _nomineeDetailsTextEditCtr[_childIndex]["2"] as TextEditingController;
    textEditCntr.text = fieldData.fieldValue;
    childCallBack(_nomineeDetails);
    Navigator.of(context).pop();
  }

  //MARK:-
  returnImageNameeWith(int index){
    switch(index){
      case 1:
        return "assets/images/10001.png";
        break;
      case 2:
        return "assets/images/10002.png";
        break;
      case 3:
        return "assets/images/1010.png";
        break;
      case 4:
        return "assets/images/1011.png";
        break; 
    }
  }

  returnFieldTypeWith(int index){
    switch(index){
      case 1:
        return FiledDataType.kTextbox;
        break;
      case 2:
        return FiledDataType.kTextbox;
        break;
      case 3:
        return FiledDataType.kDropdown;
        break;
      case 4:
        return FiledDataType.kDOB;
        break;
      case 5:
        return FiledDataType.kNumeric;
        break; 
    }
  }

  returnLabelTtitleWithIndex(int index){

    switch(index){
      case 1:
        return LabelConstant.kFullName;
        break;
      case 2:
        return LabelConstant.kNICNo;
        break; 
      case 3:
        return LabelConstant.kAssuredRelationship;
        break;
      case 4:
        return LabelConstant.kDateOfBirth;
        break;
      case 5:
        return LabelConstant.kPercentage;
        break;
    }
  }

  void refreshStateWithValue(String value){
    final intValue = int.parse(value);
    if (intValue > 0){
       _nomineeCount = (_nomineeCount > 0) ? (_nomineeCount + 1) : intValue;
      Map<String,String> _dependentDic = Map();
      _dependentDic["0"] = "";
      _dependentDic["1"] = "";
      _dependentDic["2"] = "";
      _dependentDic["3"] = "";
      _dependentDic["4"] = "";
      _nomineeDetails.add(_dependentDic);
      Map<String,dynamic> _dependentTxtCtr = Map();
       _dependentTxtCtr["0"] = TextEditingController();
      _dependentTxtCtr["1"] = TextEditingController();
      _dependentTxtCtr["2"] = TextEditingController();
      _dependentTxtCtr["3"] = TextEditingController();
      _dependentTxtCtr["4"] = TextEditingController();
      _nomineeDetailsTextEditCtr.add(_dependentTxtCtr);
    }
     setState(() {
     });
  }

void updateDateOfBirthUsingNICNumber(String nicNumber, SectionSubSection _sectionSubSection,int _index,int _childIndex){
   if (FormValidator().validateNICNo(nicNumber, _sectionSubSection) == null) {
      final _tempDict = Utility().returnDateOfBirthAgeGenderFromNICNumber(nicNumber);
      final _dateArray = (_tempDict["date"] as String).split("-");
      final _datePickertextEditingController = _nomineeDetailsTextEditCtr[_childIndex]["3"] as TextEditingController;
      _datePickertextEditingController.text = "${_dateArray[2]}/${_dateArray[1]}/${_dateArray[0]}";
      _nomineeDetails[_childIndex]["3"] =  "${_dateArray[0]}-${_dateArray[1]}-${_dateArray[2]}";
      childCallBack(_nomineeDetails);
      print("");
   }
}



@override
  bool get wantKeepAlive => true;
}