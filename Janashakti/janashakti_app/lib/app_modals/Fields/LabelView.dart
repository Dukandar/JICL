import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

import '../DBHelper.dart';
import '../MasterModals.dart';

class LabelView extends StatefulWidget {

  final _subSectionDetails;
  // final  Function _function;
  LabelView(this._subSectionDetails);

  @override
  State<StatefulWidget> createState(){
    return LabelViewState();
  }

}

class LabelViewState extends State<LabelView> {
  LabelViewState();
  List<FieldData> labelnames = List();

   initState () {
    super.initState();
    setFieldValue();
  }
   setFieldValue() async {
     //1147
     List<FieldData> fieldData  =  await DBHelper().getFieldDataWithField(1147);
     if (fieldData.length > 0){
        labelnames = fieldData;
        setState(() {
          
        });
     }
   }
  @override
  Widget build(BuildContext context) {
    var _subSectionDetails = widget._subSectionDetails as SectionSubSection;
    return (_subSectionDetails.fieldValue == "1") ? new  Container(
      width: MediaQuery.of(context).size.width,
      child: new Column(
        children:<Widget>[
          Container(
            height: 38.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.orangeAccent
            ),
            child:  Center(
              child:Text((_subSectionDetails.fieldDependencyID == 1367) ? LabelConstant.kMainLife : LabelConstant.kSpouse,
               textAlign: TextAlign.center,
                style: Utility().returnLableViewHeaderTextStyle(),
               ) ,
            ), 
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.transparent
            ),
            child: _returnDependentField(context, _subSectionDetails),
          ),
        ]
      ),
    ) : Container();
  }

  _returnDependentField(BuildContext context, _subSectionDetails) {
    return new Opacity(
      opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: labelnames.length,
          itemBuilder: (BuildContext ctxt,int index){
            return Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(labelnames[index].fieldValue,
                      style: Utility().returnLabelViewRiderDescTextStyle(),
                    ),
                  )
                )
              ]
            );
          }
        ),
      )
    );
  }
}