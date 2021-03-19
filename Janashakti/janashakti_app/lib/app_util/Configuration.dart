
import 'package:flutter/cupertino.dart';

enum Flavor { SIT ,DEV, PRODUCTION }
class FlavorConfiguration{
final Flavor flavor;
static FlavorConfiguration _shareInstance;

factory FlavorConfiguration({@required Flavor flavor}){
  _shareInstance = FlavorConfiguration._internal(flavor);
  return  _shareInstance;
}

FlavorConfiguration._internal(this.flavor);
static FlavorConfiguration get instance {return _shareInstance;}
static bool iSIT()=> _shareInstance.flavor == Flavor.SIT;
static bool isDevelopment() => _shareInstance.flavor == Flavor.DEV;
static bool isProducation() => _shareInstance.flavor == Flavor.PRODUCTION;

 static  String returnAPIURL(){
    return  iSIT() ?  "http://182.156.210.122:224/API" : isDevelopment() ? "https://uatavoapps.janashakthi.com:1010/API" :  "http://182.156.210.122:224/API";
  }

  static String returnPDFOtherAPIURL(){
    return iSIT()  ? "http://182.156.210.122:208" : isDevelopment() ? "https://uatavoapps.janashakthi.com:100" : "http://182.156.210.122:208";
  }

}

