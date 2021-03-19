import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/DocumentDirectory.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MyImagePicker extends StatefulWidget {
  final _subSectionDetails;
  final _webRefNumber;
  final Function _function;
  MyImagePicker(
      Key key, this._function, this._subSectionDetails, this._webRefNumber)
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyImagePickerState(_subSectionDetails.isHide);
  }
}

class MyImagePickerState extends State<MyImagePicker>
    with AutomaticKeepAliveClientMixin {
  bool _isHide;
  MyImagePickerState(this._isHide);
  File imageURI;
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: LabelConstant.kImgMaxWidthHeight,
        maxHeight: LabelConstant.kImgMaxWidthHeight);
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = (documentsDirectory.path) +
        '/' +
        widget._webRefNumber.toString() +
        '/' +
        widget._subSectionDetails.fieldDependencyID.toString() +
        ".png";
    // copy the file to a new path
    if (image != null) {
      final File newImage = await image.copy(path);
      if (widget._subSectionDetails.fieldDependencyID != 1412) {
        setState(() {
          imageURI = newImage;
        });
      }
      childCallBack(
          widget._subSectionDetails.fieldDependencyID.toString() + ".png");
    }
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: LabelConstant.kImgMaxWidthHeight,
        maxHeight: LabelConstant.kImgMaxWidthHeight);
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = (documentsDirectory.path) +
        '/' +
        widget._webRefNumber.toString() +
        '/' +
        widget._subSectionDetails.fieldDependencyID.toString() +
        ".png";
    // copy the file to a new path
    if (path != null) {
      final File newImage = await image.copy(path);
      if (widget._subSectionDetails.fieldDependencyID != 1412) {
        setState(() {
          imageURI = newImage;
        });
      }
      childCallBack(
          widget._subSectionDetails.fieldDependencyID.toString() + ".png");
    }
  }

  void childCallBack(
    String fieldValue,
  ) {
    widget._function(
        widget._subSectionDetails.sectionID,
        widget._subSectionDetails.subSectionID,
        widget._subSectionDetails.fieldID,
        fieldValue,
        widget._subSectionDetails.index);
  }

  void initState() {
    super.initState();
    getImageFromDirectoryWithFieldValue(
        widget._subSectionDetails.fieldValue, widget._webRefNumber);
  }

  getImageFromDirectoryWithFieldValue(
      String fieldValue, String webRefNumber) async {
    if (fieldValue.length > 0) {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      String path =
          (documentsDirectory.path) + '/' + webRefNumber + '/' + fieldValue;
      //  String fileExist = await DocumentDirectory().checkFilePath(path);
      // if (fileExist.length > 0){
      imageURI = File(path);
      setState(() {});
      //}
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _subSectionDetails = widget._subSectionDetails;
    return !_isHide
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: new Opacity(
                opacity: (_subSectionDetails.isEditable) ? 1.0 : 0.6,
                child: AbsorbPointer(
                  absorbing: (_subSectionDetails.isEditable) ? false : true,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          FocusScope.of(context).unfocus(),
                          showDialogWithBuildContext(context)
                        },
                        child: Container(
                          height: 170.0,
                          width: 300.0,
                          padding: EdgeInsets.all(10.0),
                          child: imageURI == null
                              ? Text('',
                                  textAlign: TextAlign.center,
                                  style: Utility().returnNormalTextStyle())
                              : Image.memory(
                                  Uint8List.fromList(
                                      imageURI.readAsBytesSync()),
                                  alignment: Alignment.center,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            (isFieldID(_subSectionDetails.fieldID))
                                ? Container()
                                : Container(
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
                                  textAlign: TextAlign.center,
                                  style: Utility()
                                      .returnBusinssDetailsNormalTextStyle()),
                            ),
                            _subSectionDetails.isManditory == true
                                ? Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: Icon(Icons.star,
                                        color: Colors.red, size: 10.0),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )))
        : Container();
  }

  bool isFieldID(int fieldID) {
    final fieldAray = [1166];
    if (fieldAray.contains(fieldID)) {
      return true;
    }
    return false;
  }

  void showDialogWithBuildContext(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctxt) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: StatefulBuilder(
                  builder: (BuildContext altCntx, StateSetter setState) {
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
                            child: Text(
                              LabelConstant.kSelect,
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
                    Center(
                        child: Container(
                      padding: const EdgeInsets.all(0),
                      height: 200,
                      width: 234,
                      child: Row(
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
                    ))
                  ],
                );
              }));
        });
  }

  void updateImageViewWith(String fieldValue, String webRefNumber) {
    getImageFromDirectoryWithFieldValue(fieldValue, webRefNumber);
  }

  @override
  bool get wantKeepAlive => true;
}
