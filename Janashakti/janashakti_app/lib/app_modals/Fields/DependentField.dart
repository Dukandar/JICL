
import 'dart:convert';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Utility.dart';

import '../DBHelper.dart';
import '../MasterModals.dart';

class errorLabelConstant{
  static final kDeptName = "Please enter dependent Name";
  static final kRelationship = "Please select relationship";
  static final kDOB = "Please select date of birth";
}

class Dependent extends StatefulWidget{
  final  Function _function;
  final _subSectionDetails;
  Dependent(Key key,this._function,this._subSectionDetails):super(key : key);
  @override
  State<StatefulWidget> createState() {
    return DependentState(_subSectionDetails.isHide);
  }
}

class DependentState extends State<Dependent>with AutomaticKeepAliveClientMixin {
  var _isHide;
  var _childCount = 0;
  var _selectedIndex = 0;
  var _dependentDetails = [];
  DependentState(this._isHide);
  var filterList = [];
  var fieldData = [];
  final TextEditingController  _dropDowntextEditingController = TextEditingController();
  final TextEditingController  _datePickertextEditingController = TextEditingController();
  final TextEditingController  _ageTextEditingController = TextEditingController();
  final TextEditingController  _textEditingController = TextEditingController();
  void childCallBack(fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  @override
  Future<void> initState () {
    super.initState();
    setFieldValue();
  }
  setFieldValue() async {
     if(widget._subSectionDetails.fieldValue.length > 0){
      final details = widget._subSectionDetails.fieldValue;
      final decodeDetails = json.decode(details);
      if (decodeDetails.length > 0){
         _selectedIndex = 0;
         if(widget._subSectionDetails.fieldDependencyID == 1252 && !widget._subSectionDetails.isHide){
             _isHide = false;
         }
          var tempArray = [];
        for(final value in decodeDetails){
          final decode = jsonDecode(value);
          tempArray.add(decode);
        }
        _dependentDetails = tempArray;
        _childCount = _dependentDetails.length;
        final _dependentDic = _dependentDetails[0];
        _textEditingController.text = _dependentDic["0"];
         List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID( _dependentDic["1"].toString(),1232);
        if (fieldDataDetails.length > 0) {
           final fieldDataDetail = fieldDataDetails[0];
          _dropDowntextEditingController.text = fieldDataDetail.fieldValue;
        }else{
           _dropDowntextEditingController.text = _dependentDic["1"];
        }
        _datePickertextEditingController.text = _dependentDic["2"];
        _ageTextEditingController.text = _dependentDic["3"];
       }
    }else{
      _dependentDetails = [];
    }
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return (!_isHide && _childCount > 0) ? Container(
      child: new Column(
          children:<Widget>[
            Container(
              height: 60.0,
              margin: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                 ),
              child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _childCount, 
                  itemBuilder: (context, index) {
                return GestureDetector(
                onTap: ()=>{
                  FocusScope.of(context).unfocus(),
                  gestureTappedWithIndex(index)
                },
                child:Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: (index == _selectedIndex) ? Colors.orange :  Utility().returnContainerColorWithIndex( Utility().returnThemColorIndex()),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [BoxShadow(
                        color:
                        Colors.grey.withOpacity(0.6),
                        blurRadius: 8,
                        offset: Offset(6.0, 6.0))]
                    ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                   child: Center(
                          child:Text("${LabelConstant.kDependent} ${index + 1}",
                          textAlign: TextAlign.center,
                          style: (index == _selectedIndex) ? Utility().retuenWhilteTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
                        ),
                    )
                )
                );
              })
            ),
            Container(
              child : Row(
                children : <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 104.0,
                    child: (_childCount >0 ) ? _returnDependentField(context, _subSectionDetails) : Container(),
                  ),
                   (_childCount >0 ) ? Container(  
                        width: 30.0,
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          iconSize: 20,
                          color: Colors.orange,
                          onPressed: () {
                            if(_childCount > 0){
                              _dependentDetails.removeAt(_selectedIndex);
                              _selectedIndex = 0;
                              _childCount = _childCount - 1;
                               childCallBack(_dependentDetails);
                               if(_childCount == 0){
                                  _isHide = true;
                                  setState((){});
                               }else{
                                  gestureTappedWithIndex(_selectedIndex);
                               }

                            }
                          },
                        ),
                      ) : Container(),
                ]
              )
            ),
          ]
      ),
    ) : Container();
  }

