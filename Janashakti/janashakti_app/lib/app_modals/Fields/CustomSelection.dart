
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/Fields/CustomDocument.dart';
import 'package:jiclapp/app_modals/Fields/DatePicker.dart';
import 'package:jiclapp/app_modals/Fields/DropDown.dart';
import 'package:jiclapp/app_modals/Fields/RadioButton.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_modals/Fields/TextBox.dart';
import '../DBHelper.dart';
import 'CustomCheckbox.dart';


class CustomSelectionWidget extends StatefulWidget{
   final _subSectionDetails;
   final Function _function;
   final _webRefNumber;
   CustomSelectionWidget(Key key,this._function,this._subSectionDetails,this._webRefNumber) : super(key : key);
    @override
    State<StatefulWidget> createState(){
      return CustomSelectionState(_subSectionDetails.isHide);
    }
}

class CustomSelectionState extends State<CustomSelectionWidget> with AutomaticKeepAliveClientMixin{
  bool isHide;
  List <String> listValue = List();
  List <dynamic> selectedFilterValue = List();
  Map<int, dynamic> _subDetails = Map();
  List<SectionSubSection> _filterSubDetails = List();
  var _selectedIndex = 0;
  CustomSelectionState(this.isHide);

void childCallBack(fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }

  void initState () {
    super.initState();
    setInitateValues();
  }
  
