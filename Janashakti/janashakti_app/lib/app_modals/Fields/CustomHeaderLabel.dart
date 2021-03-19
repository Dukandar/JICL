
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

class CustomHeaderLable extends StatefulWidget{ 
  final SectionSubSection _sectionSubSection;
  CustomHeaderLable(Key key,this._sectionSubSection): super(key : key);
  @override
  State<StatefulWidget> createState(){
    return CustomeHeaderLableState();
  }
}
class CustomeHeaderLableState extends State<CustomHeaderLable>{
CustomeHeaderLableState();
TextEditingController  _textEditingController = TextEditingController();
void initState () {
   super.initState();
     _textEditingController.text = widget._sectionSubSection.fieldValue;
}
@override
  Widget build(BuildContext context){
    return _returnContainer();
  }
 Widget _returnContainer(){
    return Container(
      height: 56.0,
      child:  _returnTextFiledWith(widget._sectionSubSection),
    );
 }
  Widget _returnTextFiledWith(SectionSubSection _subSectionDetails){
    return TextFormField(
                controller: _textEditingController,
                readOnly: (_subSectionDetails.isEditable) ? false : true,
                style: Utility().returnBusinssDetailsNormalTextStyle(),
                autofocus: false,
                decoration: InputDecoration(
                    counterStyle: TextStyle(fontSize: 0),
                    labelText: _subSectionDetails.placeHolder,
                    labelStyle: Utility().returnLabelStyle(),
                    border: InputBorder.none,
                    hintText:  _subSectionDetails.placeHolder,
                    hintStyle: Utility().returnHintStyle(),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                ),
          );
      }

  void updateCurrentState(String _value){
    _textEditingController.text = _value;
  }
}