_returnDependentField(BuildContext context, _subSectionDetails) {
  return new Opacity(
    opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
    child: Container(
    height: 237.0,
    width: MediaQuery.of(context).size.width - 66,
    child: ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext ctxt,int index){
         return Wrap(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 8,
                      offset: Offset(6.0, 6.0))]
                  ),
                height: 52.0,
                width: MediaQuery.of(ctxt).size.width,
                child: (returnFieldTypeWith(index + 1) == FiledDataType.kTextbox || returnFieldTypeWith(index + 1) == FiledDataType.kNumeric) ? returnTextBoxWithIndex((index + 1),_subSectionDetails) : 
                (returnFieldTypeWith(index + 1) == FiledDataType.kDOB) ? returnDatePickerWithIndex(ctxt,(index + 1),_subSectionDetails) : returnDropDownWithIndex(ctxt,(index + 1),_subSectionDetails) ,
              )
            ]
         );
      }
    ),
  )
  );
}

//MARK:- TextBox
returnTextBoxWithIndex(int index,_subSectionDetails){
  return Container(
    color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
    child: new Theme(
      data: new ThemeData(
        hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
      ),
     child:TextFormField(
          readOnly: (_subSectionDetails.isEditable) ? false : true,
          controller: (index == 1) ? _textEditingController : _ageTextEditingController,
          onChanged: (text){
            _dependentDetails[_selectedIndex][(index -1).toString()] = text;
            childCallBack(_dependentDetails);
          },
          keyboardType: TextInputType.text,
          style: Utility().returnBusinssDetailsNormalTextStyle(),
          autofocus: false,
          decoration: InputDecoration(
            labelText: returnLabelTtitleWithIndex(index),
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
            border: InputBorder.none,
            prefixIcon: ImageIcon(
                      AssetImage(returnImageNameeWith(index)),
                      size: 10.0,
                      color: Colors.orange,
                    ),
          ),
          validator: (value){
                return (value.length <= 0) ? returnerrorMessageWith(index)  : null;
              },
      )            
    )                        
  );
}

//MARK:- Date Picker
returnDatePickerWithIndex(BuildContext context,int index,_subSectionDetails){
  return Container(
     color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
        height: 48.0,
        child: GestureDetector(
          onTap:()=>{
            FocusScope.of(context).unfocus(),
            if (_subSectionDetails.isEditable){
               setDatePicker(context)
            }
          },
          child: Padding(
          padding: EdgeInsets.all(0.0),
          child: AbsorbPointer(
            child : new Theme(
            data: new ThemeData(
            hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
             ),
             child: TextFormField(
              controller: _datePickertextEditingController,
              style:Utility().returnBusinssDetailsNormalTextStyle(),
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: returnLabelTtitleWithIndex(index),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                border: InputBorder.none,
                prefixIcon: ImageIcon(
                      AssetImage(returnImageNameeWith(index)),
                      size: 10.0,
                      color: Colors.orange,
                    ),
              ),
              validator: (value){
                return (value.length <= 0) ? returnerrorMessageWith(index)  : null;
              },
          ),
            )
          )
        ),
      ),
   );
}

void refreshIsDepdent(bool tempIsHide){
    _isHide = tempIsHide;
    setState(() {
      
    });
}

 Future<Null> setDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(kStartDate),
        lastDate: DateTime(kEndDate),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: new ThemeData(
              primaryColor: Color(0x335C81),//Head background
              colorScheme: ColorScheme.light(primary: Utility().returnThemColorWithIndex(Utility().returnThemColorIndex())),
              dialogBackgroundColor: Colors.white,//Background color
            ),
            child: child,
          );
        }
    );

    if (picked != null && picked != DateTime.now()) {
      _datePickertextEditingController.text = "${picked.day.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.year.toString().padLeft(2,'0')}";
        final selectedDate = DateTime.parse("${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}");
        Duration duration = DateTime.now().difference(selectedDate);
        final numberOfYears = ((duration.inDays / 365).floor() + 1).toString();
       _ageTextEditingController.text = numberOfYears;
        _dependentDetails[_selectedIndex]["2"] = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
        _dependentDetails[_selectedIndex]["3"] = numberOfYears;
        childCallBack(_dependentDetails);
    }
  }

//MARK: DropDown
returnDropDownWithIndex(BuildContext context,int index,_subSectionDetails){
  return Container(
       color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
        height: 48.0,
        child: GestureDetector(
           onTap:()=>{
             FocusScope.of(context).unfocus(),
              if (_subSectionDetails.isEditable){
                _returnDialogWithBuildContext(context,returnLabelTtitleWithIndex(index))
              }
           },
          child:Padding(
            padding: EdgeInsets.all(0.0),
            child: AbsorbPointer(
               child : new Theme(
            data: new ThemeData(
            hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
             ),
              child: TextFormField(
              controller: _dropDowntextEditingController,
              style: Utility().returnBusinssDetailsNormalTextStyle(),
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: returnLabelTtitleWithIndex(index),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                suffixIcon: new Icon(Icons.keyboard_arrow_down,
                color: Colors.orange,),
                border:InputBorder.none,
                prefixIcon: ImageIcon(
                      AssetImage(returnImageNameeWith(index)),
                      size: 10.0,
                      color: Colors.orange,
                    ),
              ),
              validator: (value){
                return (value.length <= 0) ?returnerrorMessageWith(index) : null;
              },
            ),
           )
            ) 
        ),
        )
      );
}

