import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';

class JICLSetting extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return JICLSettingState();
  }
}

class JICLSettingState extends State<JICLSetting>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
          image: Utility().returnBackgroundImage()
        ),
        child:returnChildContainer()
      ),
      backgroundColor: Colors.transparent,
           appBar: AppBar(
           title: Text(LabelConstant.kSetting),
           backgroundColor: Utility().returnThemColorWithIndex(Utility().returnThemColorIndex()),
           leading: new IconButton(
           icon: new Icon(Icons.arrow_back),
           onPressed: () => {
              Navigator.pushNamed(context, homeRoute)
          },
        )
      ),
    );
  }

  returnChildContainer(){
      return Container(
          child: Row(
            children:<Widget>[
              Container(
                child: Column(
                  children:<Widget>[
                   Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 103.0,
                     child:ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: SettingDetails.details.length,
                      itemBuilder: (BuildContext ctxt,int subIndex){
                        final gridItem = SettingDetails.details[subIndex];
                         return Container(
                            margin:EdgeInsets.only(top: (subIndex == 0) ? 8.0 : 0.0,left: 4.0,right: 4.0,bottom: 0.0),
                            width: MediaQuery.of(context).size.width,
                            height: (subIndex == 0) ? 24 : 34,
                            child: Row(
                              children: <Widget>[
                               Container(
                                 width: MediaQuery.of(context).size.width - ((subIndex == 0) ? 8.0 :100.0),
                                 child: Text("  " + gridItem.title,
                                style: (subIndex == 0) ? Utility().returnHeaderTextStyle() : Utility().returnNormalTextStyle(),
                                textAlign: (subIndex == 0) ? TextAlign.center : TextAlign.left,
                                ),
                               ),
                                (subIndex != 0) ?Container(
                                  width: 80.0,
                                  child: Radio(
                                    value:gridItem.businessId, 
                                    groupValue: UserManager.returnThemIndex(), 
                                    onChanged: (val){
                                     UserManager().setThemIWithndex(val);
                                      setState(() {
                                      });
                                    }
                                    ),
                                ) : Container()
                              ],
                            ),
                            color:(subIndex == 0) ? Utility().returnThemColorWithIndex(Utility().returnThemColorIndex()) : Colors.white,
                         );
                      }
                     )
                   )
                    
                  ]
                )
              )
            ]
          ),
      );
  }



}