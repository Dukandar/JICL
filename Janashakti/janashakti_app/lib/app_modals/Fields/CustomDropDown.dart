
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';
import '../DBHelper.dart';
import '../MasterModals.dart';

class CustomDropDownWidget extends StatefulWidget{
  final _subSectionDetails;
  final  Function _function;
  CustomDropDownWidget(Key key,this._function,this._subSectionDetails): super(key : key);
  @override
  State<StatefulWidget> createState(){
    return CustomDropDownState(_subSectionDetails.isHide);
  }
}

class CustomDropDownState extends State<CustomDropDownWidget> with AutomaticKeepAliveClientMixin{
  bool isHide;
  CustomDropDownState(this.isHide);
  final TextEditingController  _textEditingController = TextEditingController();
  var filterList = [];
  var fieldData = [];
  List<String> fieldValues = List();
  void childCallBack(String fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  void initState () {
    super.initState();
    _getFiedData((widget._subSectionDetails  as SectionSubSection).fieldID, context, widget._subSectionDetails,false);
    setFieldValue();
  }
  void setFieldValue() {
    if((widget._subSectionDetails  as SectionSubSection).fieldValue.length > 0){
       fieldValues = jsonDecode((widget._subSectionDetails  as SectionSubSection).fieldValue);
       _textEditingController.text = fieldValues.toString();
    }
  }
  
String returnSelectedValues() {
    List<String> stringValues = List();
    for(var i=0;i <filterList.length ;i++){
        final data = filterList[i] as FieldData;
        if(fieldValues.contains("${data.dataID}")){
            stringValues.add((filterList[i] as FieldData).fieldValue);
        }
    }
    return stringValues.join(",");
}


  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails  as SectionSubSection;
    return new GestureDetector(
      onTap:()=>{
         FocusScope.of(context).unfocus(),
         if(_subSectionDetails.isEditable){
           _getFiedData(_subSectionDetails.fieldID,context,_subSectionDetails,true)
         }
      },
      child : !isHide? Container(
        child: new Opacity(
          opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
          child:new Row(
            children:<Widget>[
              Flexible(
                   child: Container(
                   width: MediaQuery.of(context).size.width - 64.0,
                  child: returnDropDownWith(_subSectionDetails),
                )
               ),
              _subSectionDetails.isManditory == true ? Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
                child:  Icon(Icons.star, color: Colors.red, size: 10.0), //(_subSectionDetails.isMandatory == true) ? Icon(Icons.star, color: Colors.red, size: 10.0) : Icon(Icons.star, size: 0.0),
              ) : Container(),
            ]
          ) ,
        )
      ): Container()
    );
  }

  returnDropDownWith(SectionSubSection _subSectionDetails){
  return AbsorbPointer(
    child: Container(
      child: new Theme(
        data: new ThemeData(
         hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
        ),
        child: new TextFormField(
          controller: _textEditingController,
          style: Utility().returnBusinssDetailsNormalTextStyle(),
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: _subSectionDetails.placeHolder,
            labelStyle: Utility().returnLabelStyle(),
            hintText: _subSectionDetails.placeHolder,
            hintStyle: Utility().returnHintStyle(),
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
            suffixIcon: Icon(Icons.keyboard_arrow_down,
             color: Utility().returnIconColor()
             ),
              prefixIcon: ImageIcon(
                 AssetImage("assets/images/${_subSectionDetails.fieldID}.png"),
                size: 10.0,
                color: Colors.orange,
              ),
            errorStyle: TextStyle(
                    fontSize:14.0
                  )
          ),
          validator: (value){
            return FormValidator().validateInputText(value, _subSectionDetails);
          },
        )
      )
    ),
  );
}

//MARK:- 
_returnDialogWithBuildContext(BuildContext context,List<FieldData>fieldData,String title){
  showDialog(
    context: context,
    builder: (BuildContext ctxt){
      return AlertDialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: StatefulBuilder(
          builder: (BuildContext altCntx,StateSetter setState){
            return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
             Container(
               child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 168.0,
                      child: Text(title,
                        textAlign: TextAlign.center,
                        // maxLines: 2,
                        style: Utility().retuenLargeTextStyle(),
                      ),
                    ),
                    Container(
                      width: 40.0,
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          iconSize: 20,
                          icon: Icon(
                            Icons.close,
                          ),
                          onPressed: () => Navigator.pop(altCntx),
                        ),
                      ),
                    ),
                  ],
               ),
             ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: LabelConstant.kSearch,
                    //add icon outside input field
                    icon: Icon(Icons.search),
                  ),
                      onChanged: (data){
                         filterList = [];
                        fieldData.forEach((element) {
                          if(element.fieldValue.toLowerCase().contains(data.toLowerCase())){
                            filterList.add(element);
                          }
                        });
                        setState(() {
                          
                        });
                      },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                height: (MediaQuery.of(context).size.height * 0.7) - 120.0,
                width: MediaQuery.of(context).size.width,
                child:   ListView.builder(
                  shrinkWrap: true,
                  itemCount: filterList.length,
                  itemBuilder: (BuildContext context, int listIndex){
                     return Row(
                      children: [
                        Container(
                          child: Checkbox(
                                   checkColor: Colors.orange,  // color of tick Mark
                                   activeColor: Colors.grey,
                                   value: (fieldValues.length > 0) ? ((fieldValues.contains(("${(filterList[listIndex] as FieldData).dataID}"))) ? true : false) : false,
                                   onChanged: (bool value) {
                                   if(fieldValues.contains("${(filterList[listIndex] as FieldData).dataID}")){
                                     final index = fieldValues.indexOf(("${(filterList[listIndex] as FieldData).dataID}"));
                                     fieldValues.removeAt(index);
                                   }else{
                                     fieldValues.add("${(filterList[listIndex] as FieldData).dataID}");
                                   }
                                   setState(() {
                                   });
                     },
                    )
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 40.0,
                          child: Text((
                                    filterList[listIndex] as FieldData).fieldValue,
                                    style: Utility().returnRiderHeaderTextStyle()
                                    ),
                        ),
                      ],
                     );
                  })
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                height : 50.0,
                color: Colors.transparent,
                child:Center(
                  child: RaisedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      childCallBack(jsonEncode(fieldValues));
                      Navigator.pop(altCntx);
                      _textEditingController.text = returnSelectedValues();
                    },
                    textColor: Colors.black,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 40.0,
                      width: 200.0,
                      child: Text(LabelConstant.kDone, 
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
                ), 
              )
              ],
           );
          }
        )
      );
    }
  );
}

//MARK:- Search 
searchOperation(String searchText) {
}

//MARK: Click
selectedData(FieldData fieldData,BuildContext context){
    _textEditingController.text = fieldData.fieldValue;
    childCallBack(fieldData.fieldDataID.toString());
     Navigator.of(context).pop();
}

_getFiedData(int fieldId,BuildContext context,_subSectionDetails, bool isPopUp) async {
    List<FieldData> fieldData  =  await DBHelper().getFieldDataWithField(fieldId);
    fieldData = fieldData;
    filterList = fieldData;
     if (filterList.length > 0 && isPopUp){
        _returnDialogWithBuildContext(context,filterList,_subSectionDetails.fieldName);
     }
}

void refreshIsDepdent(bool tempIsHide){
    isHide = tempIsHide;
    setState(() {});
}
  @override
  bool get wantKeepAlive => true;
}
