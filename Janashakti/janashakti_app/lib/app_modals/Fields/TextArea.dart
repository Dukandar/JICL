import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Utility.dart';

class TextArea extends StatefulWidget{
  final _subSectionDetails;
  final  Function _function;
  TextArea(Key key,this._function,this._subSectionDetails):super(key:key);
  @override
  State<StatefulWidget> createState(){
    return TextAreaState(_subSectionDetails.isHide);
  }
}

class TextAreaState extends State<TextArea>with AutomaticKeepAliveClientMixin{
  var isHide;
  TextAreaState(this.isHide);
  final TextEditingController  _textEditingController = TextEditingController();
  void childCallBack(String fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  @override
  Widget build(BuildContext contxt){
    super.build(context);
    final _subSectionDetails = widget._subSectionDetails;
    _textEditingController.text = (_subSectionDetails.fieldValue.length > 0) ? _subSectionDetails.fieldValue : "";
    return !isHide? Container(
        child: new Opacity(
          opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
          child: Padding(
          padding: EdgeInsets.all(8.0),
          child : new Theme(
                      data: new ThemeData(
                        hintColor: (_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex()),
                      ),
          child:TextFormField(
          controller: _textEditingController,
          readOnly: (_subSectionDetails.isEditable) ? false : true,
          keyboardType: TextInputType.multiline,
          style: Utility().returnBusinssDetailsNormalTextStyle() ,
          maxLines:8,
          decoration:InputDecoration(
              labelText: _subSectionDetails.placeHolder,
              border: InputBorder.none,
              hintText: _subSectionDetails.placeHolder,
          prefixIcon: (isFieldID(_subSectionDetails.fieldID)) ? null : ImageIcon(
                 AssetImage("assets/images/${_subSectionDetails.fieldID}.png"),
                size: 10.0,
                color: Colors.orange
              ),
          ),
          onChanged: (text){
                childCallBack(text);
            },
        )          
          )
        ),
          )
    ) : Container();
  }
  
  bool isFieldID(int fieldID){
    final fieldAray = [1158];
    if (fieldAray.contains(fieldID)){
      return true;
    }
    return false;
  } 

  void refreshState(String value){
    isHide = (value == "1382") ? false : true;
    setState(() {
      });
  }
  void refreshValue(String value){
    _textEditingController.text = value;
  }
  @override
  bool get wantKeepAlive=> true;
}