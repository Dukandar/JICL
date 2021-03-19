
class LoginService{
String userName;
String password;
String deviceName;
bool rememberMe;
  LoginService({
    this.userName,
    this.password,
    this.deviceName,
    this.rememberMe
  });
  LoginService.fromJson(Map _details){
    userName = _details["userName"];
    password = _details["password"];
    deviceName = (_details["isiOS"]) ? returniOSDeviceInfoWithDeviceData(_details["deviceData"]) : returnAndriodDeviceInfoWithDeviceData(_details["deviceData"]);
    rememberMe = false;
  }

   Map toJson()=>{
     "UserName" : userName,
     "Password" : password,
     "DeviceName" : deviceName,
     "RememberMe" : rememberMe
   };
}

String returnAndriodDeviceInfoWithDeviceData(_deviceData){
  String deviceInfo = "";
  if (_deviceData["model"] != null){
    //Name=
    deviceInfo = deviceInfo + "${_deviceData["model"]}" + "\n";
  }
  if (_deviceData["version.sdkInt"] != null){
    //systemVersion=
    deviceInfo = deviceInfo +"${_deviceData["version.sdkInt"]}" + "\n";
  }
  return deviceInfo;
}

String returniOSDeviceInfoWithDeviceData(_deviceData){
  String deviceInfo = "";
  if (_deviceData["name"] != null){
    //Name=
    deviceInfo = deviceInfo + "${_deviceData["name"]}" + "\n";
  }
  if (_deviceData["systemVersion"] != null){
    //systemVersion=
    deviceInfo = deviceInfo +"${_deviceData["systemVersion"]}" + "\n";
  }
  return deviceInfo;
}