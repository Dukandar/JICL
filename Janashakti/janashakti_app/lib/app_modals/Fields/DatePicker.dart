import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';

class DatePicker extends StatefulWidget {
  final  Function _function;
  final _subSectionDetails;
  DatePicker(Key key,this._function,this._subSectionDetails) : super(key : key);
  @override
  State<StatefulWidget> createState(){
    return DatePickerState(_subSectionDetails.isHide);
  }
}

class DatePickerState extends State<DatePicker> with AutomaticKeepAliveClientMixin{
 var isHide;
 DatePickerState(this.isHide);
  final TextEditingController  _textEditingController = TextEditingController();
  void childCallBack(String fieldValue){
    widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  @override
  void initState () {
    super.initState();
    updateFiledValue();
  }

  void updateFiledValue(){
    if(widget._subSectionDetails.subSectionID == 1019){
       _textEditingController.text  =  widget._subSectionDetails.fieldValue.split(",")[0];
    }else if((widget._subSectionDetails.fieldValue.length > 0)){
      final fieldValueDetails = widget._subSectionDetails.fieldValue.split("-");
      final day = fieldValueDetails[2].length == 1 ? "0${fieldValueDetails[2]}" : "${fieldValueDetails[2]}";
     _textEditingController.text =  "$day/${fieldValueDetails[1]}/${fieldValueDetails[0]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
     var _subSectionDetails = widget._subSectionDetails as SectionSubSection;
     return new GestureDetector(
         onTap:()=>{
           FocusScope.of(context).unfocus(),
            if(_subSectionDetails.isEditable){
              setDatePicker(context,_subSectionDetails)
            }
         },
         child :!isHide? Container(
          child: new Opacity(
            opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
            child: Row(
            children:<Widget>[
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width - 141,
                  child: returnDateTextFieldWith(_subSectionDetails),
              ),
              )
              
              // Container(
              //   width: 50,
              //   color: Color.fromARGB(242, 242, 242, 242),
              //   child: returnImage(),
              // ),
              //new Spacer(),
              // _subSectionDetails.isManditory == true ? Container(
              //   width: 10.0,
              //   height: 10.0,
              //   margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
              //   child:  Icon(Icons.star, color: Colors.red, size: 10.0), //(_subSectionDetails.isMandatory == true) ? Icon(Icons.star, color: Colors.red, size: 10.0) : Icon(Icons.star, size: 0.0),
              // ) : Container(),
            ]
          ) ,
            )
        ) : Container()
      );
  }

  returnImage() {
    return Container(
      width: 30,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/datepicker.png"))
      ),
  );
}

returnDateTextFieldWith(SectionSubSection _subSectionDetails) {
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
          // ignore: missing_return
          validator: (value){
            return FormValidator().validateInputText(value, _subSectionDetails);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: _subSectionDetails.placeHolder,
            labelStyle: Utility().returnLabelStyle(),
            hintText: _subSectionDetails.placeHolder,
            hintStyle: Utility().returnHintStyle(),
            prefixIcon: ImageIcon(
              AssetImage("assets/images/${_subSectionDetails.fieldID}.png"),
              size: 10.0,
              color: Colors.orange,
            ),
            contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 15.0),
        )
      ),
      )
    ),
  );
}

Future<Null> setDatePicker(BuildContext context,_subSectionDetails) async {
  //DateTime.now().subtract(Duration(days: 0))
    final DateTime picked = await showDatePicker(
        locale: const Locale('en', 'US'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: returnFirstDate(),
        lastDate: returnEndDate(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: new ThemeData(
              primaryColor: Color(0x335C81),//Head background
              colorScheme: ColorScheme.light(primary: Utility().returnThemColorWithIndex(Utility().returnThemColorIndex())),
              dialogBackgroundColor: Colors.white,//Background color
            ),
            child: child,
          );
        }
    );

    if (picked != null && picked != DateTime.now()) {
      final dateString = "${picked.day.toString().padLeft(2,'0')}/${picked.month.toString()}/${picked.year.toString().padLeft(2,'0')}";
       _textEditingController.text = dateString;
      //  final selectedDate = DateTime.parse("${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}");
      //  Duration duration = DateTime.now().difference(selectedDate);
      //  final numberOfYears = (duration.inDays / 365).floor().toString();
       childCallBack("${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}");
    }
 }


 dynamic returnFirstDate(){
   if ((widget._subSectionDetails as SectionSubSection).fieldID == 1076 && ((widget._subSectionDetails as SectionSubSection).fieldDependencyID == 1121)) {
     return  (DateTime.now().subtract(Duration(days: 0)));
   }else if((widget._subSectionDetails as SectionSubSection).fieldID == 1076 && ((widget._subSectionDetails as SectionSubSection).fieldDependencyID == 1127)){
     return (DateTime.now().subtract(Duration(days: 0))) ;
   }else if((widget._subSectionDetails as SectionSubSection).fieldID == 1420 && ((widget._subSectionDetails as SectionSubSection).fieldDependencyID == 1688)){
     return ( DateTime.now().subtract(Duration(days: 0)));
   }else{
     return DateTime(kStartDate);
   }
 }

 dynamic returnEndDate(){
   if((widget._subSectionDetails as SectionSubSection).fieldID == 1076 && ((widget._subSectionDetails as SectionSubSection).fieldDependencyID == 1127)){
     return ( DateTime.now().subtract(Duration(days: 0)));
   }else{
     return DateTime(kEndDate);
   }
 }

  void updateVale(String value){
    if(value.length > 0){
       final tempArray = value.split("-");
      _textEditingController.text = "${tempArray[2]}/${tempArray[1]}/${tempArray[0]}";
    }else{
      _textEditingController.text = "";
    }
  }
  void setUpdatedValue(String value, SectionSubSection _sectionSubSection) {
    _sectionSubSection = _sectionSubSection;
    setState(() {
      
    });
    final tempArray = value.split("-");
    _textEditingController.text = "${tempArray[2]}/${tempArray[1]}/${tempArray[0]}";
  }

 void setRefreshState(bool tempIsHide){
   isHide = tempIsHide;
   setState(() {
     
   });
 }
 @override
  bool get wantKeepAlive => true;
}


