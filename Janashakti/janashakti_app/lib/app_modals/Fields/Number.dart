
import 'package:flutter/services.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Number extends StatefulWidget {
  final _subSectionDetails;
  final  Function _function;
  Number(Key key,this._function,this._subSectionDetails): super(key : key);
  @override
  State<StatefulWidget> createState() {
    return NumberState(_subSectionDetails.isHide);
  }
}

class NumberState extends State<Number>with AutomaticKeepAliveClientMixin {
  var isHide;
  NumberState(this.isHide);
  final countryCodeWidgtWidt = 100.0;
  final paddding = 41.0;
  var countryCode = LabelConstant.kDefaultCountryCode;
  var countryID = LabelConstant.kDefaultCountryID;
   final TextEditingController  _textEditingController = TextEditingController();
  void childCallBack(String fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  @override
  Widget build(BuildContext context){
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    countryCode = (_subSectionDetails.fieldValue.length > 0) ? (_subSectionDetails.fieldValue).split("@")[0] : LabelConstant.kDefaultCountryCode;
    countryCode = (countryCode.length > 2) ? countryCode :  LabelConstant.kDefaultCountryCode;
    _textEditingController.text = (_subSectionDetails.fieldValue.replaceAll(",","").length > 0) ? (_subSectionDetails.fieldValue).split("@")[1] : "";
    return !isHide? Container(
      child: new Opacity(
        opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: new Row(
        children: <Widget>[
          Container(
            padding:EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
            width: countryCodeWidgtWidt,
            child:new Row(
               children:<Widget>[
                 Container(
                   color: Color.fromARGB(242, 242, 242, 242),
                   width: 96,
                   child:IgnorePointer(
                        ignoring: (_subSectionDetails.isEditable) ? false : true, 
                        child: _returnCountryCodeWidget(_subSectionDetails) ,
                   )
                 ),
               ]
             )
          ),
          Container(
             width: MediaQuery.of(context).size.width - (countryCodeWidgtWidt + paddding) - 40.0,
             child: _returnPhoneNumberWidget(_subSectionDetails)
          )
         ]
      ),
      )
    ) : Container();
  }


_returnCountryCodeWidget(SectionSubSection _subSectionDetails){
  return 
  new Container(
    child: CountryCodePicker(
      enabled: (_subSectionDetails.isEditable) ? true : false,
      onChanged: (text){
        countryCode = text.dialCode.toString();
        countryID = text.code.toString();
        final value = countryCode + "@" + _textEditingController.text + "@" + countryID;
        childCallBack(value);
      },
      initialSelection: (countryCode.split(",")[0].length> 0) ? countryCode : LabelConstant.kDefaultCountryCode,
      favorite: [LabelConstant.kDefaultCountryCode,LabelConstant.kDefaultCountryID],
       // optional. Shows only country name and flag
         showCountryOnly: false,
         // optional. Shows only country name and flag when popup is closed.
         showOnlyCountryWhenClosed: false,
         // optional. aligns the flag and the Text left
         alignLeft: false
    ),
  );
}

_returnPhoneNumberWidget(SectionSubSection _subSectionDetails){
  return Container(
    child: new Theme(
          data: new ThemeData(
            hintColor: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())
          ),
          child:  new TextFormField(
          readOnly: (_subSectionDetails.isEditable) ? false : true,
           controller: _textEditingController,
           maxLength: 12,
            validator: (value){
                return FormValidator().validateInputText(value, _subSectionDetails);
            },
             onChanged: (text){
                 final value = countryCode + "@" + text + "@" + countryID;
                  childCallBack(value);
             },
            style: Utility().returnBusinssDetailsNormalTextStyle(),
            autofocus: false,
            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
             decoration: InputDecoration(
              counterText: '',
              counterStyle: TextStyle(fontSize: 0),
              border: InputBorder.none,
              labelText:_subSectionDetails.placeHolder,
              labelStyle: Utility().returnLabelStyle(),
              hintText: _subSectionDetails.placeHolder,
              hintStyle: Utility().returnHintStyle(),
               prefixIcon: ImageIcon(
                  AssetImage("assets/images/${_subSectionDetails.fieldID}.png"),
                 size: 10.0,
                 color: Colors.orange,
               ),
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
        )
      ),
        )
  );
}

  void setUpdatedValue(String value) {
    _textEditingController.text = value;
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
