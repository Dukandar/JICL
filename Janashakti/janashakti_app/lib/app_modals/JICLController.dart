import 'dart:convert';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_util/Constant.dart';


abstract class JICLAPIResponseController{
  void onLoadAPIResponse(dynamic _responseData);
  void onLoadAPIError(String _message);
}

class LoadAPI{
  JICLAPIResponseController _cntr;
  LoadAPI(this._cntr);
  Future<void> loadAPI(APIConstant apiName,Map _details) async {
    dynamic response =  await returnResponseWithAPIName(apiName,_details);
    if(response != null && response.statusCode != 200){
      _cntr.onLoadAPIError("${LabelConstant.kErrorOccured} ${response.statusCode}");
    }else if(response != null){
      final _loginData = jsonDecode(response.body);
      if(_loginData is Map){
           _cntr.onLoadAPIResponse(_loginData);
      }else{
           _cntr.onLoadAPIResponse(_loginData);
      }
    }else{
      _cntr.onLoadAPIError("${LabelConstant.kResponseError}");
    }
  }
}

Future<dynamic> returnResponseWithAPIName(APIConstant apiName,Map _details) async {
  switch (apiName) {
    case APIConstant.Login:
        dynamic resposne =  await APIManager().login(_details);
        return resposne;
       break;
    case APIConstant.ChangePassword:
        dynamic resposne =  await APIManager().changePassword(_details);
        return resposne;
      break;  
    default:break;
  }
}

//FetchDataException
 class FetchDataException implements Exception{
  final _message;
  FetchDataException([this._message]);
  String  toString(){
    if(_message == null) return "Exception";
    return "Exception : $_message";
  }
}



