
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Utility.dart';

class DependentView extends StatefulWidget{
  final  Function _function;
  final _subSectionDetails;
  DependentView(Key  key,this._function,this._subSectionDetails):super(key : key);
  @override
  State<StatefulWidget> createState() {
    return DependentViewState(_subSectionDetails.isHide);
  }
}

class DependentViewState extends State<DependentView> with AutomaticKeepAliveClientMixin{
  var isHide;
  DependentViewState(this.isHide);
  int _childCount = 0;

  void initState () {
    super.initState();
    _childCount =  (widget._subSectionDetails.fieldValue.length > 0) ? int.parse(widget._subSectionDetails.fieldValue) : 0;
  }

  void childCallBack(String fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !isHide ? Container(
      child: new Opacity(
        opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: new Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 231.0,
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
              child: Text(_subSectionDetails.fieldName,
                style: Utility().returnBusinssDetailsNormalTextStyle(),
              ),
            ),
            new Spacer(),
            Container(
              width: 150.0,
              height: 40.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 30.0,
                    child: new FloatingActionButton(
                      heroTag: null,
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_subSectionDetails.isEditable){
                           add();
                        }
                      },
                      child: new Icon(Icons.add, color: Colors.white, size: 30.0),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex()))
                    ),
                    child: Center(
                      child: new Text('$_childCount', textAlign: TextAlign.center,
                        style: Utility().returnBusinssDetailsNormalTextStyle(),
                      ),
                    ),
                  ),
                Spacer(),
                  Container(
                    width: 30.0,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                    child: new FloatingActionButton(
                      heroTag: null,
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                          if (_subSectionDetails.isEditable){
                            minus();
                          }
                      },
                      child: new Icon(Icons.remove, color: Colors.white, size: 30.0),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
        )
    ) : Container();
  }

  void refreshIsDepdent(bool tempIsHide){
    isHide = tempIsHide;
    setState(() {
      
    });
  }

  void refreshState(int value){
    _childCount = value;
    setState(() {
    });
  }

  void add() {
   _childCount = _childCount + 1;
   childCallBack(_childCount.toString());
    setState(() {});
  }

  void minus() {
    if (_childCount == 0 ){
      return;
    }
    _childCount = _childCount - 1;
    childCallBack(_childCount.toString());
     setState((){});
 } 
 @override
  bool get wantKeepAlive => true;
}