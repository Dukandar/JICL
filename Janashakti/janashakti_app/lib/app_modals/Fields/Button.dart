import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {

  final _subSectionDetails;
  final  Function _function;
  ButtonWidget(Key key,this._function,this._subSectionDetails) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return ButtonWidgetState((_subSectionDetails.sectionID == 2002 &&_subSectionDetails.fieldID == 1106) ? false : ((_subSectionDetails.sectionID == 2000 || _subSectionDetails.sectionID == 2001) &&_subSectionDetails.fieldID == 1105) ? false :_subSectionDetails.isHide);
  }
}

class ButtonWidgetState extends State<ButtonWidget> {
var isHide;
ButtonWidgetState(this.isHide);
void childCallBack(){
  widget._function(widget._subSectionDetails);
}
  @override
  Widget build(BuildContext context) {
    var _subSectionDetails = widget._subSectionDetails;
    return !isHide ? Center(
      child: RaisedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          childCallBack();
        },
        textColor: Colors.black,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 40.0,
          width: 200.0,
          child: Text(_subSectionDetails.fieldName, 
          style: TextStyle(fontSize: 16,
          color: Colors.white), textAlign: TextAlign.center,),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(
              color: Colors.grey,
                blurRadius: 18,
                offset: Offset(0.0, 6.0))],
          ),
        ),
      ),
    ) : Container();
  }
  void setRefreshState(bool tempIsHide){
   isHide = tempIsHide;
   setState(() {
     
   });
 }
}