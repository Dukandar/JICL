import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';
import '../DBHelper.dart';

class CustomeSpinner extends StatefulWidget {

  final _subSectionDetails;
  final  Function _function;
  CustomeSpinner(Key key,this._function,this._subSectionDetails): super(key : key);
  @override
  State<StatefulWidget> createState(){
    return CustomeSpinnerState();
  }
}

class CustomeSpinnerState extends State<CustomeSpinner> with AutomaticKeepAliveClientMixin{
  CustomeSpinnerState();
   var filterList = [];
  var fieldData = [];
  String fieldDataID = "";
  final TextEditingController  _dropDowntextEditingController = TextEditingController();
  final TextEditingController  _textEditingController = TextEditingController();
  void childCallBack(fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  void initState () {
    super.initState();
    setInitValue();
  }

  Future<void> setInitValue() async {
     final tempArray = widget._subSectionDetails.fieldValue.split(",");
    if(tempArray.length > 1){
      _textEditingController.text = tempArray[0];
       List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID(tempArray[1], widget._subSectionDetails.fieldID);
      if (fieldDataDetails.length > 0) {
         final fieldDataDetail = fieldDataDetails[0];
        _dropDowntextEditingController.text = fieldDataDetail.fieldValue;
      }else{
        _dropDowntextEditingController.text = tempArray[1];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails as SectionSubSection;
    return new Container(
       child: new Opacity(
        opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: new Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 244.0,
            child:  returnTextBoxWithIndex(_subSectionDetails),
          ),
          Container(
            width: 2.0,
            height: 50.0,
            color: Colors.orange,
          ),
          Container(
            width: 150.0,
            child: returnDropDownWithIndex(context,_subSectionDetails),
          ),
        ]
        )
       )
    );
  }

  //MARK:- TextBox
  returnTextBoxWithIndex(SectionSubSection _subSectionDetails){
    return Container(
      color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
      child: new Theme(
        data: new ThemeData(
          hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
        ),
        child:TextFormField(
          controller:  _textEditingController,
          onChanged: (text){
            childCallBack(_textEditingController.text + "," + fieldDataID);
          },
          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          style: Utility().returnBusinssDetailsNormalTextStyle(),
          autofocus: false,
          decoration: InputDecoration(
            labelText: _subSectionDetails.placeHolder,
            contentPadding: EdgeInsets.fromLTRB(10.0,10.0,20.0, 15.0),
            border: InputBorder.none,
          ),
          validator: (value){
            return (value.length <= 0) ? FormValidator().validateInputText(value,_subSectionDetails) : null;
          },
        ) 
      ) 
    );
  }

//MARK: DropDown
  returnDropDownWithIndex(BuildContext context, SectionSubSection _subSectionDetails){
    return Container(
      color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
      height: 48.0,
      child: GestureDetector(
        onTap:()=>{
          FocusScope.of(context).unfocus(),
          // if (_subSectionDetails.isEditable){
            _returnDialogWithBuildContext(context,_subSectionDetails)
          // }
        },
        child:Padding(
          padding: EdgeInsets.all(0.0),
          child: AbsorbPointer(
            child : new Theme(
              data: new ThemeData(
                hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
              ),
              child: TextFormField(
                controller:  _dropDowntextEditingController,
                style: Utility().returnBusinssDetailsNormalTextStyle(),
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText:_subSectionDetails.placeHolder,
                  contentPadding: EdgeInsets.fromLTRB(10.0,10.0,20.0, 15.0),
                  suffixIcon: new Icon(Icons.keyboard_arrow_down, color : Colors.orange),
                  border:InputBorder.none,
                ),
              ),
            )
          ) 
        ),
      )
    );
  }

  _returnDialogWithBuildContext(BuildContext context,SectionSubSection _subSectionDetails) async {
    List<FieldData> fieldData = await DBHelper().getFieldDataWithField(_subSectionDetails.fieldID);
    fieldData = fieldData;
    filterList = fieldData;
    if (filterList.length >0) {
      retunrDialog(_subSectionDetails.fieldName);
    }
  }

  //MARK:- Dialog
  retunrDialog(String title){
    showDialog(
      context: context,
      builder: (BuildContext ctxt){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: LabelConstant.kSearch,
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
                        height: (MediaQuery.of(context).size.height * 0.7) - 4.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          children: filterList.map((data) => ListTile(
                            title: Text(data.fieldValue),
                            onTap: ()=>{
                              FocusScope.of(context).unfocus(),
                              selectedData(data,altCntx)
                            }
                        )
                      ).toList(),
                    ),
                  ),
                ],
              );
            }
          )
        );
      }
    );
  }

  selectedData(FieldData fieldData,BuildContext context){
   _dropDowntextEditingController.text = fieldData.fieldValue;
   fieldDataID =  fieldData.fieldDataID;
   childCallBack(_textEditingController.text + "," +  fieldDataID);
    Navigator.of(context).pop();
  }
  Future<void> updateStateWith(String fieldValue) async {
     final tempArray = fieldValue.split(",");
    if(tempArray.length > 1){
      _textEditingController.text = tempArray[0];
       List<FieldData> fieldDataDetails = await DBHelper().getFieldDataWithFieldDataID(tempArray[1], widget._subSectionDetails.fieldID);
      if (fieldDataDetails.length > 0) {
         final fieldDataDetail = fieldDataDetails[0];
        _dropDowntextEditingController.text = fieldDataDetail.fieldValue;
      }else{
        _dropDowntextEditingController.text = tempArray[1];
      }
    }else{
      _textEditingController.text = "";
      _dropDowntextEditingController.text = "";
    }
  }
@override
bool get wantKeepAlive => true;
}