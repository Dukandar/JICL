import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

class SegmentWidget extends StatefulWidget{
  final  Function _function;
   final _subSectionDetails;
   SegmentWidget(Key  key,this._function,this._subSectionDetails): super(key : key);
  @override
  State<StatefulWidget> createState(){
    return SegmentState(_subSectionDetails.isHide);
  }
}

class SegmentState extends State<SegmentWidget> with AutomaticKeepAliveClientMixin{
  bool checkBoxBool = false;
  var _selectedIndex = 0;
  var isHide;
   SegmentState(this.isHide);
  void childCallBack(String fieldValue){
    widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  @override
  Widget build(BuildContext context){
    var itemCount = (widget._subSectionDetails as SectionSubSection).fieldValue.split(",");
    itemCount.removeAt(0);
    super.build(context);
     return  !isHide ? Container(  
       height: 60.0,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
        ),
        child:ListView.builder(
         scrollDirection: Axis.horizontal,
          itemCount: (itemCount.length == 1) ? ((itemCount[0].length > 0) ? itemCount.length : 0) : itemCount.length, 
          itemBuilder: (context, index) {
             return GestureDetector(
                onTap: ()=>{
                  FocusScope.of(context).unfocus(),
                  gestureTappedWithIndex(index)
                },
              child: Container(
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
                          child:Text(itemCount[index],
                          textAlign: TextAlign.center,
                          style: (index == _selectedIndex) ? Utility().retuenWhilteTextStyle() : Utility().returnBusinssDetailsNormalTextStyle() ,
                        ),
                    )
                )
              );
          }
        )
     ) : Container();
  }
  Future<void> gestureTappedWithIndex(int index) async {
     _selectedIndex = index;
     var tempArray = (widget._subSectionDetails as SectionSubSection).fieldValue.split(",");
     tempArray[0] = "$_selectedIndex";
     childCallBack(tempArray.join(","));
     setState(() {});
  }
@override
bool get wantKeepAlive => true;
}