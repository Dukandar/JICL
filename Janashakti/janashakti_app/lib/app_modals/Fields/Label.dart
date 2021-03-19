import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Utility.dart';


class CustomeLabel extends StatefulWidget{
   final _subSectionDetails;
  CustomeLabel(Key key,this._subSectionDetails) : super(key:key);
  @override
  State<StatefulWidget> createState(){
    return CustomeLabelState(_subSectionDetails.isHide);
  }
}

class CustomeLabelState extends State<CustomeLabel>with AutomaticKeepAliveClientMixin{
  var isHide;
  CustomeLabelState(this.isHide);
  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
     return !isHide ? Container(
    child:  Center(
      child: Container(
             decoration: BoxDecoration(
                  color:Utility().returnThemColorWithIndex(Utility().returnThemColorIndex()),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(
                      color:Colors.grey,
                      blurRadius: 18,
                      offset: Offset(0.0, 6.0))],
                ),
            margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 2.0),
            child:Center(
              child: Text(_subSectionDetails.fieldName,
                textAlign:TextAlign.center,
                style: Utility().returnHeaderTextStyle()
              ),
            )
      )
    )
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


class Label extends StatefulWidget {
   final _subSectionDetails;
  Label(Key key,this._subSectionDetails) : super(key : key);
  @override
  State<StatefulWidget> createState(){
    return LabelState(_subSectionDetails.isHide);
  }
}
class LabelState extends State<Label> with AutomaticKeepAliveClientMixin{
  var isHide;
  LabelState(this.isHide);
  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !isHide ? Container(
    child: Text(_subSectionDetails.fieldName,
                 textAlign:TextAlign.left,
                  style: Utility().returnBusinssDetailsNormalTextStyle()
                  ),
  ) : Container();
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

class ImageLabel extends StatefulWidget {
   final _subSectionDetails;
  ImageLabel(Key key,this._subSectionDetails) : super(key : key);
  @override
  State<StatefulWidget> createState(){
    return ImageLabelState(_subSectionDetails.isHide);
  }
}

class ImageLabelState extends State<ImageLabel> with AutomaticKeepAliveClientMixin{
  var isHide;
  ImageLabelState(this.isHide);
  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !isHide ? Container(
    child: Row(
      children:<Widget>[
        Container(
          height: 60,
          width: 100,
          decoration:new BoxDecoration(
            image: new DecorationImage(
             image: ExactAssetImage("assets/images/${_subSectionDetails.fieldID}.png"),
              fit: BoxFit.fitHeight,
      ),
          )
        
        ),
         Container(
            height: 40,
          width: 100,
         child: Center(
           child: Text(_subSectionDetails.fieldName,
                 textAlign:TextAlign.left,
                  style: TextStyle(
                    shadows: [
            Shadow(
                blurRadius: 15.0,
                offset: Offset(6.0, 6.0),
                ),
            ],
                  color: Colors.orange,
                  fontSize: 16.0,
                  )
                  ),
            )
        )
      ]
    )
    
  ) : Container();
  }
  
  void refreshState(bool tempIsHide){
    isHide = tempIsHide;
    setState(() {
      
    });
  }

  @override
  bool get wantKeepAlive => true;
}



