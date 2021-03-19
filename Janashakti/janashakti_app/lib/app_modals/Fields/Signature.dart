import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class SignatureWidget extends StatefulWidget {
   final _subSectionDetails;
   final _webRefNumber;
   final  Function _function;
  SignatureWidget(Key key,this._function,this._webRefNumber,this._subSectionDetails): super(key : key);
  @override
  State<StatefulWidget> createState() {
    return SignatureWidgetState(_subSectionDetails.isHide);
  }
}

class SignatureWidgetState extends State<SignatureWidget> {
  bool _isHide;
  SignatureWidgetState(this._isHide);
  ByteData imgBytes;
  File imageURI;
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

 void childCallBack(String fieldValue,){
      widget._function(widget._subSectionDetails.sectionID,widget._subSectionDetails.subSectionID,widget._subSectionDetails.fieldID,fieldValue,widget._subSectionDetails.index);
  }

  void initState () {
    super.initState();
    getImageFromDirectoryWithFieldValue(widget._subSectionDetails.fieldValue,widget._webRefNumber);
    _controller.addListener(() => print("Signature changed"));
  }
  
  getImageFromDirectoryWithFieldValue(String fieldValue,String webRefNumber) async {
    if(fieldValue.length > 0){
      final documentsDirectory = await getApplicationDocumentsDirectory();
      String path = (documentsDirectory.path) + '/' + widget._webRefNumber.toString() + '/' + fieldValue;
      //String fileExist = await DocumentDirectory().checkFilePath(path);
      // if (fileExist.length > 0){
        imageURI = File(path);
        setState(() {
          
        });
      }
    //}
  }
  
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !_isHide ? Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new Opacity(
        opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
        child: AbsorbPointer(
          absorbing : (_subSectionDetails.isEditable) ? false : true,
          child:Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => {
                  FocusScope.of(context).unfocus(),
                  _returnDialogWithBuildContext(context,_subSectionDetails.fieldName)
                },
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 170.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: imageURI != null
                      ? Image.memory(
                        Uint8List.fromList(imageURI.readAsBytesSync()),
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        )
                      : new Container(
                      height: 0,
                    ),
                  )
                ),
              ),
              Container(
                height: 30.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 28.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/1083.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(_subSectionDetails.fieldName,
                        textAlign:TextAlign.center,
                        style: Utility().returnBusinssDetailsNormalTextStyle()
                      ),
                    ),
                    _subSectionDetails.isManditory == true ? Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
                      child:  Icon(Icons.star, color: Colors.red, size: 10.0),
                    ) : Container(),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    ) : Container();
  }

  _setSignature() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = (documentsDirectory.path) + '/' + widget._webRefNumber.toString() + '/' +widget._subSectionDetails.fieldDependencyID.toString() + ".png";
    // copy the file to a new path
    final dir = Directory(path);
    // dir.deleteSync(recursive: true);
    // imageURI = File("");
    File(path).writeAsBytes(Uint8List.view(imgBytes.buffer)).then((_) {
      setState(() {
         imageURI = File(path);
         childCallBack(widget._subSectionDetails.fieldDependencyID.toString() + ".png");
       });
    });
  }

  _returnDialogWithBuildContext(BuildContext context,String title){
    showDialog(
        context: context,
        builder: (BuildContext ctxt){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: StatefulBuilder(
                builder: (BuildContext altCntx,StateSetter setState){
                  return Container(
                    height: 460.0,
                    width: MediaQuery.of(altCntx).size.width ,
                    child:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border:Border(
                                  bottom:  BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                )
                            ),
                            height: 58.0,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width - 168.0,
                                      child: Text(title,
                                        textAlign: TextAlign.center,
                                        style: Utility().retuenLargeTextStyle(),
                                      ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      child: Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: IconButton(
                                          padding: const EdgeInsets.all(0),
                                          iconSize: 20,
                                          icon: Icon(
                                            Icons.close,
                                          ),
                                          onPressed: () => Navigator.pop(altCntx),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 352.0,
                            child: Signature(
                              controller: _controller,
                              height: 300,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(altCntx).size.width,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(12.0, 2.0, 0.0, 0.0),
                                  width: MediaQuery.of(altCntx).size.width /  2.0 - 68.0,
                                  child: FlatButton(
                                    color: Colors.orange,
                                    textColor: Colors.white,
                                    onPressed: () async {
                                      if (_controller.isNotEmpty) {
                                        var img = await _controller.toImage();
                                        // var data = await _controller.toPngBytes();
                                        // Image.memory(data);
                                        final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);
                                        imgBytes = pngBytes;
                                        //Write the image into directory
                                        _setSignature();
                                        Navigator.pop(altCntx);
                                      }
                                      // final img = await rendered;
                                      // final pngBytes =
                                      // await img.toByteData(format: ui.ImageByteFormat.png);
                                      // imgBytes = pngBytes;
                                    },
                                    child: Text("Save"),
                                  ),
                                ),
                                new Spacer(),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0.0, 2.0, 12.0, 0.0),
                                  width: MediaQuery.of(altCntx).size.width /  2.0 - 68.0,
                                  child: FlatButton(
                                    color: Colors.orange,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        _controller.clear();
                                      });
                                    },
                                    child: Text("Clear"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),
                  );
                }
            ),
          );
        }
    );
  }
  // @override
  //   bool get wantKeepAlive => true;
}
