import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

class CheckBoxWidget extends StatefulWidget {
final _subSectionDetails;
final  Function _function;
CheckBoxWidget(Key key,this._function,this._subSectionDetails): super(key : key);
@override
  State<StatefulWidget> createState(){
    return CheckBoxWidgetState(_subSectionDetails.isHide);
  }
}

class CheckBoxWidgetState extends State<CheckBoxWidget> with AutomaticKeepAliveClientMixin{
var isHide;
bool _checkBoxBool = false;
CheckBoxWidgetState(this.isHide);
void childCallBack(String fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
}

void initState () {
    super.initState();
    setFieldValue();
}

  setFieldValue() async {
     var _subSectionDetails = widget._subSectionDetails as SectionSubSection;
    if(widget._subSectionDetails.fieldValue.length > 0 && widget._subSectionDetails.subSectionID == 1019){
      var tempFieldValue = _subSectionDetails.fieldValue.split(",")[0];
       _checkBoxBool = tempFieldValue == "1" ? true : false;
     }
  }

@override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails as SectionSubSection;
    return !isHide ? Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
        children: <Widget>[
          Container(
            height: 40.0,
            width: 40.0,
            child: Align(
              alignment: Alignment.topLeft,
              child:Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: (_subSectionDetails.index %2 != 0) ?  Colors.grey : Utility().returnTextFieldBoarderColorWithIndex(Utility().returnThemColorIndex()),
                ),
                child:Checkbox(
                  checkColor: Colors.orange,  // color of tick Mark
                  activeColor: Colors.grey,
                  value: _checkBoxBool,
                  onChanged: (bool value) {
                    _checkBoxBool = value;
                    childCallBack((value) ? 1.toString() : 0.toString());
                    setState(() {
                    });
                  },
                )
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 135.0,
            child: Text(_subSectionDetails.fieldName,
              style: (_subSectionDetails.index %2 != 0) ?  Utility().returnNormalTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
            ),
          ),
        ]
      ),
      ),
    ): Container();
  }


  void refreshIsDepdent(bool tempIsHide){
    // isHide = tempIsHide;
    if(tempIsHide){
      isHide = true;
    }else{
       isHide = false;
    }
    setState(() {
      
    });
  }

  @override
  bool get wantKeepAlive => true;
}

