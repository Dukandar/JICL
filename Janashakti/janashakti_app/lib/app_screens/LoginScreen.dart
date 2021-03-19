import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:device_info/device_info.dart';
import 'package:jiclapp/app_modals/JICLController.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return LoginScreeSate();
  }
}

class LoginScreeSate extends State<LoginScreen> implements JICLAPIResponseController{
  GlobalKey<FormState> _key = new GlobalKey();
  LoadAPI _loadAPI;
  var object = {1 : TextEditingController(),2:TextEditingController()};
  BuildContext loginContext;
  bool _obscureText = true;
   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
   Map<String, dynamic> _deviceData = <String, dynamic>{};

    LoginScreeSate(){
      _loadAPI = LoadAPI(this);
    }

  @override
  void initState(){
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try{
     if (Platform.isAndroid) {
        _deviceData = Utility().readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        _deviceData = Utility().readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    }on PlatformException {
      _deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
  }

  Widget build(BuildContext context){
    loginContext = context;
     return new WillPopScope(
       onWillPop: () async => false,
       child: Scaffold(
      body: Center(
        child: new Container(
         decoration: BoxDecoration(
           image: DecorationImage(
              image: AssetImage("assets/images/login-bg.jpg"),
              fit: BoxFit.cover
         ),
        ),
        child: Center(
          child: new SingleChildScrollView(
            child: new Container(
              child: new Form(
                key: _key,
                child:childContainer()
              ),
            ),
          ),
        ),
      ),
     )
     ),
     );
  }

Widget childContainer(){
  return new Column(
    children :<Widget>[
      new Image.asset(
        ('assets/images/launchLogo.png'),
        width : 150,
        height : 150,
      ),
      Text(LabelConstant.kLoginDetails,
      style: TextStyle(
         shadows: [
            Shadow(
                blurRadius: 10.0,
                offset: Offset(6.0, 6.0),
                ),
            ],
        color:Colors.white,
        fontSize: 28.0,
        fontFamily: "Helvetica",
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
         
      ),
      ),
      fromUI(),
      Container(
        color: Colors.transparent,
        height: 160.0,
        margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(LabelConstant.kYourLife, 
            textAlign: TextAlign.center,
            style: TextStyle(
            shadows: [
            Shadow(
                blurRadius: 10.0,
                // color: Colors.orange,
                offset: Offset(6.0, 6.0),
                ),
            ],
            color:Colors.white,
            fontSize: 20.0,
            fontFamily: "Helvetica",
            fontWeight: FontWeight.bold
      ),
      ),
      SizedBox(height: 14),
       Text(LabelConstant.kProtecting,
             textAlign: TextAlign.center,
             style: TextStyle(
                shadows: [
            Shadow(
                blurRadius: 10.0,
                offset: Offset(6.0, 6.0),
                ),
            ],
             color:Color.fromRGBO(255, 143, 0, 1.0),
             fontSize: 20.0,
            fontFamily: "Helvetica",
            fontWeight: FontWeight.bold
         ),
         )
          ]
        ),
      ),

    ]
  );
}

Widget fromUI(){
  return Center(
    child: new Container(
       margin: new EdgeInsets.all(14.0),
       decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
         boxShadow: [BoxShadow(
          //  color: 
          //     Colors.orange.withOpacity(0.6), 
              blurRadius: 18,
              offset: Offset(6.0, 6.0))]
      ),
      child: Column(
        children : <Widget>[
          getTextFieldForm(),
          new InkWell(
            child : Text(
              '',
               style: TextStyle(color: Colors.black54)
            )
          ),
          new InkWell(
            child : RaisedButton(
              shape : RoundedRectangleBorder(
                borderRadius : BorderRadius.circular(20)
              ),
              color: Colors.orange,
              child: Text('Log In', style: TextStyle(color: Colors.white)),
              onPressed:logOnBtnTapped,
            )
          ),
          new InkWell(
            child : Text(
              '',
               style: TextStyle(color: Colors.black54)
            )
          ),
        ]
      ),
    ),
  );
}

logOnBtnTapped() async {
  if (_key.currentState.validate()) {
    Utility().activity(context);
    Future.delayed(const Duration(milliseconds: LabelConstant.kDispatchTime),()async{
      final  Map<String,dynamic>  _details =  {"userName" :object[1].text.toUpperCase().trimChar(),
                                               "password" : object[2].text,
                                               "isiOS" : (Platform.isIOS ? true : false),
                                               "deviceData" : _deviceData};
      _loadAPI.loadAPI(APIConstant.Login,_details);
    });
  }
}


showAlertDialog(BuildContext context,String message) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
       Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(ErrorLable.kError),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget getTextFieldForm(){
  return Center(
    child: new Container(
       margin: new EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          setTextFieldWith(LabelConstant.kEmail,1),
          new SizedBox(height: 10.0),
          setTextFieldWith(LabelConstant.kPassword,2)
        ],
      ),
    ),
  );
}

Widget setTextFieldWith(String type,int index){
  return new TextFormField(
            controller: object[index],
            autofocus: false,
            obscureText :  (type == LabelConstant.kEmail) ? false : _obscureText,
             validator: (type == LabelConstant.kEmail) ? FormValidator().validUserID : FormValidator().validatePassword,
             decoration: InputDecoration(
             suffixIcon: (type == LabelConstant.kEmail) ?  null :InkWell(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 15.0,
                      color: Colors.black,
                    ),
               ),
              hintText: type,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
               border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(32.0),
              ),
          prefixIcon: (type == LabelConstant.kEmail) ? const Icon(Icons.person) : const Icon(Icons.lock)
        ),
    );
}

void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void onLoadAPIError(String _message) {
      Navigator.pop(context);
      showAlertDialog(loginContext,_message);
  }

  @override
  void onLoadAPIResponse(dynamic _responseData) {
     Navigator.pop(context);
     if(_responseData["Message"] == LabelConstant.kSuccess){
        UserManager().loginData(returnTempLoginData(_responseData), context);
      }else{
        showAlertDialog(loginContext,_responseData["Message"]);
      }
  }
  //MARK: Temp Login data
  returnTempLoginData(dynamic _responseData){
    Map<String,String> loginDetails = {"userID":object[1].text.toUpperCase().trimChar(),"username":"Test",
    "address":"J.P.Nagar,Bangalore Karnataka - 560078","iD":_responseData["UserId"],"themcolor" : "0"};
    return loginDetails;
  }
}





//'Forgot password?',
//Un-lock User?