import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/JICLController.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

class ChangePassword extends StatefulWidget{
  @override
  State<StatefulWidget>createState(){
      return ChangePasswordState();
  }
}

class ChangePasswordState extends State<ChangePassword> implements JICLAPIResponseController{
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> _textEditControllers = returnTextEditingController();
  List<bool> _obscureTextList = [true,true,true,true];
  LoadAPI _loadAPI;
  ChangePasswordState(){
    _loadAPI = LoadAPI(this);
  }
  @override
  Widget build (BuildContext context){
      return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(LabelConstant.kChangePassword),
          backgroundColor: Utility().returnThemColorWithIndex(Utility().returnThemColorIndex()),
          leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>{
               Navigator.pushNamed(context, homeRoute)
            },)
        ),
        body: Container(
          decoration: BoxDecoration(
            image: Utility().returnBackgroundImage()
          ),
          child: _returnChangePasswordFields(),
        ),
      );
  } 

Widget _returnChangePasswordFields(){
  final _fields = returnChangePasswordFileds();
  return Form(
         key: _formKey,
         child: Container(
          padding: EdgeInsets.fromLTRB(14.0,14.0,14.0,0.0),
          color: Colors.white,
          child: ListView.builder(
            itemCount: _fields.length,
            itemBuilder: (BuildContext context,int index){
              final _field = _fields[index];
                return Container(
                  height: 66.0,
                  child: (_field.fieldType == FiledDataType.kTextbox) ? _returnTextBox(_field,_textEditControllers[index],index) : _returnButton(_field),
                );
            }
          )
        ),
        );
}

Widget _returnTextBox(ChangePasswordFields _changePasswordFields,TextEditingController _textEditController,int index){
  return Container(
    margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      decoration: BoxDecoration(
        color: Utility().returnContainerColorWithIndex(Utility().returnThemColorIndex()),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          blurRadius: 18,
          offset: Offset(0.0, 6.0)
        )],
      ),
    child : new TextFormField(
      controller: _textEditController,
      obscureText: (index == 0) ? false : _obscureTextList[index],
      decoration:   InputDecoration( 
      suffixIcon : (index == 0) ? null : InkWell(
              onTap: (){
                _toggle(index);
              },
              child: Icon(
                    _obscureTextList[index]
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 15.0,
                color: Colors.black,
              ),
        ),
        hintText : _changePasswordFields.fieldPlaceHolder,
        hintStyle: Utility().returnLabelStyle(),
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
        border: InputBorder.none,
      ),
      onChanged: (value){
        //_formKey.currentState.validate();
      },
      validator: (value){
        return (value.length <= 0) ? _changePasswordFields.fieldValidation : null;
      },
    )
  );
}

Widget _returnButton(ChangePasswordFields _changePasswordFields){
    return Container(
    margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
       child : RaisedButton(
         color : Colors.white,
        onPressed: () {
          submitButton();
        },
        textColor: Colors.black,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 40.0,
          width: 200.0,
          child: Text(_changePasswordFields.fieldPlaceHolder, 
          style: TextStyle(fontSize: 16,
          color: Colors.white), textAlign: TextAlign.center,),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(8),
            boxShadow: null,
          ),
        ),
      ),
  );
 }

//IBAction : Button action
  void _toggle(int index) {
    setState(() {
      _obscureTextList[index] = !_obscureTextList[index];
    });
  }
  void submitButton(){
    if(_formKey.currentState.validate()){
      if(_textEditControllers[2].text != _textEditControllers[3].text){
         Utility().alertDialog(context,LabelConstant.kNewPasswordErr,0);
      }else{
        Utility().activity(context);
        Future.delayed(const Duration(milliseconds: LabelConstant.kDispatchTime),()async{
           _loadAPI.loadAPI(APIConstant.ChangePassword,returnServiceParam());
        });
      }
    }
  }

  Map<String,dynamic> returnServiceParam(){
     return  {
        "userName"    : _textEditControllers[0].text,
        "oldPassword" : _textEditControllers[1].text,
        "newPassword" : _textEditControllers[2].text,
      };
  }

  @override
  void onLoadAPIError(String _message) {
     Navigator.pop(context);
     Utility().alertDialog(context,_message,0);
  }

  @override
  void onLoadAPIResponse(dynamic _responseData) {
     Navigator.pop(context);
      if(_responseData["Message"] == LabelConstant.kSuccess){
         Utility().alertDialog(context,_responseData["Message"].capitalize(),8000);
      }else{
         Utility().alertDialog(context,_responseData["Message"].capitalize(),0);
      }
  }
}

List<TextEditingController> returnTextEditingController(){
  return [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];
}

List<ChangePasswordFields> returnChangePasswordFileds(){
  return [(new ChangePasswordFields(isManditory: true,fieldPlaceHolder: "Username",fieldType: "textbox",fieldValidation:"Please enter username")),
          (new ChangePasswordFields(isManditory: true,fieldPlaceHolder: "Old password",fieldType: "textbox",fieldValidation:"Please enter old password")),
          (new ChangePasswordFields(isManditory: true,fieldPlaceHolder: "New password",fieldType: "textbox",fieldValidation:"Please enter new password")),
          (new ChangePasswordFields(isManditory: true,fieldPlaceHolder: "Confirm password",fieldType: "textbox",fieldValidation:"Please enter confirm password")),
          (new ChangePasswordFields(isManditory: true,fieldPlaceHolder: "Submit",fieldType: "button",fieldValidation:"Please"))];
}
