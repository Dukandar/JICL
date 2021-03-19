import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  final _subSectionDetails;
  final  Function _function;
  CustomButton(this._function,this._subSectionDetails);

  @override
  State<StatefulWidget> createState(){
    return CustomButtonState();
  }
}

class CustomButtonState extends State<StatefulWidget> {
  CustomButtonState();

  @override
  Widget build(BuildContext context) {
    // var _subSectionDetails = widget._subSectionDetails;

    return new Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
    );
  }
}