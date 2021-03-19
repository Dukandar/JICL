import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';
import '../DBHelper.dart';
import '../MasterModals.dart';

class RadioButton extends StatefulWidget{
   final  Function _function;
   final _subSectionDetails;
   RadioButton(Key  key,this._function,this._subSectionDetails): super(key : key);
  @override
  State<StatefulWidget> createState(){
    return RadioButtonState(_subSectionDetails.isHide);
  }
}

class RadioButtonState extends State<RadioButton> with AutomaticKeepAliveClientMixin{
  var isHide;
  RadioButtonState(this.isHide);
  int _currentTimeValue = 0;
  List<FieldData> fieldData = [];
  void childCallBack(String fieldValue){
    widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }

  @override
  void initState () {
    super.initState();
    if(widget._subSectionDetails.fieldDependencyID == 1682){
      _currentTimeValue = null;
    }else if(widget._subSectionDetails.fieldValue == "8"){
      _currentTimeValue = null;
    }else{
      _currentTimeValue =  (widget._subSectionDetails.fieldValue.length > 0) ?  int.parse(widget._subSectionDetails.fieldValue) : 0;
    }
    _setRadioListWithFieldID(widget._subSectionDetails.fieldID);
  }

  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !isHide ?  Container(  
    child: new Opacity(
      opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
      child: Column(
      children: <Widget>[
         Container(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 4.0, 0.0),
          width: MediaQuery.of(context).size.width - 42,
          child: Row(
            children: <Widget>[
              (_subSectionDetails.fieldID == 1033) ? Container(
                width: 30.0,
                height:  30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/1033.png"))
                 )
              ) : Container(),
              Container(
                width: MediaQuery.of(context).size.width - 114.0,
               child: Text(" ${_subSectionDetails.placeHolder}",
                     style: Utility().returnBusinssDetailsNormalTextStyle()
               ),
             )
            ]
          )
         
        ),
        Container(
          child: new Theme(
                data: new ThemeData(
                  unselectedWidgetColor: Colors.blue,
                ),
                child:new ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: fieldData.map((item) => RadioListTile(
              activeColor: Colors.orange,
               groupValue: _currentTimeValue,
               title: Text(
                 item.fieldValue,
                 style: Utility().returnBusinssDetailsNormalTextStyle()
               ),
                value: int.parse(item.fieldDataID),
                onChanged: (val){
                  FocusScope.of(context).unfocus();
                   if(_subSectionDetails.isEditable){
                       setState(() {
                     _currentTimeValue = val;
                      });
                      childCallBack(_currentTimeValue.toString());
                   }
                },
           )).toList() 
          ), 
          )
        ),
      ]),
    )
  ) : Container();
}

_setRadioListWithFieldID(fieldID) async {
   fieldData  =  await DBHelper().getFieldDataWithField(fieldID);
  if (fieldData.length > 0){
    setState(() {

    });
  }
}

void refreshIsDepdent(bool tempIsHide){
  isHide = tempIsHide;
    setState(() {
      
    });
}

void refreshIsEdit(SectionSubSection _sectionSubSection) {
  _sectionSubSection = _sectionSubSection;
  setState(() {
    
  });
}

updatecurrentTimeValue(int value){
  _currentTimeValue = value;
  setState(() {
    
  });
}
@override
bool get wantKeepAlive => true;
}


