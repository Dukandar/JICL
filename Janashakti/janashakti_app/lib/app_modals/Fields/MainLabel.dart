import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLabel extends StatefulWidget{
  final _subSectionDetails;
  MainLabel(Key key,this._subSectionDetails) : super(key:key);

  @override
  State<StatefulWidget> createState(){
    return MainLabelState();
  }
}

class MainLabelState extends State<MainLabel>with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
      return Container(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Text(_subSectionDetails.fieldName,
            textAlign: TextAlign.justify,
            style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 0.0,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            color: Colors.black,
            fontSize: 14.0,
          )
        ),
      )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