_returnDialogWithBuildContext(BuildContext context,String title) async {
  //1232
  List<FieldData> fieldData  =  await DBHelper().getFieldDataWithField(1232);
  fieldData = fieldData;
  filterList = fieldData;
  if (filterList.length > 0){
    retunrDialog(title);
  }
}

//MARK:- Dialog
retunrDialog(String title){
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
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: LabelConstant.kSearch,
                    //add icon outside input field
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

selectedData(FieldData fieldData,BuildContext context){
    _dropDowntextEditingController.text = fieldData.fieldValue;
    _dependentDetails[_selectedIndex]["1"] = fieldData.fieldDataID;
    childCallBack(_dependentDetails);
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

returnerrorMessageWith(int index){
  switch(index){
     case 1:
      return errorLabelConstant.kDeptName;
      break;
     case 2:
      return errorLabelConstant.kRelationship;
      break;
     case 3:
      return errorLabelConstant.kDOB;
      break;   
  }
}

returnFieldTypeWith(int index){
  switch(index){
     case 1:
      return FiledDataType.kTextbox;
      break;
     case 2:
      return FiledDataType.kDropdown;
      break;
     case 3:
      return FiledDataType.kDOB;
      break;
     case 4:
      return FiledDataType.kNumeric;
      break;   
  }
}

//MARK:-
  returnLabelTtitleWithIndex(int index){
    switch(index){
      case 1:
        return  LabelConstant.kDependentName;
        break;
      case 2:
        return  LabelConstant.kRelationship;
        break;
      case 3:
        return  LabelConstant.kDOB;
        break;
      case 4:
        return  LabelConstant.kAge;
        break;
    }
  }
  //MARK:- refreshState

  Future<void> refreshStateWithList(List filedValue) async {
     _selectedIndex = 0;
    _dependentDetails = filedValue;
    _childCount = _dependentDetails.length;
    if(_childCount > 0){
       final _dependentDic = _dependentDetails[0];
    _textEditingController.text = _dependentDic["0"];
      List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID( _dependentDic["1"].toString(),1232);
      if (fieldDataDetails.length > 0) {
          final fieldDataDetail = fieldDataDetails[0];
        _dropDowntextEditingController.text = fieldDataDetail.fieldValue;
      }else{
          _dropDowntextEditingController.text = _dependentDic["1"];
      }
      _datePickertextEditingController.text = _dependentDic["2"];
      _ageTextEditingController.text = _dependentDic["3"];
      }else{
        _isHide = true;
        _selectedIndex = 0;
       _dependentDetails = [];
        _dropDowntextEditingController.text = "";
       _datePickertextEditingController.text = "";
      _ageTextEditingController.text = "";
       _textEditingController.text = "";
      }
    setState(() {});
  }


  void refreshState(String value){
    final intValue = int.parse(value);
    if (_childCount > intValue){
      _dependentDetails.removeLast();
       setState(() {
      
       });
     // childCallBack(_dependentDetails);
    }
    if (intValue > 0){
      _childCount = int.parse(value);
      final _dependentDic = {};
      _dependentDic["0"] = "";
      _dependentDic["1"] = "";
      _dependentDic["2"] = "";
      _dependentDic["3"] = "";
      _dependentDetails.add(_dependentDic);
      _isHide = false;
    }else{
      _isHide = true;
      _selectedIndex = 0;
      _dependentDetails = [];
      _dropDowntextEditingController.text = "";
     _datePickertextEditingController.text = "";
     _ageTextEditingController.text = "";
     _textEditingController.text = "";
      childCallBack("");
    }
    setState(() {
      
    });
  }

//MARK:- Gesture tapped
Future<void> gestureTappedWithIndex(int index) async {
  _selectedIndex = index;
 final _dependentDic =  _dependentDetails[_selectedIndex];
 if (_dependentDic.length > 0){
    _textEditingController.text = _dependentDic["0"];
    if (_dependentDic["1"].length > 0) {
      List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID(_dependentDic["1"].toString(),1232);
      if (fieldDataDetails.length > 0) {
        final fieldDataDetail = fieldDataDetails[0];
        _dropDowntextEditingController.text = fieldDataDetail.fieldValue;
      }
    }else{
      _dropDowntextEditingController.text = _dependentDic["1"].toString();
    }
    _datePickertextEditingController.text =  _dependentDic["2"];
    _ageTextEditingController.text = _dependentDic["3"];
 }else{
   _dropDowntextEditingController.text = "";
   _datePickertextEditingController.text = "";
   _ageTextEditingController.text = "";
   _textEditingController.text = "";
 }
  setState(() { 
  });
}

@override
  bool get wantKeepAlive => true;
}