  setInitateValues() async {
    List<ExpandCollapseData> expandCollapseDetails = await DBHelper().getExpandCollapseMasterList();
   
     final tempHeaderDetails = expandCollapseDetails.where((element) => element.fieldID == widget._subSectionDetails.fieldID).toList();
      if (tempHeaderDetails.length > 0) {
       var index = 0;
      await Future.forEach(tempHeaderDetails, (str) async {
        final detail = tempHeaderDetails[index];
        List<SectionSubSection> fieldMasterData = await DBHelper().getFieldMasterDataWith(detail.ecFieldID,detail.fieldID,"");
        if (fieldMasterData.length > 0){
          _subDetails[detail.ecFieldID] = fieldMasterData;
        }
        index++;
      });  
    }
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !isHide ? Container(
       width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 60.0,
              child: ListView.builder (
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listValue.length,
              itemBuilder: (context, listIndex) {
                 return GestureDetector(
                    onTap: ()=>{
                      FocusScope.of(context).unfocus(),
                       gestureTappedWithIndex(listIndex)
                    },
                    child:Container(
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: (listIndex == _selectedIndex) ? Colors.orange :  Utility().returnContainerColorWithIndex( Utility().returnThemColorIndex()),
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
                              child:Text(listValue[listIndex],
                              textAlign: TextAlign.center,
                              style: (listIndex == _selectedIndex) ? Utility().retuenWhilteTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
                            ),
                        )
                    )
                );
              }
            )
          ),
          Container(
            child: Container(
            child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:_filterSubDetails.length,
                        itemBuilder: (BuildContext ctxt,int itemIndex){
                          return _buildExpandableContent(_filterSubDetails,itemIndex);
                        },
             )
          ),
          )
        ]
      )
    ) : Container(
      
    );
  }

  _buildExpandableContent(List<SectionSubSection> list,int subIndex) {
      return Container(
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          child: _returnSubStateBody(list[subIndex]),
          decoration: BoxDecoration(
            color: returnContainerBackgroundColorWith(list[subIndex]),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(
              color: returnShadowColorWithFields(list[subIndex]),
              blurRadius: 18,
              offset: Offset(0.0, 6.0)
            )],
          ),
        );
    }

    returnContainerBackgroundColorWith(SectionSubSection secSubSecDetails){
    switch(secSubSecDetails.fieldType){
      case "customelabel":
        return Colors.orange;
        break;
      case "button":
        return Colors.transparent;
        break;
      case "label":
        return Colors.transparent;
      default:
        return Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex());
        break;
    }
  }

  returnShadowColorWithFields(SectionSubSection secSubSecDetails){
    switch(secSubSecDetails.fieldType){
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

  _returnSubStateBody(SectionSubSection secSubSecDetails) {
    switch (secSubSecDetails.fieldType) {
      case "dropdown":
        return DropDownWidget(secSubSecDetails.globalKey,callBackFromChild,secSubSecDetails,"");
        break;
     case "radiogroup":
        return RadioButton(secSubSecDetails.globalKey,callBackFromChild,secSubSecDetails);
        break;
     case "textbox":
        return TextBox(secSubSecDetails.globalKey,callBackFromChild,secSubSecDetails);
        break;   
      case "date":
        return DatePicker(secSubSecDetails.globalKey,callBackFromChild,secSubSecDetails);
        break;   
      case "customCheckbox":
        return CustomCheckbox(secSubSecDetails.globalKey,callBackFromChild,secSubSecDetails);
        break;  
       case "customDocument":
        return CustomDocument(secSubSecDetails.globalKey,callBackFromChildWithMultipleValues,secSubSecDetails,widget._webRefNumber);
        break;  
    }
  }

//MARK:- callBackFromChild
 void callBackFromChild(int sectionID,int subSectionId,int fieldID,fieldValue,int index){
   var list = _subDetails[subSectionId] as List;
    var _tempSubSectionDetails = list[index] as SectionSubSection;
    _tempSubSectionDetails.fieldValue =  fieldValue;
    final encodeData = returnFieldValue();
    childCallBack(encodeData);
    if(_tempSubSectionDetails.isDependent){
        updateDepdentFieldWithFieldId(_tempSubSectionDetails,fieldID,subSectionId,fieldValue,false,list);
    }
 }

 void callBackFromChildWithMultipleValues(int sectionID,int subSectionId,int fieldID,fieldValue,int index){
     var list = _subDetails[subSectionId] as List;
     var _tempSubSectionDetails = list[index] as SectionSubSection;
     _tempSubSectionDetails.fieldValue = jsonEncode(fieldValue);
    final encodeData = returnFieldValue();
     childCallBack(encodeData);
  }

returnFieldValue(){
    Map<String,String> _mapDetails = Map();
    final keys = _subDetails.keys;
      for(final key in keys){
        final details = _subDetails[key] as List;
        List _listDetails = List();
        for(final item in details){
          final _tempSectionSubsection = item as SectionSubSection;
          _listDetails.add(_tempSectionSubsection.fieldValue);
        }
        _mapDetails["$key"] = _listDetails.join("#");
      }
      return  _mapDetails;
  }
  
//Dept fields
Future<void> updateDepdentFieldWithFieldId(SectionSubSection sectionSubSection,int fieldID,int subSectionId,String fieldValue,bool isContinue,List<SectionSubSection> list) async {
  var depdentIDs = sectionSubSection.dependentIDs.split(",");
   depdentIDs.removeLast();
   if( depdentIDs.length> 0){
    for(final id in depdentIDs){ 
        final index = returnIndexWithField(int.parse(id),list);
         if (index != null){
          final deptSectionSubSection = list[index];
          final globalKey = deptSectionSubSection.globalKey;
           if(globalKey.currentState != null){
             if(globalKey.currentState is DatePickerState){
               final currentState = globalKey.currentState as DatePickerState;
                currentState.setRefreshState((fieldValue == "1") ? false : true);
             }else  if(globalKey.currentState is CustomDocumentState){
                final currentState = globalKey.currentState as CustomDocumentState;
                 currentState.refreshState(fieldValue);
             }else{
               final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(fieldValue,false);
             }
             if(deptSectionSubSection.fieldDependencyID == 1483){
                
             }else{
                
             }
             
           }    
      }
      }
    }
}

  //MARK:- return index
returnIndexWithField(int fieldDependencyID,List<SectionSubSection> _sectionDetails){
  if (_sectionDetails.length > 0) {
     for(var index = 0; index < _sectionDetails.length; index++){
    final _value = _sectionDetails[index];
      if (_value.fieldDependencyID == fieldDependencyID){
        return index;
      }
    } 
  }
 }

//MARK:-
  void refreshIsDepdent(String fieldValue,int fieldData){
    if(fieldValue.length > 0){
       final tempListValue = jsonDecode(fieldValue);
      selectedFilterValue = tempListValue;
      listValue = List();
      _getFiedData(tempListValue,fieldData);
    }
}

 _getFiedData(List<dynamic> value,int fieldId) async {
    List<FieldData> fieldData  =  await DBHelper().getFieldDataWithField(fieldId);
    final filterList = fieldData;
    for(var i=0;i <filterList.length ;i++){
      final data = filterList[i];
        if(value.contains("${data.dataID}")){
            listValue.add(filterList[i].fieldValue);
        }
    }
    isHide = (listValue.length > 0) ? false : true;
    setState(() {});
    gestureTappedWithIndex(0);
}

//MARK:- Gesture tapped 
Future<void> gestureTappedWithIndex(int index) async {
   _selectedIndex = index;
   if(selectedFilterValue.length > 0){
      final _tapValue = selectedFilterValue[index];
      _filterSubDetails = List();
      if(_subDetails[int.parse(_tapValue)] != null){
          _filterSubDetails = _subDetails[int.parse(_tapValue)];
      }
      setState(() {});
   }
}
  @override
  bool get wantKeepAlive => true;
}
