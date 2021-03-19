import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class CustomUpload extends StatefulWidget {

  final _subSectionDetails;
  final _webRefNumber;
  final  Function _function;
  CustomUpload(Key key, this._function, this._subSectionDetails,this._webRefNumber) : super(key:key);

  @override
  State<StatefulWidget> createState(){
    return CustomUploadState();
  }
}

class CustomUploadState extends State<CustomUpload> {
  CustomUploadState();

  File imageURI;
  ByteData imgBytes;

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = (documentsDirectory.path) + '/' + widget._webRefNumber.toString() + '/' +widget._subSectionDetails.fieldDependencyID.toString() + ".png";
    // copy the file to a new path
    final File newImage = await image.copy(path);
    childCallBack(widget._subSectionDetails.fieldDependencyID.toString() + ".png");
    setState(() {
      imageURI = newImage;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = (documentsDirectory.path) + '/' + widget._webRefNumber.toString() + '/' +widget._subSectionDetails.fieldDependencyID.toString() + ".png";
    // copy the file to a new path
    final File newImage = await image.copy(path);
    childCallBack(widget._subSectionDetails.fieldDependencyID.toString() + ".png");
    setState(() {
      imageURI = newImage;
    });
  }

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
      imageURI = File(path);
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _subSectionDetails = widget._subSectionDetails;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Proposer', 
                style: TextStyle(fontSize: 16, color: Colors.orange),
              ),
            ),
          ),
          Container(
            child: ListView.builder (
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(image: 
                    DecorationImage(
                      image: AssetImage("assets/images/selectbackground.png"),
                      fit: BoxFit.fill,
                    ) ,
                  ),
                  padding: EdgeInsets.fromLTRB(0.0,5.0, 0.0, 5.0),
                  margin: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 102,
                        child: _returnDependentField(context, _subSectionDetails),
                      ),
                    ],
                  ),
                );
              }
            )
          ),
        ],
      ),
    );
  }

  _returnDependentField(BuildContext context, _subSectionDetails) {
    return new Opacity(
      opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(4.0,4.0,4.0, 4.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 8,
                offset: Offset(6.0,
                6.0))]
              ),
              width: MediaQuery.of(context).size.width,
              child: returnUploadImageWithIndex(context, _subSectionDetails)
            ),

            Container(
              margin: EdgeInsets.fromLTRB(4.0,4.0,4.0, 4.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 8,
                offset: Offset(6.0,
                6.0))]
              ),
              width: MediaQuery.of(context).size.width,
              child: returnUploadSignaturetWithIndex(context, _subSectionDetails)
            )
          ],
        ),
      )
    );
  }

  returnUploadImageWithIndex(BuildContext context, _subSectionDetails){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Text("Photo",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            )
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  height: 35.0,
                  width: 100.0,
                  color: Colors.orange,
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      showDialogWithBuildContext(context);
                    },
                    child: Text(
                      "Choose File",
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontFamily: "Helvetica"
                      ),
                    ),
                  )
                ),
                new Spacer(),
                GestureDetector(
                  onTap: () => {
                    FocusScope.of(context).unfocus(),
                    _previewOnClickImage(context)
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 70.0,
                    height: 50.0,
                    padding: EdgeInsets.all(5.0),
                    child: Text('Prospect Image', 
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontFamily: "Helvetica"
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }  

  void showDialogWithBuildContext(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext ctxt){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))
          ),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: StatefulBuilder(
            builder: (BuildContext altCntx,StateSetter setState){
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 168.0,
                          child: Text(LabelConstant.kSelect,
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
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 150.0,
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.camera_enhance),
                              color: Colors.orange,
                              iconSize: 100.0,
                              onPressed: () {
                                getImageFromCamera();
                                Navigator.pop(altCntx);
                              },
                            ),
                            Text(LabelConstant.kCamera),
                            ],
                          ),
                        ),
                        new Spacer(),
                        Container(
                          height: 150.0,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.mms),
                                color: Colors.orange,
                                iconSize: 100.0,
                                onPressed: () {
                                  getImageFromGallery();
                                  Navigator.pop(altCntx);
                                },
                              ),
                              Text(LabelConstant.kGallery),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          )
        );
      }
    );
  }

  returnUploadSignaturetWithIndex(BuildContext context, _subSectionDetails){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Text("Digital Signature",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            )
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  height: 35.0,
                  width: 120.0,
                  color: Colors.orange,
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                       _returnDialogWithBuildContext(context,_subSectionDetails.fieldName);
                    },
                    child: Text(
                      "Add Proposer Signature",
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontFamily: "Helvetica"
                      ),
                    ),
                  )
                ),
                new Spacer(),
                GestureDetector(
                  onTap: () => {
                    FocusScope.of(context).unfocus(),
                    _previewOnClickImage(context)
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 70.0,
                    height: 50.0,
                    padding: EdgeInsets.all(5.0),
                    child: Text('Proposer Signature', 
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontFamily: "Helvetica"
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

  _previewOnClickImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctxt){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          contentPadding: EdgeInsets.only(top: 5.0),
          content: StatefulBuilder(
            builder: (BuildContext altCntx,StateSetter setState){
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 168.0,
                            child: Text("Preview Image",
                              textAlign: TextAlign.center,
                              // maxLines: 2,
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
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(10.0),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/login-bg.jpg"), 
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ]
              );
            }
          )
        );
      }
    );  
  }
}