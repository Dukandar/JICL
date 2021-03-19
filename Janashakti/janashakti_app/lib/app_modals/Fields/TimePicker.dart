import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:jiclapp/app_util/Utility.dart';

class TimePicker extends StatefulWidget {

  final _subSectionDetails;
  final  Function _function;
  TimePicker(Key key,this._function,this._subSectionDetails): super(key : key);

  @override
  State<StatefulWidget> createState(){
    return TimePickerState();
  }
}

class TimePickerState extends State<TimePicker> with AutomaticKeepAliveClientMixin{
final format = DateFormat("hh:mm a");
final TextEditingController  _textEditingController = TextEditingController();
  void childCallBack(String fieldValue){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }
  
  void initState () {
    super.initState();
    setFieldValue();
  }

  setFieldValue() async {
    if (widget._subSectionDetails.fieldValue.length > 0){
      final filedValue = widget._subSectionDetails.fieldValue;
      final time = DateTime.parse(filedValue);
      final temp = DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time.hour.toString() + ":" + time.minute.toString() + ":" + "00")); 
      _textEditingController.text = temp.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return Container(
      //color: (_subSectionDetails.isEditable) ? Colors.white : Colors.grey.withOpacity(0.1),
      child: new Opacity(
        opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: AbsorbPointer(
          absorbing : (_subSectionDetails.isEditable) ? false : true,
          child:new Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 81,
              child: Theme(
              data: ThemeData(primarySwatch: Colors.orange,
              hintColor: (_subSectionDetails.index %2 != 0) ? Colors.grey : Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())), 
               child: DateTimeField(
                 controller:_textEditingController ,
                 style: Utility().returnBusinssDetailsNormalTextStyle() ,
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    FocusScope.of(context).unfocus();
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    );
                      childCallBack(DateTimeField.convert(time).toString());
                      return DateTimeField.convert(time);
                    },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: _subSectionDetails.placeHolder,
                    hintText: _subSectionDetails.placeHolder,
                    prefixIcon: ImageIcon(
                       AssetImage("assets/images/${_subSectionDetails.fieldID}.png"),
                      size: 10.0,
                      color: Colors.orange,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                  )
              )
            ),
            ),
            new Spacer(),
            _subSectionDetails.isManditory == true ? Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
              child: Icon(Icons.star, color: Colors.red,
                  size: 10.0), //(_subSectionDetails.isMandatory == true) ? Icon(Icons.star, color: Colors.red, size: 10.0) : Icon(Icons.star, size: 0.0),
            ) : Container(),
          ]
      ),
        )
      )
    );
  }
  @override
  bool get wantKeepAlive =>true;
}