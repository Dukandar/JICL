import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/Fields/Button.dart';
import 'package:jiclapp/app_modals/Fields/Checkbox.dart';
import 'package:jiclapp/app_modals/Fields/CoverageDetails.dart';
import 'package:jiclapp/app_modals/Fields/CustomButton.dart';
import 'package:jiclapp/app_modals/Fields/CustomCheckbox.dart';
import 'package:jiclapp/app_modals/Fields/CustomDocument.dart';
import 'package:jiclapp/app_modals/Fields/CustomUpload.dart';
import 'package:jiclapp/app_modals/Fields/DatePicker.dart';
import 'package:jiclapp/app_modals/Fields/DependentView.dart';
import 'package:jiclapp/app_modals/Fields/DropDown.dart';
import 'package:jiclapp/app_modals/Fields/ExpandCollapse.dart';
import 'package:jiclapp/app_modals/Fields/ImagePicker.dart';
import 'package:jiclapp/app_modals/Fields/Label.dart';
import 'package:jiclapp/app_modals/Fields/LabelView.dart';
import 'package:jiclapp/app_modals/Fields/MainLabel.dart';
import 'package:jiclapp/app_modals/Fields/MediaController.dart';
import 'package:jiclapp/app_modals/Fields/Mediaslider.dart';
import 'package:jiclapp/app_modals/Fields/NomineeDetails.dart';
import 'package:jiclapp/app_modals/Fields/Number.dart';
import 'package:jiclapp/app_modals/Fields/RadioButton.dart';
import 'package:jiclapp/app_modals/Fields/Segment.dart';
import 'package:jiclapp/app_modals/Fields/Signature.dart';
import 'package:jiclapp/app_modals/Fields/TextBox.dart';
import 'package:jiclapp/app_modals/Fields/TimePicker.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_screens/BenefitDetails/BenefitDetailsScreen.dart';
import 'package:jiclapp/app_screens/FNAScreen.dart';
import 'package:jiclapp/app_screens/HideUnHideFields.dart';
import 'package:jiclapp/app_screens/ProposalScreen.dart';
import 'package:jiclapp/app_screens/ProspectScreen.dart';
import 'package:jiclapp/app_screens/SuspectScreen.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_modals/Fields/TextArea.dart';
import 'package:jiclapp/app_modals/Fields/DependentField.dart';
import 'package:jiclapp/app_util/DocumentDirectory.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_screens/UpdatePaymentFields.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class BusinessDetailScreen extends StatefulWidget {
  final Map object;
  BusinessDetailScreen(this.object);
  @override
  State<StatefulWidget> createState() {
    return BusinessDetailScreenState();
  }
}

class BusinessDetailScreenState extends State<BusinessDetailScreen> {
  var _sectionSubSectionDetails = {};
  var _globalKeys = [];
  var _autoValidateArray = [];
  var _currentPage = 0;
  var webRefNumber = "";
  var isUpdate = false;
  final _pageControllercontroller = new PageController();
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(LabelConstant.kLocale).format(int.parse(s));
  @override
  void initState() {
    super.initState();
    webRefNumber = _returnWebRefNumber(widget.object["businessSubID"]);
    Future.delayed(const Duration(milliseconds: LabelConstant.kDispatchTime),
        () async {
      setSectionSubSectionDetailsWith(
          widget.object["businessSubID"], webRefNumber);
      DocumentDirectory().createImageDirectory(webRefNumber);
    });
  }

  String _returnWebRefNumber(int _businessSubID) {
    switch (_businessSubID) {
      case 6000:
        return (widget.object["list"] != null)
            ? widget.object["list"][0].webRefNumber
            : "";
      default:
        return (widget.object["cardDetails"] != null)
            ? widget.object["cardDetails"].webRefNumber
            : "";
    }
  }

  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          supportedLocales: [
            Locale('de', 'DE'),
            Locale('en', 'US'),
          ],
          home: new Container(
              decoration:
                  BoxDecoration(image: Utility().returnBackgroundImage()),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: Text(widget.object["title"]),
                    backgroundColor: Utility().returnThemColorWithIndex(
                        Utility().returnThemColorIndex()),
                    leading: new IconButton(
                      icon: new Icon(Icons.arrow_back),
                      onPressed: () => {
                        if (Navigator.of(context) == null)
                          {Navigator.popAndPushNamed(context, newBusinessRoute)}
                        else
                          {Navigator.of(context).pop()}
                      },
                    ),
                    actions: <Widget>[
                      // action button
                      (((_sectionSubSectionDetails.length) > 1 &&
                                  _sectionSubSectionDetails.length !=
                                      _currentPage + 1) ||
                              (widget.object["businessSubID"] == 1000 ||
                                  widget.object["businessSubID"] == 1001))
                          ? IconButton(
                              icon: new Icon(Icons.save),
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                Utility().activity(context);
                                Future.delayed(
                                    const Duration(milliseconds: 600),
                                    () async {
                                  if (_globalKeys[_currentPage]
                                      .currentState
                                      .validate()) {
                                    _onClickSaveBtn();
                                  } else {
                                    _autoValidateArray[_currentPage] = true;
                                    Utility().showToastMessage(
                                        LabelConstant.kMandatory);
                                    Navigator.pop(context);
                                  }
                                });
                              },
                            )
                          : Container(),
                    ],
                  ),
                  body: _returnStateBody(context, _sectionSubSectionDetails,
                      widget.object["businessID"]))),
        ));
  }

  void _onClickSaveBtn() async {
    if ((widget.object["businessSubID"] == 1000 ||
        widget.object["businessSubID"] == 1001)) {
      if (webRefNumber.length <= 0) {
        webRefNumber = Utility().returnWebRefNumber().toString();
      }
      _requestWith(widget.object["businessSubID"], webRefNumber);
    } else {
      bool isValid = await DBHelper().insertIntoFieldResponse(
          _sectionSubSectionDetails, webRefNumber, true, false);
      if (isValid) {
        stopActivity();
      }
    }
  }

//MARK:- Parsing section and sub section details
  setSectionSubSectionDetailsWith(int subSectionID, String webRefNumber) async {
    Utility().activity(context);
    List<SubSectionMaster> data =
        await DBHelper().getSubSectionMasterWith(subSectionID);
    if (data.length > 0) {
      var index = 0;
      await Future.forEach(data, (str) async {
        print(str);
        //var _sectionDetails = {};
        final detail = data[index];
        List<SectionSubSection> fieldMasterData = await DBHelper()
            .getFieldMasterDataWith(
                detail.subSectionID, subSectionID, webRefNumber);
        bool isValid = true;
        if (detail.subSectionID == 1019) {
          var deptValue = fieldMasterData[1].fieldValue.split(",");
          isValid = (deptValue.length >= 2) ? true : false;
        }
        if (fieldMasterData.length > 0 && isValid) {
          _sectionSubSectionDetails[detail.subSectionID] = fieldMasterData;
          final _formKey = GlobalKey<FormState>();
          final _autoValidate = false;
          _autoValidateArray.add(_autoValidate);
          _globalKeys.add(_formKey);
        }
        if (index + 1 == data.length) {
          setHideUnHideDependent();
        }
        index = index + 1;
      });
    }
  }

  //MARK:- set the hide and unhide depdendent
  void setHideUnHideDependent() async {
    var _selectedProduct;
    if(widget.object["businessID"] == 3000){
          //Get fieldData
        List<FieldData> _fieldDataDetails = await DBHelper().getFieldDataList();
        final index = returnIndexWithField(1231, _sectionSubSectionDetails[1015]);
        var _subSectionDetails =
            (_sectionSubSectionDetails[1015][index] as SectionSubSection);
        _selectedProduct  = _fieldDataDetails
            .where((e) =>
                (e.fieldId == _subSectionDetails.fieldID) &&
                (e.fieldDataID == _subSectionDetails.fieldValue))
            .toList()[0];
    }
    _sectionSubSectionDetails.forEach((key, value) async {
      for (final item in value) {
        final deptSectionSubSection = item as SectionSubSection;
        switch (deptSectionSubSection.fieldDependencyID) {
          case 1712:
            if (_selectedProduct.fieldDepdentID == "NJU4" ){
              deptSectionSubSection.isHide = false;
            }
          break;
          case 1713:
            if (_selectedProduct.fieldDepdentID == "NJU4" ){
              deptSectionSubSection.isHide = false;
            }
          break;
          case 1714:
            if (_selectedProduct.fieldDepdentID == "NJU4" ){
              deptSectionSubSection.isHide = false;
            }
          break;
          case 1646:
            final index =
                returnIndexWithField(1104, _sectionSubSectionDetails[1013]);
            if (index != null) {
              var sectionSubSection =
                  (_sectionSubSectionDetails[1013][index] as SectionSubSection);
              if (sectionSubSection.fieldValue.length > 0) {
                deptSectionSubSection.isHide =
                    (int.parse(sectionSubSection.fieldValue) > 0)
                        ? false
                        : true;
              }
            }
            break;
          case 1096:
            final index =
                returnIndexWithField(1041, _sectionSubSectionDetails[1002]);
            print("object");
            if (index != null) {
              var sectionSubSection =
                  (_sectionSubSectionDetails[1002][index] as SectionSubSection);
              if (sectionSubSection.fieldValue.length > 0) {
                deptSectionSubSection.isHide =
                    (sectionSubSection.fieldValue == "14") ? false : true;
              }
            }
            break;
          case 1640:
            final index =
                returnIndexWithField(1104, _sectionSubSectionDetails[1006]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1006][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1645:
            final index =
                returnIndexWithField(1207, _sectionSubSectionDetails[1013]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1013][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1639:
            final index =
                returnIndexWithField(1104, _sectionSubSectionDetails[1006]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1006][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1644:
            final index =
                returnIndexWithField(1207, _sectionSubSectionDetails[1013]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1013][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1638:
            final index =
                returnIndexWithField(1104, _sectionSubSectionDetails[1006]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1006][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1643:
            final index =
                returnIndexWithField(1207, _sectionSubSectionDetails[1013]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1013][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1637:
            final index =
                returnIndexWithField(1104, _sectionSubSectionDetails[1006]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1006][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1642:
            final index =
                returnIndexWithField(1207, _sectionSubSectionDetails[1013]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1013][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1636:
            final index =
                returnIndexWithField(1104, _sectionSubSectionDetails[1006]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1006][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1641:
            final index =
                returnIndexWithField(1207, _sectionSubSectionDetails[1013]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1013][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1635:
            final index =
                returnIndexWithField(1104, _sectionSubSectionDetails[1006]);
            var sectionSubSection =
                (_sectionSubSectionDetails[1006][index] as SectionSubSection);
            if (sectionSubSection.fieldValue.length > 0) {
              deptSectionSubSection.isHide =
                  (int.parse(sectionSubSection.fieldValue) > 0) ? false : true;
            }
            break;
          case 1275:
            final tempArray = [1272, 1274];
            var nameWithInitial = "";
            for (final depItem in tempArray) {
              final index = returnIndexWithField(
                  depItem, _sectionSubSectionDetails[1018]);
              var sectionSubSection =
                  (_sectionSubSectionDetails[1018][index] as SectionSubSection);
              if (sectionSubSection.fieldValue.length > 0) {
                nameWithInitial = nameWithInitial +
                    ((depItem == 1272)
                        ? sectionSubSection.fieldValue[0]
                        : sectionSubSection.fieldValue) +
                    " ";
              }
            }
            deptSectionSubSection.fieldValue = nameWithInitial;
            break;
          case 1041:
            if (deptSectionSubSection.fieldValue == "14") {
              //1057,1058,1059,1060,1061,1062,1063
              final tempArray = [1057, 1058, 1059, 1060, 1061, 1062, 1063];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1003]);
                var sectionSubSection = (_sectionSubSectionDetails[1003][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
            break;
          case 1144:
            if (deptSectionSubSection.fieldValue == "14") {
              final tempArray = [1160, 1161, 1162, 1163, 1164, 1165, 1166];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1010]);
                var sectionSubSection = (_sectionSubSectionDetails[1010][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
            break;
          case 1102:
            if (deptSectionSubSection.fieldValue == "1") {
              final tempArray = [1103, 1104];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1006]);
                var sectionSubSection = (_sectionSubSectionDetails[1006][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
            break;
          case 1205:
            if (deptSectionSubSection.fieldValue == "1") {
              final tempArray = [1206, 1207];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1013]);
                var sectionSubSection = (_sectionSubSectionDetails[1013][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
            break;
          case 1031:
            if (deptSectionSubSection.fieldValue.length > 0) {
              final tempArray = [1032, 1033];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1002]);
                var sectionSubSection = (_sectionSubSectionDetails[1002][index]
                    as SectionSubSection);
                sectionSubSection.isEditable = false;
              }
            }
            break;
          case 1134:
            if (deptSectionSubSection.fieldValue.length > 0) {
              final tempArray = [1135, 1136];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1009]);
                var sectionSubSection = (_sectionSubSectionDetails[1009][index]
                    as SectionSubSection);
                sectionSubSection.isEditable = false;
              }
            }
            break;
          case 1234:
            final cntrIndex =
                returnIndexWithField(1239, _sectionSubSectionDetails[1016]);
            deptSectionSubSection.fieldValue = _selectedProduct.fieldDepdentID;
            var _cntrSubSectionDetails = (_sectionSubSectionDetails[1016]
                [cntrIndex] as SectionSubSection);
            _cntrSubSectionDetails.isHide =
                (_selectedProduct.fieldDepdentID == "LI4" ||
                        _selectedProduct.fieldDepdentID == "LSP")
                    ? false
                    : true;
            break;
          case 1240:
            if (deptSectionSubSection.fieldValue == "1") {
              final index =
                  returnIndexWithField(1241, _sectionSubSectionDetails[1016]);
              var sectionSubSection =
                  (_sectionSubSectionDetails[1016][index] as SectionSubSection);
              sectionSubSection.isEditable = true;
            }
            deptSectionSubSection.isHide =
                (_selectedProduct.fieldDepdentID == "LI4" ) ? false : true;
            break;
          case 1241:
          if(_selectedProduct.fieldDepdentID == "LI4"){
            if (deptSectionSubSection.fieldValue == "0" ||
                deptSectionSubSection.fieldValue.length == 0) {
              final tempArray = [
                1243,
                1244,
                1245,
                1246,
                1247,
                1248,
                1249,
                1250,
                1251,
                1252
              ];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = true;
              }
            } else {
              final tempArray = [1243, 1250, 1253];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
          }else{
            if(_selectedProduct.fieldDepdentID == "LSP" || _selectedProduct.fieldDepdentID == "NSW"){
              deptSectionSubSection.dependentIDs = "";
            }
              deptSectionSubSection.fieldValue = "8";
              deptSectionSubSection.isEditable = true;
          }
            break;
          case 1243:
          if(_selectedProduct.fieldDepdentID == "LSP"){
            deptSectionSubSection.fieldValue = "0";
          }else{
             final index =
                returnIndexWithField(1241, _sectionSubSectionDetails[1016]);
            var selfSectionSubSection =
                (_sectionSubSectionDetails[1016][index] as SectionSubSection);
            if (deptSectionSubSection.fieldValue == "1" &&
                selfSectionSubSection.fieldValue == "1") {
              final tempArray = [1244, 1245, 1246, 1247, 1248, 1249];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
         }
            break;
          case 1253:
           if(_selectedProduct.fieldDepdentID == "LI4"){
            final index =
                returnIndexWithField(1240, _sectionSubSectionDetails[1016]);
            var insuredSectionSubSection =
                (_sectionSubSectionDetails[1016][index] as SectionSubSection);
            if (deptSectionSubSection.fieldValue == "2" &&
                insuredSectionSubSection.fieldValue == "1") {
              final tempArray = [1254];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
           }else{
             deptSectionSubSection.isHide = (_selectedProduct.fieldDepdentID == "LSP" ) ? true : false;
           }
            break;
          case 1250:
           if( _selectedProduct.fieldDepdentID == "LSP"){
              deptSectionSubSection.fieldValue = "0";
           }else if(_selectedProduct.fieldDepdentID == "NSPS"){
            deptSectionSubSection.fieldValue = "1";
          }else{
            final index =
                returnIndexWithField(1241, _sectionSubSectionDetails[1016]);
            var selfSectionSubSection =
                (_sectionSubSectionDetails[1016][index] as SectionSubSection);
            if (deptSectionSubSection.fieldValue == "1" &&
                selfSectionSubSection.fieldValue == "1") {
              final tempArray = [1251, 1252];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
          }
            break;
          case 1242:
            final index =
                returnIndexWithField(1241, _sectionSubSectionDetails[1016]);
            var selfSectionSubSection =
                (_sectionSubSectionDetails[1016][index] as SectionSubSection);
            if (deptSectionSubSection.fieldValue == "1" &&
                selfSectionSubSection.fieldValue == "0") {
              final tempArray = [
                1242,
                1256,
                1257,
                1258,
                1259,
                1260,
                1261,
                1253
              ];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            } else if (deptSectionSubSection.fieldValue == "2" &&
                selfSectionSubSection.fieldValue == "0") {
              final tempArray = [
                1242,
                1244,
                1245,
                1246,
                1247,
                1248,
                1249,
                1251,
                1252,
                1253
              ];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            } else if (deptSectionSubSection.fieldValue == "3" &&
                selfSectionSubSection.fieldValue == "0") {
              final tempArray = [
                1242,
                1244,
                1245,
                1246,
                1247,
                1248,
                1249,
                1253
              ];
              for (final depItem in tempArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = false;
              }
            }
            break;
          case 1064:
            if (deptSectionSubSection.fieldValue.length > 0) {
              if (int.parse(deptSectionSubSection.fieldValue) > 0) {
                final tempArray = [1065];
                for (final depItem in tempArray) {
                  final index = returnIndexWithField(
                      depItem, _sectionSubSectionDetails[1003]);
                  var sectionSubSection = (_sectionSubSectionDetails[1003]
                      [index] as SectionSubSection);
                  sectionSubSection.isHide = false;
                }
              }
            }
            break;
          case 1167:
            if (deptSectionSubSection.fieldValue.length > 0) {
              if (int.parse(deptSectionSubSection.fieldValue) > 0) {
                final tempArray = [1168];
                for (final depItem in tempArray) {
                  final index = returnIndexWithField(
                      depItem, _sectionSubSectionDetails[1010]);
                  var sectionSubSection = (_sectionSubSectionDetails[1010]
                      [index] as SectionSubSection);
                  sectionSubSection.isHide = false;
                }
              }
            }
            break;
          case 1310:
            final fieldValue = deptSectionSubSection.fieldValue;
            var tempArray = fieldValue.split(",");
            tempArray[0] = "0";
            deptSectionSubSection.fieldValue = tempArray.join(",");
            final isSpouse =
                tempArray.where((element) => element == "Spouse").toList();
            if (isSpouse != null && isSpouse.length > 0) {
              final filedArray = [
                1309,
                1310,
                1311,
                1312,
                1313,
                1314,
                1315,
                1316,
                1317,
                1318,
                1319,
                1320,
                1321,
                1322,
                1323,
                1324,
                1325,
                1326,
                1327,
                1328,
                1329,
                1330,
                1331,
                1332,
                1333,
                1334,
                1335,
                1336,
                1337,
                1338,
                1339,
                1340,
                1341,
                1342,
                1343,
                1344,
                1345,
                1346,
                1347,
                1348,
                1349,
                1350
              ];
              for (final depItem in filedArray) {
                final index = returnIndexWithField(
                    depItem, _sectionSubSectionDetails[1019]);
                if (index != null) {
                  var sectionSubSection = (_sectionSubSectionDetails[1019]
                      [index] as SectionSubSection);
                  sectionSubSection.isHide = false;
                }
              }
            } else {
              if (tempArray[1].length > 0) {
                updateLifeToBeAssured(
                    deptSectionSubSection.fieldID,
                    deptSectionSubSection.subSectionID,
                    deptSectionSubSection.fieldValue,
                    1);
              }
            }
            break;
        }
      }
    });
    setState(() {});
    Navigator.pop(context);
  }

  //MARK:- Retrun section details
  _returnStateBody(context, _sectionSubSectionDetails, sectionID) {
    return Container(
      padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 16.0),
      child: Container(
        child: PageView.builder(
          itemCount: _sectionSubSectionDetails.length,
          onPageChanged: (int index) => {
            _currentPage = index,
            FocusScope.of(context).unfocus(),
            setState(() {})
          },
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _pageControllercontroller,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _globalKeys[index],
                autovalidate: _autoValidateArray[index],
                child: Transform.scale(
                  scale: 0.98,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Utility().returnPageThemColorWithIndex(
                              Utility().returnThemColorIndex()),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Utility().returnThemColorWithIndex(
                                    Utility().returnThemColorIndex()),
                                blurRadius: 18,
                                offset: Offset(6.0, 6.0))
                          ]),
                      height: MediaQuery.of(ctxt).size.height,
                      child: Card(
                        color: Utility().returnPageThemColorWithIndex(
                            Utility().returnThemColorIndex()),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ((_sectionSubSectionDetails.length) > 1 &&
                                    _currentPage != 0)
                                ? Container(
                                    height: 20,
                                    width: 20,
                                    padding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      color: Utility().returnIconColor(),
                                      iconSize: 20.0,
                                      padding: const EdgeInsets.all(0.0),
                                      icon: new Center(
                                          child:
                                              new Icon(Icons.arrow_back_ios)),
                                      onPressed: () {
                                        _pageControllercontroller.previousPage(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeIn);
                                      },
                                    ),
                                  )
                                : Container(),
                            Container(
                              width: MediaQuery.of(ctxt).size.width - 56.0,
                              child: _returnSubStateBoady(
                                  context,
                                  _sectionSubSectionDetails,
                                  index,
                                  _sectionSubSectionDetails.keys
                                      .elementAt(index),
                                  _globalKeys[index]),
                            ),
                            ((_sectionSubSectionDetails.length) > 1 &&
                                    _sectionSubSectionDetails.length !=
                                        _currentPage + 1)
                                ? Container(
                                    height: 20,
                                    width: 20,
                                    padding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      color: Utility().returnIconColor(),
                                      iconSize: 20.0,
                                      padding: const EdgeInsets.all(0.0),
                                      icon: new Center(
                                          child: new Icon(
                                              Icons.arrow_forward_ios)),
                                      onPressed: () {
                                        _pageControllercontroller.nextPage(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeIn);
                                      },
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//MARK:- Return subsection details
  _returnSubStateBoady(
      context, _sectionSubSectionDetails, index, subSectionID, GlobalKey _key) {
    final _subSectionDetails = _sectionSubSectionDetails[subSectionID];
    return Column(
      children: <Widget>[
        Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: Container(
                decoration: BoxDecoration(
                  color: Utility().returnThemColorWithIndex(
                      Utility().returnThemColorIndex()),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 18,
                        offset: Offset(0.0, 6.0))
                  ],
                ),
                margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 2.0),
                child: Center(
                  child: Text(
                      (_subSectionDetails[0] as SectionSubSection).fieldName,
                      textAlign: TextAlign.center,
                      style: Utility().returnHeaderTextStyle()),
                ))),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height - 180.0,
            width: MediaQuery.of(context).size.width,
            child: new ListView.builder(
              key: new Key(index.toString()),
              itemCount: _subSectionDetails.length,
              itemBuilder: (BuildContext ctxt, int subIndex) {
                return Wrap(
                  children: <Widget>[
                    new Container(
                      margin: ((_subSectionDetails[subIndex]).isHide)
                          ? EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0)
                          : EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                      width: MediaQuery.of(context).size.width,
                      height: retunHeightWith(_subSectionDetails[subIndex]),
                      child: retunFieldsWith(_subSectionDetails[subIndex],
                          context, subIndex, _subSectionDetails, _key),
                      decoration: BoxDecoration(
                        color: returnContainerBackgroundColorWith(
                            _subSectionDetails[subIndex]),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: returnShadowColorWithFields(
                                  _subSectionDetails[subIndex]),
                              blurRadius: 18,
                              offset: Offset(0.0, 6.0))
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }

  returnContainerBackgroundColorWith(SectionSubSection _subSectionDetails) {
    switch (_subSectionDetails.fieldType) {
      case "customelabel":
        return Colors.orange;
        break;
      case "button":
        return Colors.transparent;
        break;
      case "label":
        return Colors.transparent;
      default:
        return Utility()
            .returnContainerColorWithIndex(Utility().returnThemColorIndex());
        break;
    }
  }

  retunHeightWith(SectionSubSection _subSectionDetails) {
    switch (_subSectionDetails.fieldType) {
      case "customelabel":
        return (_subSectionDetails.fieldID == 1021) ? 48.0 : 0.0;
        break;
      case "label":
        return 28.0;
        break;
    }
  }

  returnShadowColorWithFields(SectionSubSection _subSectionDetails) {
    switch (_subSectionDetails.fieldType) {
      case "customelabel":
        return Colors.transparent;
        break;
      case "label":
        return Colors.transparent;
        break;
      case "button":
        return Colors.transparent;
        break;
      default:
        return Colors.grey.withOpacity(0.8);
        break;
    }
  }

  retunFieldsWith(SectionSubSection _subSectionDetails, BuildContext context,
      int index, List subSectionDetails, GlobalKey _key) {
    if (!isUpdate) {
      switch (_subSectionDetails.fieldType) {
        case "customelabel":
          return (_subSectionDetails.fieldID == 1021)
              ? CustomeLabel(_subSectionDetails.globalKey, _subSectionDetails)
              : Container();
          break;
        case "label":
          return Label(_subSectionDetails.globalKey, _subSectionDetails);
          break;
        case "phone":
          return Number(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "numeric":
          return TextBox(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "textbox":
          return TextBox(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "dropdown":
          return DropDownWidget(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails,widget.object["response"]);
          break;
        case "date":
          return DatePicker(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "emailID":
          return TextBox(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "radiogroup":
          return RadioButton(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "mediaslider":
          return MediaSlider(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "mediacontroller":
          return MediaController(_subSectionDetails.globalKey,
              callBackFromChildWithMultipleValues, _subSectionDetails, index);
          break;
        case "signature":
          return SignatureWidget(_subSectionDetails.globalKey,
              callBackFromChild, webRefNumber, _subSectionDetails);
          break;
        case "imagePicker":
          return MyImagePicker(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails, webRefNumber);
          break;
        case "textarea":
          return TextArea(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "dependentView":
          return DependentView(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "dependent":
          return Dependent(_subSectionDetails.globalKey,
              callBackFromChildWithMultipleValues, _subSectionDetails);
          break;
        case "button":
          return ButtonWidget(_subSectionDetails.globalKey,
              buttonActionWithSectionID, _subSectionDetails);
          break;
        case "time":
          return TimePicker(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "imagelable":
          return ImageLabel(_subSectionDetails.globalKey, _subSectionDetails);
          break;
        case "expandCollapse":
          return ExpandCollapse(
              _subSectionDetails.globalKey,
              callBackFromChildWithMultipleValues,
              _subSectionDetails,
              webRefNumber);
          break;
        case "coverageDetails":
          return CoverageDetails(_subSectionDetails.globalKey,
              callBackFromChild, _subSectionDetails, webRefNumber);
          break;
        case "nomineeDetails":
          return NomineeDetails(_subSectionDetails.globalKey,
              callBackFromChildWithMultipleValues, _subSectionDetails);
          break;
        case "labelView":
          return LabelView(_subSectionDetails);
          break;
        case "customButton":
          return CustomButton(buttonActionWithSectionID, _subSectionDetails);
          break;
        case "mainLabel":
          return MainLabel(_subSectionDetails.globalKey, _subSectionDetails);
          break;
        case "customDocument":
          return CustomDocument(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails, webRefNumber);
          break;
        case "customCheckbox":
          return CustomCheckbox(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "customUpload":
          return CustomUpload(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails, webRefNumber);
          break;
        case "checkbox":
          return CheckBoxWidget(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
          break;
        case "segment":
          return SegmentWidget(_subSectionDetails.globalKey, callBackFromChild,
              _subSectionDetails);
        case "customheaderlabel":
          return CustomeLabel(_subSectionDetails.globalKey, _subSectionDetails);
          break;
      }
    }
  }

//MARK:- ButtonAction
  buttonActionWithSectionID(SectionSubSection _sectionDetails) async {
    switch (_sectionDetails.fieldDependencyID) {
      case 1704:
        verifyProposalPaymentOTPInfo(
            _sectionSubSectionDetails, context, webRefNumber);
        break;
      case 1702:
        _sectionDetails.fieldValue = "1";
        hideUnHideFields(_sectionSubSectionDetails, _sectionDetails,
            widget.object["list"], context);
        setState(() {});
        break;
      case 1692:
        if (_globalKeys[_currentPage].currentState.validate()) {
          _sectionDetails.fieldValue = "1";
          hideUnHideFields(_sectionSubSectionDetails, _sectionDetails,
              widget.object["list"], context);
          setState(() {});
        }
        break;
      case 1255:
        Utility().activity(context);
        Future.delayed(const Duration(milliseconds: 600), () async {
          for (int pageIndex = 0; pageIndex < _globalKeys.length; pageIndex++) {
            if (_globalKeys[pageIndex].currentState.validate()) {
              if (pageIndex + 1 == _globalKeys.length) {
                bool isValid = await DBHelper().insertIntoFieldResponse(
                    _sectionSubSectionDetails, webRefNumber, true, false);
                if (isValid) {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BenefitDetailsScreen(
                              _sectionSubSectionDetails, webRefNumber)));
                }
              }
            } else {
              _pageControllercontroller.animateToPage(pageIndex,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              Utility().showToastMessage(LabelConstant.kMandatory);
              Navigator.pop(context);
              break;
            }
          }
        });
        break;
      case 2211:
        Utility().activity(context);
        Future.delayed(const Duration(milliseconds: 600), () async {
          for (int pageIndex = 0; pageIndex < _globalKeys.length; pageIndex++) {
            if (_globalKeys[pageIndex].currentState.validate()) {
              if (pageIndex + 1 == _globalKeys.length) {
                bool isValid = await DBHelper().insertIntoFieldResponse(
                    _sectionSubSectionDetails, webRefNumber, false, true);
                if (isValid) {
                  widget.object["businessSubID"] = 20021;
                  stopActivity();
                }
              }
            } else {
              _pageControllercontroller.animateToPage(pageIndex,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              Utility().showToastMessage(LabelConstant.kMandatory);
              Navigator.pop(context);
              break;
            }
          }
        });
        break;
      case 2213:
        Utility().activity(context);
        Future.delayed(const Duration(milliseconds: 600), () async {
          for (int pageIndex = 0; pageIndex < _globalKeys.length; pageIndex++) {
            if (_globalKeys[pageIndex].currentState.validate()) {
              if (pageIndex + 1 == _globalKeys.length) {
                bool isValid = await FormValidator()
                    .isCheckingHouseHoldingIncomeWithAMI(
                        _sectionSubSectionDetails);
                bool isTotalValid = await FormValidator()
                    .isHouseholdTotal(_sectionSubSectionDetails);
                if (isValid) {
                  if (isTotalValid) {
                    Utility().check().then((internet) async => {
                          if (internet != null && internet)
                            {
                              fNAUploadMediaFiles(
                                  webRefNumber,
                                  false,
                                  _sectionSubSectionDetails,
                                  context,
                                  _globalKeys)
                              //Upload Media files
                              //  uploadMediaFiles(true, false)
                            }
                          else
                            {
                              await DBHelper().insertIntoFieldResponse(
                                  _sectionSubSectionDetails,
                                  webRefNumber,
                                  false,
                                  false),
                              stopActivity()
                            }
                        });
                  } else {
                    _pageControllercontroller.animateToPage(4,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                    Utility().showToastMessage(LabelConstant.kHSIMessage);
                    Navigator.pop(context);
                    break;
                  }
                } else {
                  _pageControllercontroller.animateToPage(2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  Utility().showToastMessage(LabelConstant.kAVMMessage);
                  Navigator.pop(context);
                  break;
                }
                print("object");
              }
            } else {
              _pageControllercontroller.animateToPage(pageIndex,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              Utility().showToastMessage(LabelConstant.kMandatory);
              Navigator.pop(context);
            }
          }
        });
        break;
      case 1362:
        _sectionDetails.fieldValue =
            "1"; //(_sectionDetails.fieldValue.length > 0) ? (int.parse(_sectionDetails.fieldValue) + 1).toString() : "1";
        updateDepdentFieldWithFieldId(
            _sectionDetails,
            _sectionDetails.fieldID,
            _sectionDetails.subSectionID,
            _sectionDetails.fieldValue,
            false,
            List());
        break;
      case 1389:
        FocusScope.of(context).unfocus();
        Utility().activity(context);
        Future.delayed(const Duration(milliseconds: 600), () async {
          for (int pageIndex = 0; pageIndex < _globalKeys.length; pageIndex++) {
            if (_globalKeys[pageIndex].currentState != null) {
              if (_globalKeys[pageIndex].currentState.validate()) {
                if (pageIndex + 1 == _globalKeys.length) {
                  Utility().check().then((internet) => {
                        if (internet != null && internet)
                          {
                            proposalUploadMediaFiles(webRefNumber, false,
                                _sectionSubSectionDetails, context, _globalKeys)
                          }
                      });
                }
              } else {
                _pageControllercontroller.animateToPage(pageIndex,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                Utility().showToastMessage(LabelConstant.kMandatory);
                Navigator.pop(context);
                break;
              }
            }
          }
        });
        break;
      case 1391:
        FocusScope.of(context).unfocus();
        Utility().activity(context);
        Future.delayed(const Duration(milliseconds: 600), () async {
          for (int pageIndex = 0; pageIndex < _globalKeys.length; pageIndex++) {
            if (_globalKeys[pageIndex].currentState != null) {
              if (_globalKeys[pageIndex].currentState.validate()) {
                if (pageIndex + 1 == _globalKeys.length) {
                  Utility().check().then((internet) => {
                        if (internet != null && internet)
                          {
                            proposalUploadMediaFiles(webRefNumber, true,
                                _sectionSubSectionDetails, context, _globalKeys)
                          }
                      });
                }
              } else {
                _pageControllercontroller.animateToPage(pageIndex,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                Utility().showToastMessage(LabelConstant.kMandatory);
                Navigator.pop(context);
                break;
              }
            }
          }
        });
        break;
    }
  }

//MARK:- callBackFromChild
  void callBackFromChild(int sectionID, int subSectionId, int fieldID,
      String fieldValue, int index) {
    var sectionSubSection =
        (_sectionSubSectionDetails[subSectionId][index] as SectionSubSection);
    if (fieldID == 1096 && fieldValue == "0") {
      sectionSubSection.fieldValue = fieldValue;
      showAlertDailodWihtsectionID(sectionID, subSectionId, fieldID, fieldValue,
          index, sectionSubSection);
    } else if (sectionSubSection.subSectionID == 1019 &&
        sectionSubSection.fieldDependencyID >= 1310 &&
        sectionSubSection.fieldDependencyID <= 1350) {
      if (sectionSubSection.fieldDependencyID == 1310) {
        sectionSubSection.fieldValue = fieldValue;
      }
      updateLifeToBeAssured(fieldID, subSectionId, fieldValue, index);
    } else {
      sectionSubSection.fieldValue = fieldValue;
      if (sectionSubSection.isDependent) {
        if (sectionSubSection.sectionID == 6000) {
          hideUnHideFields(_sectionSubSectionDetails, sectionSubSection,
              widget.object["list"], context);
          setState(() {});
        } else {
          updateDepdentFieldWithFieldId(sectionSubSection, fieldID,
              subSectionId, fieldValue, false, List());
        }
      }
    }
    if (_autoValidateArray[_currentPage]) {
      _globalKeys[_currentPage].currentState.validate();
    }
    // ignore: unrelated_type_equality_checks
    if ((fieldID == 1027 || fieldID == 1115) &&
        (fieldValue.length == 10 || fieldValue.length == 12)) {
      if (FormValidator().validateNICNo(fieldValue, sectionSubSection) ==
          null) {
        updateAgeGenderWithNICNo(fieldValue, sectionID, subSectionId,
            sectionSubSection.fieldDependencyID);
      }
    }
    //Updating the UI
    updateUI(sectionSubSection);
  }

  void updateUI(SectionSubSection _sectionSubSection) {
    if (_sectionSubSection.fieldDependencyID == 1240 ||
        _sectionSubSection.fieldDependencyID == 1241 ||
        _sectionSubSection.fieldDependencyID == 1242 ||
        _sectionSubSection.fieldDependencyID == 1243 ||
        _sectionSubSection.fieldDependencyID == 1250 ||
        _sectionSubSection.fieldDependencyID == 1041 ||
        _sectionSubSection.fieldDependencyID == 1123 ||
        _sectionSubSection.fieldDependencyID == 1253) {
      setState(() {});
    }
  }

  void showAlertDailodWihtsectionID(
      int sectionID,
      int subSectionId,
      int fieldID,
      String fieldValue,
      int index,
      SectionSubSection sectionSubSection) {
    // set up the button
    Widget confirmButton = FlatButton(
      child: Text(ButtonLableConstant.kContinue),
      onPressed: () {
        Navigator.pop(context);
        updateDepdentFieldWithFieldId(
            sectionSubSection, fieldID, subSectionId, fieldValue, true, List());
        //Updating the UI
        updateUI(sectionSubSection);
      },
    );
    Widget cancelButton = FlatButton(
      child: Text(ButtonLableConstant.kCancel),
      onPressed: () {
        Navigator.pop(context);
        updateDepdentFieldWithFieldId(sectionSubSection, fieldID, subSectionId,
            fieldValue, false, List());
        //Updating the UI
        updateUI(sectionSubSection);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(LabelConstant.kConfirmationMessage),
      content: Text(LabelConstant.kPolicies),
      actions: [confirmButton, cancelButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void updateAgeGenderWithNICNo(String nicNumber, int sectionID,
      int subSectionID, int fieldDependencyID) {
    final tempDict =
        Utility().returnDateOfBirthAgeGenderFromNICNumber(nicNumber);
    if (tempDict.length > 0) {
      final dobIndex = returnIndexWithField(
          (fieldDependencyID == 1258)
              ? 1259
              : (fieldDependencyID == 1246)
                  ? 1247
                  : 1033,
          _sectionSubSectionDetails[subSectionID]);
      final dob = (_sectionSubSectionDetails[subSectionID][dobIndex]
          as SectionSubSection);
      final _dobGlobalKey = dob.globalKey;
      final _dobCurrentState = _dobGlobalKey.currentState as DatePickerState;
      dob.isEditable = false;
      _dobCurrentState.setUpdatedValue(tempDict["date"], dob);
      dob.fieldValue = tempDict["date"];

      //1003
      //Section DOB
      final _neddAnalysisDOB =
          (_sectionSubSectionDetails[1003][4] as SectionSubSection);
      _neddAnalysisDOB.fieldValue = tempDict["date"];
      final _needAnalysisdobGlobalKey = _neddAnalysisDOB.globalKey;
      if (_needAnalysisdobGlobalKey.currentState != null) {
        final _needAnalysisDobCurrentState =
            _needAnalysisdobGlobalKey.currentState as DatePickerState;
        _needAnalysisDobCurrentState.setUpdatedValue(
            tempDict["date"], _neddAnalysisDOB);
      }
      //Age
      final _neddAnalysisAge =
          (_sectionSubSectionDetails[1003][5] as SectionSubSection);
      final _needAnalysisdobAgeGlobalKey = _neddAnalysisAge.globalKey;
      if (_needAnalysisdobAgeGlobalKey.currentState != null) {
        _neddAnalysisAge.fieldValue = tempDict["age"];
        final _needAnalysisAgeCurrentState =
            _needAnalysisdobAgeGlobalKey.currentState as TextBoxState;
        _needAnalysisAgeCurrentState.refreshState(tempDict["age"], false);
      }

      final ageIndex = returnIndexWithField(
          (fieldDependencyID == 1258)
              ? 1260
              : (fieldDependencyID == 1246)
                  ? 1248
                  : 1034,
          _sectionSubSectionDetails[subSectionID]);
      final age = (_sectionSubSectionDetails[subSectionID][ageIndex]
          as SectionSubSection);
      final _ageGlobalKey = age.globalKey;
      final _ageCurrentState = _ageGlobalKey.currentState as TextBoxState;
      _ageCurrentState.refreshState(tempDict["age"], false);
      age.fieldValue = tempDict["age"];

      final genderIndex = returnIndexWithField(
          (fieldDependencyID == 1258)
              ? 1257
              : (fieldDependencyID == 1246)
                  ? 1245
                  : 1032,
          _sectionSubSectionDetails[subSectionID]);
      final gender = (_sectionSubSectionDetails[subSectionID][genderIndex]
          as SectionSubSection);
      final _genderGlobalKey = gender.globalKey;
      final _genderCurrentState =
          _genderGlobalKey.currentState as DropDownWidgetState;
      gender.isEditable = false;
      if (fieldDependencyID == 1246) {
        final tempIndex =
            returnIndexWithField(1245, _sectionSubSectionDetails[1016]);
        final genderSectionSubSection =
            (_sectionSubSectionDetails[1016][tempIndex] as SectionSubSection);
        var isValid = true;
        if (tempDict["gender"] == "Male" &&
            genderSectionSubSection.fieldValue != "20") {
          isValid = false;
        } else if (tempDict["gender"] == "Female" &&
            genderSectionSubSection.fieldValue != "21") {
          isValid = false;
        } else if (isValid) {
          _genderCurrentState.setUpdatedValue(tempDict["gender"], gender);
        }
        if (!isValid) {
          Utility().alertDialog(context, LabelConstant.kInvalidNIC, 0);
          final nicIndex = returnIndexWithField(
              fieldDependencyID, _sectionSubSectionDetails[1016]);
          final nicSectionSubSection =
              (_sectionSubSectionDetails[1016][nicIndex] as SectionSubSection);
          nicSectionSubSection.fieldValue = "";
          final globalKey = nicSectionSubSection.globalKey;
          if (globalKey.currentState != null) {
            final globalKey = nicSectionSubSection.globalKey;
            final currentState = globalKey.currentState as TextBoxState;
            currentState.refreshState("", false);
          }
        }
      } else {
        _genderCurrentState.setUpdatedValue(tempDict["gender"], gender);
        gender.fieldValue = ((tempDict["gender"] == "Male") ? "20" : "21");
      }
    }
  }

  void callBackFromChildWithMultipleValues(
      int sectionID, int subSectionId, int fieldID, fieldValue, int index) {
    var sectionSubSection =
        (_sectionSubSectionDetails[subSectionId][index] as SectionSubSection);
    if (sectionID == 6000 &&
        subSectionId == 1026 &&
        fieldID == 1138 &&
        (fieldValue == "1692" || fieldValue == "1702")) {
      if (_globalKeys[_currentPage].currentState.validate()) {
        final globalKey = sectionSubSection.globalKey;
        final currentState = globalKey.currentState;
        if (currentState is ExpandCollapseState) {
         // currentState.updateCurrentState(fieldValue);
        }
      } else {
        Utility().showToastMessage(LabelConstant.kMandatory);
      }
    } else if (sectionSubSection.fieldDependencyID == 1352) {
      var segmentSectionSubSection =
          (_sectionSubSectionDetails[subSectionId][1] as SectionSubSection);
      final selectedIndex =
          int.parse(segmentSectionSubSection.fieldValue.split(",")[0]);
      final tempFieldValue = sectionSubSection.fieldValue.split("@");
      tempFieldValue[selectedIndex] = jsonEncode(fieldValue);
      sectionSubSection.fieldValue = tempFieldValue.join("@");
    } else if (fieldID == 1086) {
      var tempArray = [];
      if (fieldValue.length > 0) {
        for (final value in fieldValue) {
          final encode = jsonEncode(value);
          tempArray.add(encode);
        }
      }
      final encodeArray = json.encode(tempArray);
      sectionSubSection.fieldValue = encodeArray;
    } else {
      sectionSubSection.fieldValue = jsonEncode(fieldValue);
    }
    if (sectionSubSection.isDependent) {
      updateDepdentFieldWithFieldId(
          sectionSubSection,
          fieldID,
          subSectionId,
          ((fieldID == 1086) ? "${fieldValue.length}" : fieldValue["2"]),
          false,
          fieldValue);
    }
    if (_autoValidateArray[_currentPage]) {
      _globalKeys[_currentPage].currentState.validate();
    }
  }

//MARK:- isSpouse
  returnisChild(SectionSubSection sectionSubSection, List<String> depdentIDs) {
    if (sectionSubSection.fieldDependencyID == 1240 ||
        sectionSubSection.fieldDependencyID == 1241) {
      final insuredSectionSubSection =
          (_sectionSubSectionDetails[1016][8] as SectionSubSection);
      final childSectionSubSection =
          (_sectionSubSectionDetails[1010][16] as SectionSubSection);
      if (insuredSectionSubSection.fieldValue.length > 0) {
        if (insuredSectionSubSection.fieldValue == "1") {
          if (childSectionSubSection.fieldValue.length <= 0) {
            final spouseIds = [1250, 1251, 1252];
            for (final id in spouseIds) {
              depdentIDs.remove(id.toString());
            }
          } else if (int.parse(childSectionSubSection.fieldValue) == 0) {
            final spouseIds = [1250, 1251, 1252];
            for (final id in spouseIds) {
              depdentIDs.remove(id.toString());
            }
          }
          return depdentIDs;
        }
      }
    }
    return depdentIDs;
  }

//MARK:- isChild
  returnisSpouse(SectionSubSection sectionSubSection, List<String> depdentIDs) {
    if (sectionSubSection.fieldDependencyID == 1240 ||
        sectionSubSection.fieldDependencyID == 1241) {
      final insuredSectionSubSection =
          (_sectionSubSectionDetails[1016][8] as SectionSubSection);
      final marriedSectionSubSection =
          (_sectionSubSectionDetails[1010][6] as SectionSubSection);
      if (insuredSectionSubSection.fieldValue.length > 0) {
        if (insuredSectionSubSection.fieldValue == "1") {
          if (marriedSectionSubSection.fieldValue == "1") {
            return depdentIDs;
          } else if (marriedSectionSubSection.fieldValue == "0") {
            final spouseIds = [1243, 1244, 1245, 1246, 1247, 1248, 1249];
            for (final id in spouseIds) {
              depdentIDs.remove(id.toString());
            }
          }
          return depdentIDs;
        }
      }
    }
    return depdentIDs;
  }

  Future<void> updateLifeToBeAssured(
      int fieldID, int subSectionId, String fieldValue, int index) async {
    var sectionSubSection =
        (_sectionSubSectionDetails[subSectionId][index] as SectionSubSection);
    var tempArray = sectionSubSection.fieldValue.split(",");
    final segmentSectionSubsection =
        (_sectionSubSectionDetails[1019] as List)[1] as SectionSubSection;
    final selectedIndex =
        int.parse(segmentSectionSubsection.fieldValue.split(",")[0]);
    final filedArray = [
      1312,
      1313,
      1314,
      1315,
      1321,
      1322,
      1325,
      1326,
      1327,
      1328,
      1330,
      1331,
      1332,
      1333,
      1334,
      1336,
      1337,
      1338,
      1339,
      1340,
      1341,
      1342,
      1343,
      1344,
      1345,
      1346,
      1347,
      1348,
      1349,
      1335
    ];
    if (filedArray.contains(sectionSubSection.fieldDependencyID)) {
      tempArray[selectedIndex] = fieldValue;
      sectionSubSection.fieldValue = tempArray.join(",");
    }
    if (sectionSubSection.fieldDependencyID == 1344) {
      final fieldArray = [1345, 1346, 1347, 1348, 1349, 1350];
      final deptArray = [1337, 1338, 1339, 1340, 1341, 1342];
      var arrayIndex = 0;
      for (final item in fieldArray) {
        final deptIndex = returnIndexWithField(
            deptArray[arrayIndex], _sectionSubSectionDetails[subSectionId]);
        var deptSectionSubSection = ((_sectionSubSectionDetails[subSectionId]
            [deptIndex]) as SectionSubSection);
        final fieldIndex =
            returnIndexWithField(item, _sectionSubSectionDetails[subSectionId]);
        var fieldValueSectionSubSection =
            ((_sectionSubSectionDetails[subSectionId][fieldIndex])
                as SectionSubSection);
        var tempArray = fieldValueSectionSubSection.fieldValue.split(",");
        tempArray[selectedIndex] = (fieldValue == "1")
            ? deptSectionSubSection.fieldValue.split(",")[selectedIndex]
            : "";
        fieldValueSectionSubSection.fieldValue = tempArray.join(",");
        final globalKey = fieldValueSectionSubSection.globalKey;
        if (globalKey.currentState is TextBoxState) {
          final currentState = globalKey.currentState as TextBoxState;
          currentState.refreshState(
              (fieldValue == "1")
                  ? deptSectionSubSection.fieldValue.split(",")[selectedIndex]
                  : "",
              false);
        } else if (globalKey.currentState is DropDownWidgetState) {
          final currentState = globalKey.currentState as DropDownWidgetState;
          currentState.setUpdatedFiedValueWithFieldID(
              fieldValueSectionSubSection.fieldID,
              (fieldValue == "1")
                  ? deptSectionSubSection.fieldValue.split(",")[selectedIndex]
                  : "");
        }
        arrayIndex = arrayIndex + 1;
      }
    } else if (sectionSubSection.fieldDependencyID == 1336) {
      final fieldArray = [1337, 1338, 1339, 1340, 1341, 1342];
      final deptArray = [1294, 1295, 1296, 1297, 1298, 1299];
      var arrayIndex = 0;
      for (final item in fieldArray) {
        final deptIndex = returnIndexWithField(
            deptArray[arrayIndex], _sectionSubSectionDetails[1018]);
        var deptSectionSubSection =
            ((_sectionSubSectionDetails[1018][deptIndex]) as SectionSubSection);
        final fieldIndex =
            returnIndexWithField(item, _sectionSubSectionDetails[subSectionId]);
        var fieldValueSectionSubSection =
            ((_sectionSubSectionDetails[subSectionId][fieldIndex])
                as SectionSubSection);
        var tempArray = fieldValueSectionSubSection.fieldValue.split(",");
        tempArray[selectedIndex] =
            (fieldValue == "1") ? deptSectionSubSection.fieldValue : "";
        fieldValueSectionSubSection.fieldValue = tempArray.join(",");
        final globalKey = fieldValueSectionSubSection.globalKey;
        if (globalKey.currentState is TextBoxState) {
          final currentState = globalKey.currentState as TextBoxState;
          currentState.refreshState(
              (fieldValue == "1") ? deptSectionSubSection.fieldValue : "",
              false);
        } else if (globalKey.currentState is DropDownWidgetState) {
          final currentState = globalKey.currentState as DropDownWidgetState;
          currentState.setUpdatedFiedValueWithFieldID(
              fieldValueSectionSubSection.fieldID,
              (fieldValue == "1") ? deptSectionSubSection.fieldValue : "");
        }
        arrayIndex = arrayIndex + 1;
      }
    } else if (sectionSubSection.fieldDependencyID == 1313 ||
        sectionSubSection.fieldDependencyID == 1315) {
      final index =
          returnIndexWithField(1316, _sectionSubSectionDetails[subSectionId]);
      var deptSectionSubSection = ((_sectionSubSectionDetails[subSectionId]
          [index]) as SectionSubSection);
      final deptTempArray = deptSectionSubSection.fieldValue.split(",");
      //Firname Index
      final firstNameIndex =
          returnIndexWithField(1313, _sectionSubSectionDetails[subSectionId]);
      final firstNameSectionSubSection =
          ((_sectionSubSectionDetails[subSectionId][firstNameIndex])
              as SectionSubSection);
      //Last name
      final lastNameIndex =
          returnIndexWithField(1315, _sectionSubSectionDetails[subSectionId]);
      final lastNameSectionSubSection =
          ((_sectionSubSectionDetails[subSectionId][lastNameIndex])
              as SectionSubSection);

      final nameWithInitialFieldValue =
          (firstNameSectionSubSection.fieldValue.split(",")[selectedIndex])[0] +
              " " +
              lastNameSectionSubSection.fieldValue.split(",")[selectedIndex];
      deptTempArray[selectedIndex] = nameWithInitialFieldValue;
      deptSectionSubSection.fieldValue = deptTempArray.join(",");
      final globalKey = deptSectionSubSection.globalKey;
      final currentState = globalKey.currentState as TextBoxState;
      currentState.refreshState(nameWithInitialFieldValue, false);
    } else if (sectionSubSection.fieldDependencyID == 1310) {
      final fieldArray = [
        1311,
        1312,
        1313,
        1314,
        1315,
        1316,
        1317,
        1318,
        1319,
        1321,
        1320,
        1322,
        1323,
        1324,
        1325,
        1326,
        1327,
        1328,
        1329,
        1330,
        1331,
        1332,
        1333,
        1334,
        1336,
        1337,
        1338,
        1339,
        1340,
        1341,
        1342,
        1343,
        1344,
        1345,
        1346,
        1347,
        1348,
        1349,
        1350,
        1335
      ];
      final updateFieldArray = [
        1311,
        1312,
        1313,
        1314,
        1315,
        1316,
        1317,
        1318,
        1319,
        1321
      ];
      for (final item in fieldArray) {
        if (item == 1344 || item == 1301) {
          print("");
        }
        final index =
            returnIndexWithField(item, _sectionSubSectionDetails[subSectionId]);
        final deptSectionSubSection = ((_sectionSubSectionDetails[subSectionId]
            [index]) as SectionSubSection);
        final deptTempArray = deptSectionSubSection.fieldValue.split(",");
        final globalKey = deptSectionSubSection.globalKey;
        final isHide =
            (tempArray[selectedIndex + 1].toLowerCase().contains("child"))
                ? true
                : false;
        if (globalKey.currentState is DropDownWidgetState) {
          final currentState = globalKey.currentState as DropDownWidgetState;
          currentState.setUpdatedFiedValueWithFieldID(
              deptSectionSubSection.fieldID, deptTempArray[selectedIndex]);
          if (!updateFieldArray.contains(item)) {
            currentState.refreshIsDepdent(isHide);
          }
        } else if (globalKey.currentState is TextBoxState) {
          final currentState = globalKey.currentState as TextBoxState;
          currentState.updateValueWithFieldId(
              (item == 1311) ? 1232 : deptSectionSubSection.fieldID,
              deptTempArray[selectedIndex]);
          if (!updateFieldArray.contains(item)) {
            currentState.refreshIsDepdent(isHide);
          }
        } else if (globalKey.currentState is NumberState) {
          final currentState = globalKey.currentState as NumberState;
          currentState.setUpdatedValue(deptTempArray[selectedIndex]);
          if (!updateFieldArray.contains(item)) {
            currentState.refreshIsDepdent(isHide);
          }
        } else if (globalKey.currentState is CheckBoxWidgetState) {
          final currentState = globalKey.currentState as CheckBoxWidgetState;
          currentState.refreshIsDepdent(isHide);
        } else if (globalKey.currentState is CustomCheckboxState) {
          final currentState = globalKey.currentState as CustomCheckboxState;
          currentState.refreshIsDepdent(isHide);
        } else if (globalKey.currentState is LabelState) {
          final currentState = globalKey.currentState as LabelState;
          currentState.refreshIsDepdent(isHide);
        } else if (globalKey.currentState is DatePickerState) {
          final currentState = globalKey.currentState as DatePickerState;
          currentState.updateVale(deptTempArray[selectedIndex]);
          if (!updateFieldArray.contains(item)) {
            currentState.setRefreshState(isHide);
          }
        }
      }
    } else {
      if (sectionSubSection.isDependent) {
        updateDepdentFieldWithFieldId(sectionSubSection, fieldID, subSectionId,
            fieldValue, false, List());
      }
    }
  }

  Future<void> updateDepdentFieldWithFieldId(
      SectionSubSection sectionSubSection,
      int fieldID,
      int subSectionId,
      String fieldValue,
      bool isContinue,
      listValue) async {
    var depdentIDs = sectionSubSection.dependentIDs.split(",");
    depdentIDs.removeLast();
    depdentIDs = returnisSpouse(sectionSubSection, depdentIDs);
    depdentIDs = returnisChild(sectionSubSection, depdentIDs);
    if (depdentIDs.length > 0) {
      for (final id in depdentIDs) {
        final tempSubSectionID =
            returnSubSectionIDWithFieldID(fieldID, subSectionId, int.parse(id));
        final index = returnIndexWithField(
            int.parse(id), _sectionSubSectionDetails[tempSubSectionID]);
        if (index != null) {
          final deptSectionSubSection =
              ((_sectionSubSectionDetails[tempSubSectionID][index])
                  as SectionSubSection);
          final globalKey = deptSectionSubSection.globalKey;
          switch (deptSectionSubSection.fieldID) {
            case 1387:
              if (fieldID == 1382) {
                final jsonValue = jsonDecode(fieldValue);
                var total = 0;
                for (final item in jsonValue) {
                  total = total +
                      ((item["6"].length > 0)
                          ? int.parse(item["6"].replaceAll(',', ''))
                          : 0);
                }
                deptSectionSubSection.fieldValue =
                    '${_formatNumber(total.round().toString())}';
              } else {
                deptSectionSubSection.isHide =
                    (fieldValue == "0") ? true : false;
              }

              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                // ignore: unnecessary_statements
                (fieldID == 1382)
                    ? (currentState
                        .updateValue(deptSectionSubSection.fieldValue))
                    :
                    // ignore: unnecessary_statements
                    (currentState.refreshState(
                        ((fieldValue == "0")
                            ? "0"
                            : ((sectionSubSection.fieldDependencyID != 1102)
                                ? "1"
                                : "0")),
                        true));
              }
              break;
            case 1386:
              if (fieldID == 1382) {
                final jsonValue = jsonDecode(fieldValue);
                var total = 0;
                for (final item in jsonValue) {
                  total = total +
                      ((item["5"].length > 0)
                          ? int.parse(item["5"].replaceAll(',', ''))
                          : 0);
                }
                deptSectionSubSection.fieldValue =
                    '${_formatNumber(total.round().toString())}';
              } else {
                deptSectionSubSection.isHide =
                    (fieldValue == "0") ? true : false;
              }

              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                // ignore: unnecessary_statements
                (fieldID == 1382)
                    ? (currentState
                        .updateValue(deptSectionSubSection.fieldValue))
                    :
                    // ignore: unnecessary_statements
                    (currentState.refreshState(
                        ((fieldValue == "0")
                            ? "0"
                            : ((sectionSubSection.fieldDependencyID != 1102)
                                ? "1"
                                : "0")),
                        true));
              }
              break;
            case 1385:
              if (fieldID == 1382) {
                final jsonValue = jsonDecode(fieldValue);
                var total = 0;
                for (final item in jsonValue) {
                  total = total +
                      ((item["4"].length > 0)
                          ? int.parse(item["4"].replaceAll(',', ''))
                          : 0);
                }
                deptSectionSubSection.fieldValue =
                    '${_formatNumber(total.round().toString())}';
              } else {
                deptSectionSubSection.isHide =
                    (fieldValue == "0") ? true : false;
              }

              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                // ignore: unnecessary_statements
                (fieldID == 1382)
                    ? (currentState
                        .updateValue(deptSectionSubSection.fieldValue))
                    :
                    // ignore: unnecessary_statements
                    (currentState.refreshState(
                        ((fieldValue == "0")
                            ? "0"
                            : ((sectionSubSection.fieldDependencyID != 1102)
                                ? "1"
                                : "0")),
                        true));
              }
              break;
            case 1384:
              if (fieldID == 1382) {
                final jsonValue = jsonDecode(fieldValue);
                var total = 0;
                for (final item in jsonValue) {
                  total = total +
                      ((item["3"].length > 0)
                          ? int.parse(item["3"].replaceAll(',', ''))
                          : 0);
                }
                deptSectionSubSection.fieldValue =
                    '${_formatNumber(total.round().toString())}';
              } else {
                deptSectionSubSection.isHide =
                    (fieldValue == "0") ? true : false;
              }

              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                // ignore: unnecessary_statements
                (fieldID == 1382)
                    ? (currentState
                        .updateValue(deptSectionSubSection.fieldValue))
                    :
                    // ignore: unnecessary_statements
                    (currentState.refreshState(
                        ((fieldValue == "0")
                            ? "0"
                            : ((sectionSubSection.fieldDependencyID != 1102)
                                ? "1"
                                : "0")),
                        true));
              }
              break;
            case 1383:
              if (fieldID == 1382) {
                final jsonValue = jsonDecode(fieldValue);
                var total = 0;
                for (final item in jsonValue) {
                  total = total +
                      ((item["2"].length > 0)
                          ? int.parse(item["2"].replaceAll(',', ''))
                          : 0);
                }
                deptSectionSubSection.fieldValue =
                    '${_formatNumber(total.round().toString())}';
              } else {
                deptSectionSubSection.isHide =
                    (fieldValue == "0") ? true : false;
              }

              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                // ignore: unnecessary_statements
                (fieldID == 1382)
                    ? (currentState
                        .updateValue(deptSectionSubSection.fieldValue))
                    :
                    // ignore: unnecessary_statements
                    (currentState.refreshState(
                        ((fieldValue == "0")
                            ? "0"
                            : ((sectionSubSection.fieldDependencyID != 1102)
                                ? "1"
                                : "0")),
                        true));
              }
              break;
            case 1382:
              if (globalKey.currentState != null) {
                final currentState =
                    globalKey.currentState as CustomDocumentState;
                currentState.updateDocumentCount((fieldValue.length > 0 &&
                        sectionSubSection.fieldDependencyID != 1102)
                    ? int.parse(fieldValue)
                    : 0);
                if (sectionSubSection.fieldDependencyID == 1102) {
                  final otherPolicyIndex = returnIndexWithField(
                      1104, _sectionSubSectionDetails[1006]);
                  var otherPolicySectionSubSection =
                      (_sectionSubSectionDetails[1006][otherPolicyIndex]
                          as SectionSubSection);
                  otherPolicySectionSubSection.fieldValue = "0";
                  final otherPolicyGlobalKey =
                      otherPolicySectionSubSection.globalKey;
                  if (otherPolicyGlobalKey != null) {
                    final currentState =
                        otherPolicyGlobalKey.currentState as TextBoxState;
                    currentState.refreshState(
                        otherPolicySectionSubSection.fieldValue, false);
                  }
                }
              }
              break;
            case 1063:
              deptSectionSubSection.isHide =
                  (fieldValue == "14") ? false : true;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(
                    ((fieldValue == "14") ? "1" : "0"), true);
              }
              break;
            case 1145:
              if (globalKey.currentState != null) {
                final currentState =
                    globalKey.currentState as NomineeDetailsState;
                currentState.refreshStateWithValue(fieldValue);
              }
              break;
            case 1141:
              Navigator.pop(context);
              deptSectionSubSection.fieldValue = fieldValue.split(",")[0];
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.updateValueWithFieldId(
                    deptSectionSubSection.fieldID,
                    deptSectionSubSection.fieldValue);
              }
              break;
            case 1142:
              deptSectionSubSection.fieldValue = fieldValue.split(",")[1];
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.updateValueWithFieldId(
                    deptSectionSubSection.fieldID,
                    deptSectionSubSection.fieldValue);
              }
              break;
            case 1138:
              if (globalKey.currentState != null) {
                final currentState =
                    globalKey.currentState as ExpandCollapseState;
                final segmentIndex = fieldValue.split(",")[0];
                currentState.updateState(int.parse(segmentIndex),
                    fieldValue.split(",")[(int.parse(segmentIndex) + 1)]);
              }
              break;
            case 1139:
              if (globalKey.currentState != null) {
                Future.delayed(const Duration(milliseconds: 600), () async {
                  alertDialog(context, LabelConstant.kPremiumChange,
                      webRefNumber, fieldValue, globalKey);
                });
              }
              break;
            case 1114:
              var nameWithInitial = "";
              final firstNameIndex =
                  returnIndexWithField(1272, _sectionSubSectionDetails[1018]);
              var firstNameSectionSubSection = (_sectionSubSectionDetails[1018]
                  [firstNameIndex] as SectionSubSection);
              final firstNameFieldValue =
                  (firstNameSectionSubSection.fieldValue.length > 0)
                      ? firstNameSectionSubSection.fieldValue[0]
                      : "";
              nameWithInitial = firstNameFieldValue;
              final lastNameIndex =
                  returnIndexWithField(1274, _sectionSubSectionDetails[1018]);
              var lastNameSectionSubSection = (_sectionSubSectionDetails[1018]
                  [lastNameIndex] as SectionSubSection);
              final lastNameFieldValue =
                  (lastNameSectionSubSection.fieldValue.length > 0)
                      ? lastNameSectionSubSection.fieldValue.substring(0)
                      : "";
              nameWithInitial = nameWithInitial + " " + lastNameFieldValue;
              deptSectionSubSection.fieldValue = nameWithInitial;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(
                    deptSectionSubSection.fieldValue, false);
              }
              break;
            case 1014:
              final index =
                  returnIndexWithField(1294, _sectionSubSectionDetails[1018]);
              var sectionSubSection =
                  (_sectionSubSectionDetails[1018][index] as SectionSubSection);
              deptSectionSubSection.fieldValue =
                  (fieldValue == "1") ? sectionSubSection.fieldValue : "";
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(
                    deptSectionSubSection.fieldValue, false);
              }
              break;
            case 1015:
              final index =
                  returnIndexWithField(1295, _sectionSubSectionDetails[1018]);
              var sectionSubSection =
                  (_sectionSubSectionDetails[1018][index] as SectionSubSection);
              deptSectionSubSection.fieldValue =
                  (fieldValue == "1") ? sectionSubSection.fieldValue : "";
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(
                    deptSectionSubSection.fieldValue, false);
              }
              break;
            case 1016:
              final index =
                  returnIndexWithField(1296, _sectionSubSectionDetails[1018]);
              var sectionSubSection =
                  (_sectionSubSectionDetails[1018][index] as SectionSubSection);
              deptSectionSubSection.fieldValue =
                  (fieldValue == "1") ? sectionSubSection.fieldValue : "";
              if (globalKey.currentState != null) {
                final currentState =
                    globalKey.currentState as DropDownWidgetState;
                currentState.setUpdatedValue(
                    deptSectionSubSection.fieldValue, deptSectionSubSection);
              }
              break;
            case 1011:
              if (tempSubSectionID == 1003 && fieldID == 1030) {
                var sectionSubSection =
                    (_sectionSubSectionDetails[tempSubSectionID][index]
                        as SectionSubSection);
                sectionSubSection.isHide = (fieldValue == "14") ? false : true;
                if (globalKey.currentState != null) {
                  final currentState = globalKey.currentState as TextBoxState;
                  currentState
                      .refreshIsDepdent((fieldValue == "14") ? false : true);
                }
              } else if (id == "1248" || id == "1260") {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1260 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1248 &&
                            (fieldValue == "2" || fieldValue == "3"))
                        ? false
                        : (fieldValue == "1" && (fieldID == 1098))
                            ? false
                            : (fieldID == 1095 &&
                                    sectionSubSection.fieldDependencyID ==
                                        1248 &&
                                    fieldValue == "1")
                                ? false
                                : (fieldID == 1096 &&
                                        sectionSubSection.fieldDependencyID ==
                                            1248)
                                    ? ((isContinue) ? true : false)
                                    : true;
                if (globalKey.currentState != null) {
                  final ageGlobalKey = sectionSubSection.globalKey;
                  final currentState =
                      ageGlobalKey.currentState as TextBoxState;
                  currentState.refreshIsDepdent((fieldID == 1097 &&
                          sectionSubSection.fieldDependencyID == 1260 &&
                          (fieldValue == "1"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1248 &&
                              (fieldValue == "2" || fieldValue == "3"))
                          ? false
                          : (fieldValue == "1" && (fieldID == 1098))
                              ? false
                              : (fieldID == 1095 &&
                                      sectionSubSection.fieldDependencyID ==
                                          1248 &&
                                      fieldValue == "1")
                                  ? false
                                  : (fieldID == 1096 &&
                                          sectionSubSection.fieldDependencyID ==
                                              1248)
                                      ? ((isContinue) ? true : false)
                                      : true);
                }
              } else {
                final selectedDate = DateTime.parse(fieldValue);
                Duration duration = DateTime.now().difference(selectedDate);
                final numberOfYears =
                    (((duration.inDays / 365).floor()) + 1).toString();
                if ((int.parse(numberOfYears) + 1) >= 18) {
                  var sectionSubSection =
                      (_sectionSubSectionDetails[tempSubSectionID][index]
                          as SectionSubSection);
                  sectionSubSection.fieldValue = numberOfYears;
                  if (globalKey.currentState != null) {
                    final currentState = globalKey.currentState as TextBoxState;
                    currentState.refreshState(numberOfYears, false);
                  }
                } else {
                  Utility().alertDialog(
                      context, "Suspect is a Minor. Unable to Continue.", 0);
                }
              }
              break;
            case 1097:
              if (fieldID == 1096 || fieldID == 1097) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldValue == "1")
                    ? true
                    : (!isContinue)
                        ? true
                        : false;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as DropDownWidgetState;
                  currentState.refreshIsDepdent((fieldValue == "1")
                      ? true
                      : (!isContinue)
                          ? true
                          : false);
                }
              }
              break;
            case 1098:
              if (fieldID == 1095 || fieldID == 1097 || fieldID == 1096) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1256 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1244 &&
                            (fieldValue == "2" || fieldValue == "3"))
                        ? false
                        : (fieldValue == "1" && (fieldID == 1095))
                            ? false
                            : (fieldID == 1096)
                                ? ((isContinue) ? true : false)
                                : true;
                sectionSubSection.fieldValue = (fieldValue == "1") ? "1" : "0";
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as RadioButtonState;
                  currentState.refreshIsDepdent((fieldID == 1097 &&
                          sectionSubSection.fieldDependencyID == 1256 &&
                          (fieldValue == "1"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1244 &&
                              (fieldValue == "2" || fieldValue == "3"))
                          ? false
                          : (fieldValue == "1" && (fieldID == 1095))
                              ? false
                              : (fieldID == 1096)
                                  ? ((isContinue) ? true : false)
                                  : true);
                  currentState
                      .updatecurrentTimeValue((fieldValue == "1") ? 1 : 0);
                }
              }
              break;
            case 1010:
              final index = returnIndexWithField(
                  int.parse(id),
                  _sectionSubSectionDetails[
                      (fieldID == 1095 || fieldID == 1098 || fieldID == 1097)
                          ? 1016
                          : tempSubSectionID]);
              var sectionSubSection = (_sectionSubSectionDetails[
                  (fieldID == 1095 || fieldID == 1098 || fieldID == 1097)
                      ? 1016
                      : tempSubSectionID][index] as SectionSubSection);
              final dateGlobalKey = sectionSubSection.globalKey;
              sectionSubSection.isHide = (fieldValue ==
                      ((fieldID == 1098) ? "1" : "14"))
                  ? false
                  : (fieldID == 1097 &&
                          sectionSubSection.fieldDependencyID == 1259 &&
                          (fieldValue == "1"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1247 &&
                              (fieldValue == "2" || fieldValue == "3"))
                          ? false
                          : (fieldID == 1095 &&
                                  sectionSubSection.fieldDependencyID == 1247 &&
                                  fieldValue == "1")
                              ? false
                              : (fieldID == 1096 &&
                                      sectionSubSection.fieldDependencyID ==
                                          1247)
                                  ? ((isContinue) ? true : false)
                                  : true;
              if (dateGlobalKey.currentState != null) {
                final currentState =
                    dateGlobalKey.currentState as DatePickerState;
                currentState.setRefreshState((fieldValue ==
                        ((fieldID == 1098) ? "1" : "14"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1259 &&
                            (fieldValue == "1"))
                        ? false
                        : (fieldID == 1097 &&
                                sectionSubSection.fieldDependencyID == 1247 &&
                                (fieldValue == "2" || fieldValue == "3"))
                            ? false
                            : (fieldID == 1095 &&
                                    sectionSubSection.fieldDependencyID ==
                                        1247 &&
                                    fieldValue == "1")
                                ? false
                                : (fieldID == 1096 &&
                                        sectionSubSection.fieldDependencyID ==
                                            1247)
                                    ? ((isContinue) ? true : false)
                                    : true);
              }
              break;
            case 1032:
              final index = returnIndexWithField(
                  int.parse(id),
                  _sectionSubSectionDetails[
                      (fieldID == 1095 || fieldID == 1098 || fieldID == 1097)
                          ? 1016
                          : tempSubSectionID]);
              if ((fieldID == 1001 || fieldID == 1002) &&
                  int.parse(id) == 1051) {
                var sectionSubSection = (_sectionSubSectionDetails[1003][index]
                    as SectionSubSection);
                var tempArray = sectionSubSection.fieldValue.split(" ");
                tempArray[(fieldID == 1001) ? 0 : 1] = fieldValue;
                sectionSubSection.fieldValue = tempArray.join(" ");
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState = globalKey.currentState as TextBoxState;
                  currentState.refreshState(
                      sectionSubSection.fieldValue, false);
                }
              } else {
                var sectionSubSection = (_sectionSubSectionDetails[
                    (fieldID == 1095 || fieldID == 1098 || fieldID == 1097)
                        ? 1016
                        : tempSubSectionID][index] as SectionSubSection);
                sectionSubSection.isHide = (fieldValue ==
                        ((fieldID == 1098) ? "1" : "14"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1256 &&
                            (fieldValue == "1"))
                        ? false
                        : (fieldID == 1097 &&
                                sectionSubSection.fieldDependencyID == 1244 &&
                                (fieldValue == "2" || fieldValue == "3"))
                            ? false
                            : (fieldID == 1095 &&
                                    sectionSubSection.fieldDependencyID ==
                                        1244 &&
                                    fieldValue == "1")
                                ? false
                                : (fieldID == 1096 &&
                                        sectionSubSection.fieldDependencyID ==
                                            1244)
                                    ? ((isContinue) ? true : false)
                                    : true;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState = globalKey.currentState as TextBoxState;
                  currentState.refreshIsDepdent((fieldValue ==
                          ((fieldID == 1098) ? "1" : "14"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1256 &&
                              (fieldValue == "1"))
                          ? false
                          : (fieldID == 1097 &&
                                  sectionSubSection.fieldDependencyID == 1244 &&
                                  (fieldValue == "2" || fieldValue == "3"))
                              ? false
                              : (fieldID == 1095 &&
                                      sectionSubSection.fieldDependencyID ==
                                          1244 &&
                                      fieldValue == "1")
                                  ? false
                                  : (fieldID == 1096 &&
                                          sectionSubSection.fieldDependencyID ==
                                              1244)
                                      ? ((isContinue) ? true : false)
                                      : true);
                }
              }
              break;
            case 1028:
              if (fieldID == 1095 ||
                  fieldID == 1098 ||
                  fieldID == 1097 ||
                  fieldID == 1096) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1257 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1245 &&
                            (fieldValue == "2" || fieldValue == "3"))
                        ? false
                        : (fieldValue == "1" && (fieldID == 1098))
                            ? false
                            : (fieldID == 1095 &&
                                    sectionSubSection.fieldDependencyID ==
                                        1245 &&
                                    fieldValue == "1")
                                ? false
                                : (fieldID == 1096 &&
                                        sectionSubSection.fieldDependencyID ==
                                            1245)
                                    ? ((isContinue) ? true : false)
                                    : true;
                if (sectionSubSection.fieldDependencyID == 1245) {
                  final genderIndex = returnIndexWithField(
                      1135, _sectionSubSectionDetails[1009]);
                  var genderSectionSubSection = (_sectionSubSectionDetails[1009]
                      [genderIndex] as SectionSubSection);
                  sectionSubSection.fieldValue =
                      (genderSectionSubSection.fieldValue == "20")
                          ? "21"
                          : (genderSectionSubSection.fieldValue == "21")
                              ? "20"
                              : genderSectionSubSection.fieldValue;
                }
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as DropDownWidgetState;
                  currentState.refreshIsDepdent((fieldID == 1097 &&
                          sectionSubSection.fieldDependencyID == 1257 &&
                          (fieldValue == "1"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1245 &&
                              (fieldValue == "2" || fieldValue == "3"))
                          ? false
                          : (fieldValue == "1" && (fieldID == 1098))
                              ? false
                              : (fieldID == 1095 &&
                                      sectionSubSection.fieldDependencyID ==
                                          1245 &&
                                      fieldValue == "1")
                                  ? false
                                  : (fieldID == 1096 &&
                                          sectionSubSection.fieldDependencyID ==
                                              1245)
                                      ? ((isContinue) ? true : false)
                                      : true);
                  if (sectionSubSection.fieldDependencyID == 1245) {
                    currentState.setUpdatedValue(
                        sectionSubSection.fieldValue, sectionSubSection);
                  }
                }
              }
              break;
            case 1027:
              if (fieldID == 1095 ||
                  fieldID == 1098 ||
                  fieldID == 1097 ||
                  fieldID == 1096) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1258 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1246 &&
                            (fieldValue == "2" || fieldValue == "3"))
                        ? false
                        : (fieldValue == "1" && (fieldID == 1098))
                            ? false
                            : (fieldID == 1095 &&
                                    sectionSubSection.fieldDependencyID ==
                                        1246 &&
                                    fieldValue == "1")
                                ? false
                                : (fieldID == 1096 &&
                                        sectionSubSection.fieldDependencyID ==
                                            1246)
                                    ? ((isContinue) ? true : false)
                                    : true;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState = globalKey.currentState as TextBoxState;
                  currentState.refreshIsDepdent((fieldID == 1097 &&
                          sectionSubSection.fieldDependencyID == 1258 &&
                          (fieldValue == "1"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1246 &&
                              (fieldValue == "2" || fieldValue == "3"))
                          ? false
                          : (fieldValue == "1" && (fieldID == 1098))
                              ? false
                              : (fieldID == 1095 &&
                                      sectionSubSection.fieldDependencyID ==
                                          1246 &&
                                      fieldValue == "1")
                                  ? false
                                  : (fieldID == 1096 &&
                                          sectionSubSection.fieldDependencyID ==
                                              1246)
                                      ? ((isContinue) ? true : false)
                                      : true);
                }
              }
              break;
            case 1099:
              if (fieldID == 1095 || fieldID == 1097 || fieldID == 1096) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1256 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1244 &&
                            (fieldValue == "2" || fieldValue == "3"))
                        ? false
                        : (fieldValue == "1" && (fieldID == 1095))
                            ? false
                            : (fieldID == 1096)
                                ? ((isContinue) ? true : false)
                                : true;
                sectionSubSection.fieldValue = (fieldValue == "1") ? "1" : "0";
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as RadioButtonState;
                  currentState.refreshIsDepdent(sectionSubSection.isHide =
                      (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1256 &&
                              (fieldValue == "1"))
                          ? false
                          : (fieldID == 1097 &&
                                  sectionSubSection.fieldDependencyID == 1244 &&
                                  (fieldValue == "2" || fieldValue == "3"))
                              ? false
                              : (fieldValue == "1" && (fieldID == 1095))
                                  ? false
                                  : (fieldID == 1096)
                                      ? ((isContinue) ? true : false)
                                      : true);
                  currentState
                      .updatecurrentTimeValue((fieldValue == "1") ? 1 : 0);
                }
              }
              break;
            case 1085:
              if (fieldID == 1095 ||
                  fieldID == 1099 ||
                  fieldID == 1097 ||
                  fieldID == 1096) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1256 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1251 &&
                            (fieldValue == "2"))
                        ? false
                        : (fieldValue == "1" &&
                                (fieldID == 1095 ||
                                    fieldID == 1098 ||
                                    fieldID == 1099))
                            ? false
                            : (fieldID == 1096)
                                ? ((isContinue) ? true : false)
                                : true;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as DependentViewState;
                  currentState.refreshIsDepdent((fieldID == 1097 &&
                          sectionSubSection.fieldDependencyID == 1256 &&
                          (fieldValue == "1"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1251 &&
                              (fieldValue == "2"))
                          ? false
                          : (fieldValue == "1" &&
                                  (fieldID == 1095 ||
                                      fieldID == 1098 ||
                                      fieldID == 1099))
                              ? false
                              : (fieldID == 1096)
                                  ? ((isContinue) ? true : false)
                                  : true);
                }
              } else if (fieldID == 1086 &&
                  (deptSectionSubSection.fieldDependencyID == 1064 ||
                      deptSectionSubSection.fieldDependencyID == 1251 ||
                      deptSectionSubSection.fieldDependencyID == 1167)) {
                final index = returnIndexWithField(
                    int.parse(id),
                    _sectionSubSectionDetails[
                        (deptSectionSubSection.fieldDependencyID == 1251
                            ? 1016
                            : deptSectionSubSection.fieldDependencyID == 1167
                                ? 1010
                                : 1003)]);
                var sectionSubSection = (_sectionSubSectionDetails[
                    (deptSectionSubSection.fieldDependencyID == 1251
                        ? 1016
                        : deptSectionSubSection.fieldDependencyID == 1167
                            ? 1010
                            : 1003)][index] as SectionSubSection);
                sectionSubSection.fieldValue = fieldValue;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as DependentViewState;
                  currentState.refreshState(int.parse(fieldValue));
                }
              }
              break;
            case 1086:
              if (deptSectionSubSection.fieldDependencyID == 1168) {
                var sectionSubSection = (_sectionSubSectionDetails[1010][index]
                    as SectionSubSection);
                var tempArray = [];
                if (fieldValue.length > 0) {
                  for (final value in listValue) {
                    final encode = jsonEncode(value);
                    tempArray.add(encode);
                  }
                }
                final encodeArray = json.encode(tempArray);
                sectionSubSection.fieldValue = encodeArray;
                final globalKey = sectionSubSection.globalKey;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState = globalKey.currentState as DependentState;
                  currentState..refreshStateWithList(listValue);
                }
              } else {
                final index = returnIndexWithField(
                    int.parse(id),
                    _sectionSubSectionDetails[(fieldID == 1095 ||
                            fieldID == 1099 ||
                            fieldID == 1097 ||
                            fieldID == 1096)
                        ? 1016
                        : tempSubSectionID]);
                var sectionSubSection = (_sectionSubSectionDetails[
                    (fieldID == 1095 ||
                            fieldID == 1099 ||
                            fieldID == 1097 ||
                            fieldID == 1096)
                        ? 1016
                        : tempSubSectionID][index] as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1256 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1252 &&
                            (fieldValue == "2"))
                        ? false
                        : (fieldValue == "1" &&
                                (fieldID == 1095 || fieldID == 1099))
                            ? false
                            : (fieldID == 1096)
                                ? ((isContinue) ? true : false)
                                : true;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState = globalKey.currentState as DependentState;
                  if ((fieldID == 1095 ||
                      fieldID == 1099 ||
                      fieldID == 1097 ||
                      fieldID == 1096)) {
                    currentState.refreshIsDepdent((fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1256 &&
                            (fieldValue == "1"))
                        ? false
                        : (fieldID == 1097 &&
                                sectionSubSection.fieldDependencyID == 1252 &&
                                (fieldValue == "2"))
                            ? false
                            : (fieldValue == "1" &&
                                    (fieldID == 1095 || fieldID == 1099))
                                ? false
                                : (fieldID == 1096)
                                    ? ((isContinue) ? true : false)
                                    : true);
                  } else {
                    currentState.refreshState(fieldValue);
                  }
                }
              }
              break;
            case 1101:
              if (fieldID == 1095) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldValue == "1") ? false : true;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as RadioButtonState;
                  currentState
                      .refreshIsDepdent(((fieldValue == "1") ? false : true));
                }
              }
              break;
            case 1091:
              var sectionSubSection =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              sectionSubSection.fieldValue = fieldValue;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as DropDownWidgetState;
                 currentState.setUpdatedValue(
                      fieldValue, deptSectionSubSection);
              }
              break;
            case 1096:
              if (fieldID == 1095) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isEditable =
                    (fieldValue == "0") ? false : true;
                sectionSubSection.fieldValue = (fieldValue == "1") ? "1" : "0";
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as RadioButtonState;
                  currentState.refreshIsEdit(sectionSubSection);
                  currentState
                      .updatecurrentTimeValue((fieldValue == "1") ? 1 : 0);
                }
              } else if (!isContinue) {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isEditable = true;
                sectionSubSection.fieldValue = "1";
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as RadioButtonState;
                  currentState.refreshIsEdit(sectionSubSection);
                  currentState.updatecurrentTimeValue(1);
                }
              }
              break;
            case 1071:
              final currentState = globalKey.currentState as TextBoxState;
              deptSectionSubSection.isHide = (fieldValue == "0") ? true : false;
              currentState.refreshState(fieldValue, true);
              break;
            case 1070:
              final currentState = globalKey.currentState as TextBoxState;
              deptSectionSubSection.isHide = (fieldValue == "0") ? true : false;
              currentState.refreshState(fieldValue, true);
              break;
            case 1083:
              final currentState = globalKey.currentState as TextAreaState;
              currentState.refreshState(fieldValue);
              break;
            case 1086:
              final currentState = globalKey.currentState as DependentState;
              currentState.refreshState(fieldValue);
              break;
            case 1017:
              if (sectionSubSection.fieldDependencyID == 1301) {
                final index =
                    returnIndexWithField(1297, _sectionSubSectionDetails[1018]);
                var sectionSubSection = (_sectionSubSectionDetails[1018][index]
                    as SectionSubSection);
                deptSectionSubSection.fieldValue =
                    (fieldValue == "1") ? sectionSubSection.fieldValue : "";
                if (globalKey.currentState != null) {
                  final currentState =
                      globalKey.currentState as DropDownWidgetState;
                  currentState.setUpdatedValue(
                      deptSectionSubSection.fieldValue, deptSectionSubSection);
                }
              } else {
                final currentState =
                    globalKey.currentState as DropDownWidgetState;
                currentState.refreshState(fieldValue);
              }
              break;
            case 1018:
              if (sectionSubSection.fieldDependencyID == 1301) {
                final index =
                    returnIndexWithField(1298, _sectionSubSectionDetails[1018]);
                var sectionSubSection = (_sectionSubSectionDetails[1018][index]
                    as SectionSubSection);
                deptSectionSubSection.fieldValue =
                    (fieldValue == "1") ? sectionSubSection.fieldValue : "";
                if (globalKey.currentState != null) {
                  final currentState =
                      globalKey.currentState as DropDownWidgetState;
                  currentState.setUpdatedValue(
                      deptSectionSubSection.fieldValue, deptSectionSubSection);
                }
              } else {
                final currentState =
                    globalKey.currentState as DropDownWidgetState;
                currentState.refreshState(fieldValue);
              }
              break;
            case 1019:
              if (sectionSubSection.fieldDependencyID == 1301) {
                final index =
                    returnIndexWithField(1299, _sectionSubSectionDetails[1018]);
                var sectionSubSection = (_sectionSubSectionDetails[1018][index]
                    as SectionSubSection);
                deptSectionSubSection.fieldValue =
                    (fieldValue == "1") ? sectionSubSection.fieldValue : "";
                if (globalKey.currentState != null) {
                  final currentState = globalKey.currentState as TextBoxState;
                  currentState.refreshState(
                      deptSectionSubSection.fieldValue, false);
                }
              } else {
                List<FieldData> fieldDataDetails = await DBHelper()
                    .getFieldDataWithFieldDepdentID(fieldValue, 1019);
                if (fieldDataDetails.length > 0) {
                  final fieldDataDetail = fieldDataDetails[0];
                  var sectionSubSection =
                      (_sectionSubSectionDetails[tempSubSectionID][index]
                          as SectionSubSection);
                  if (subSectionId == 1019) {
                    sectionSubSection.fieldValue =
                        "${fieldDataDetail.fieldValue},";
                  } else {
                    sectionSubSection.fieldValue = fieldDataDetail.fieldValue;
                  }
                  if (globalKey.currentState != null) {
                    final currentState = globalKey.currentState as TextBoxState;
                    currentState.refreshState(
                        fieldDataDetail.fieldValue, false);
                  }
                }
              }
              break;
            case 1033:
              var sectionSubSection =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              sectionSubSection.fieldValue = (fieldValue == "14") ? "1" : "0";
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as RadioButtonState;
                currentState.updatecurrentTimeValue(
                    int.parse((fieldValue == "14") ? "1" : "0"));
              }
              break;
            case 1104:
              var sectionSubSection =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              sectionSubSection.isHide = (fieldValue == "14") ? false : true;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as ImageLabelState;
                currentState.refreshState((fieldValue == "14") ? false : true);
              }
              break;
            case 1032:
              var sectionSubSection =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              sectionSubSection.isHide = (fieldValue == "14") ? false : true;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState
                    .refreshIsDepdent((fieldValue == "14") ? false : true);
              }
              break;
            case 1010:
              var sectionSubSection =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              sectionSubSection.isHide = (fieldValue == "14") ? false : true;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as DatePickerState;
                currentState
                    .setRefreshState((fieldValue == "14") ? false : true);
              }
              break;
            case 1012:
              if (id == "1261" || id == "1249") {
                final index = returnIndexWithField(
                    int.parse(id), _sectionSubSectionDetails[1016]);
                var sectionSubSection = (_sectionSubSectionDetails[1016][index]
                    as SectionSubSection);
                sectionSubSection.isHide = (fieldID == 1097 &&
                        sectionSubSection.fieldDependencyID == 1261 &&
                        (fieldValue == "1"))
                    ? false
                    : (fieldID == 1097 &&
                            sectionSubSection.fieldDependencyID == 1249 &&
                            (fieldValue == "2" || fieldValue == "3"))
                        ? false
                        : (fieldID == 1095 &&
                                sectionSubSection.fieldDependencyID == 1249 &&
                                fieldValue == "1")
                            ? false
                            : (fieldID == 1096 &&
                                    sectionSubSection.fieldDependencyID == 1249)
                                ? ((isContinue) ? true : false)
                                : true;
                if (id == "1249") {
                  sectionSubSection.fieldValue =
                      deptSectionSubSection.fieldValue;
                }
                if (globalKey.currentState != null) {
                  final currentState =
                      globalKey.currentState as DropDownWidgetState;
                  currentState.refreshIsDepdent((fieldID == 1097 &&
                          sectionSubSection.fieldDependencyID == 1261 &&
                          (fieldValue == "1"))
                      ? false
                      : (fieldID == 1097 &&
                              sectionSubSection.fieldDependencyID == 1249 &&
                              (fieldValue == "2" || fieldValue == "3"))
                          ? false
                          : (fieldID == 1095 &&
                                  sectionSubSection.fieldDependencyID == 1249 &&
                                  fieldValue == "1")
                              ? false
                              : (fieldID == 1096 &&
                                      sectionSubSection.fieldDependencyID ==
                                          1249)
                                  ? ((isContinue) ? true : false)
                                  : true);
                }
              } else {
                var sectionSubSection =
                    (_sectionSubSectionDetails[tempSubSectionID][index]
                        as SectionSubSection);
                if (id == "1055") {
                  sectionSubSection.fieldValue = fieldValue;
                } else {
                  sectionSubSection.isHide =
                      (fieldValue == "14") ? false : true;
                }
                if (globalKey.currentState != null) {
                  final currentState =
                      globalKey.currentState as DropDownWidgetState;
                  if (id == "1055") {
                    currentState.setUpdatedValue(fieldValue, sectionSubSection);
                  } else {
                    currentState
                        .refreshIsDepdent((fieldValue == "14") ? false : true);
                  }
                }
              }
              break;
            case 1034:
              var sectionSubSection =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              sectionSubSection.isHide = (fieldValue == "14") ? false : true;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState
                    .refreshIsDepdent((fieldValue == "14") ? false : true);
              }
              break;
            case 1045:
              final totalMonExp = returnHouseHoldExpenses();
              final totalMonthlyExpenses =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              final currencyText =
                  '${_formatNumber(totalMonExp.round().toString().replaceAll(',', ''))}';
              totalMonthlyExpenses.fieldValue = currencyText;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(currencyText, false);
              }
              capitaltoprotectmonththlyexpenditure(totalMonExp);
              break;
            case 1053:
              final total = (deptSectionSubSection.fieldDependencyID == 1085)
                  ? returnValueOfAssets()
                  : (deptSectionSubSection.fieldDependencyID == 1116)
                      ? returnAnalysis()
                      : returnValueOfLiabilities();
              final totalMonthlyExpenses =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              final currencyText =
                  '${_formatNumber(total.round().toString().replaceAll(',', ''))}';
              totalMonthlyExpenses.fieldValue = currencyText;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(currencyText, false);
              }
              break;
            case 1064:
              final houseHoldTotal = returnProspectSpouse();
              final totalMonthlyExpenses =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              final currencyText =
                  '${_formatNumber(houseHoldTotal.round().toString().replaceAll(',', ''))}';
              totalMonthlyExpenses.fieldValue = currencyText;
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(currencyText, false);
              }
              break;
            case 1073:
              var sectionSubSection =
                  (_sectionSubSectionDetails[tempSubSectionID][index]
                      as SectionSubSection);
              sectionSubSection.fieldValue = fieldValue;
              identifiedProtected(double.parse(fieldValue.replaceAll(",", "")));
              if (globalKey.currentState != null) {
                final currentState = globalKey.currentState as TextBoxState;
                currentState.refreshState(fieldValue, false);
              }
              break;
            case 1102:
              final maritalStatus =
                  (_sectionSubSectionDetails[1009][15] as SectionSubSection)
                      .fieldValue;
              if (maritalStatus == "14") {
                var sectionSubSection =
                    (_sectionSubSectionDetails[tempSubSectionID][index]
                        as SectionSubSection);
                sectionSubSection.isHide = (fieldValue == "2") ? false : true;
                if (globalKey.currentState != null) {
                  final globalKey = sectionSubSection.globalKey;
                  final currentState =
                      globalKey.currentState as RadioButtonState;
                  currentState
                      .refreshIsDepdent(((fieldValue == "2") ? false : true));
                }
              } else if (fieldValue == "2") {
                Utility().alertDialog(context, LabelConstant.kHRCLRider, 0);
                final globalKey = sectionSubSection.globalKey;
                final currentState = globalKey.currentState as RadioButtonState;
                currentState.updatecurrentTimeValue(0);
              }
              break;
          }
        }
      }
    }
  }

  alertDialog(BuildContext context, String message, String webRefNumber,
      String fieldValue, GlobalKey globalKey) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(ButtonLableConstant.kOK),
      onPressed: () {
        Navigator.pop(context);
        final currentState = globalKey.currentState as CoverageDetailsState;
        Future.delayed(const Duration(milliseconds: 600), () async {
          Utility().activity(context);
          Future.delayed(const Duration(milliseconds: 600), () async {
            currentState.refreshState(webRefNumber, fieldValue);
          });
        });
      },
    );
    // set up the button
    Widget cancelButton = FlatButton(
      child: Text(ButtonLableConstant.kCancel),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(LabelConstant.kJICL),
      content: Text(message),
      actions: [okButton, cancelButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

//MARK:- returnAnalysis
  returnAnalysis() {
    var total = 0.0;
    final familyIncomeSectionSubSection =
        (_sectionSubSectionDetails[1007][1] as SectionSubSection);
    if ((familyIncomeSectionSubSection.fieldValue).length > 0) {
      final tempMediDetails = familyIncomeSectionSubSection.fieldValue;
      var valueMap = jsonDecode(tempMediDetails);
      total = total +
          ((valueMap["2"].length > 0)
              ? int.parse(valueMap["2"].replaceAll(",", ""))
              : 0);
    }
    final childrensHigherEduSectionSubSection =
        (_sectionSubSectionDetails[1007][2] as SectionSubSection);
    if ((childrensHigherEduSectionSubSection.fieldValue).length > 0) {
      final tempMediDetails = childrensHigherEduSectionSubSection.fieldValue;
      var valueMap = jsonDecode(tempMediDetails);
      total = total +
          ((valueMap["2"].length > 0)
              ? int.parse(valueMap["2"].replaceAll(",", ""))
              : 0);
    }
    final childrensMarriageSectionSubSection =
        (_sectionSubSectionDetails[1007][3] as SectionSubSection);
    if ((childrensMarriageSectionSubSection.fieldValue).length > 0) {
      final tempMediDetails = childrensMarriageSectionSubSection.fieldValue;
      var valueMap = jsonDecode(tempMediDetails);
      total = total +
          ((valueMap["2"].length > 0)
              ? int.parse(valueMap["2"].replaceAll(",", ""))
              : 0);
    }
    final incomeSectionSubSection =
        (_sectionSubSectionDetails[1007][4] as SectionSubSection);
    if ((incomeSectionSubSection.fieldValue).length > 0) {
      final tempMediDetails = incomeSectionSubSection.fieldValue;
      var valueMap = jsonDecode(tempMediDetails);
      total = total +
          ((valueMap["2"].length > 0)
              ? int.parse(valueMap["2"].replaceAll(",", ""))
              : 0);
    }
    final fundsSectionSubSection =
        (_sectionSubSectionDetails[1007][5] as SectionSubSection);
    if ((fundsSectionSubSection.fieldValue).length > 0) {
      final tempMediDetails = fundsSectionSubSection.fieldValue;
      var valueMap = jsonDecode(tempMediDetails);
      total = total +
          ((valueMap["2"].length > 0)
              ? int.parse(valueMap["2"].replaceAll(",", ""))
              : 0);
    }
    final otherSavingSectionSubSection =
        (_sectionSubSectionDetails[1007][6] as SectionSubSection);
    if ((otherSavingSectionSubSection.fieldValue).length > 0) {
      final tempMediDetails = otherSavingSectionSubSection.fieldValue;
      var valueMap = jsonDecode(tempMediDetails);
      total = total +
          ((valueMap["2"].length > 0)
              ? int.parse(valueMap["2"].replaceAll(",", ""))
              : 0);
    }
    final otherLiabilitiesSectionSubSection =
        (_sectionSubSectionDetails[1007][7] as SectionSubSection);
    if ((otherLiabilitiesSectionSubSection.fieldValue).length > 0) {
      final tempMediDetails = otherLiabilitiesSectionSubSection.fieldValue;
      var valueMap = jsonDecode(tempMediDetails);
      total = total +
          ((valueMap["2"].length > 0)
              ? int.parse(valueMap["2"].replaceAll(",", ""))
              : 0);
    }
    return total;
  }

//MARK:- Gap identified which needs to be protected
  void identifiedProtected(double value) {
    //Protect Monththly Expenditure
    final protectMonththlyIndex =
        returnIndexWithField(1100, _sectionSubSectionDetails[1006]);
    final protectMonththlyExpenditure = (_sectionSubSectionDetails[1006]
        [protectMonththlyIndex] as SectionSubSection);
    if (protectMonththlyExpenditure.fieldValue.length > 0) {
      final identifiedExpenditureIndex =
          returnIndexWithField(1107, _sectionSubSectionDetails[1006]);
      final identifiedExpenditure = (_sectionSubSectionDetails[1006]
          [identifiedExpenditureIndex] as SectionSubSection);
      final totalValue = double.parse(
              (protectMonththlyExpenditure.fieldValue.replaceAll(",", ""))) -
          value;
      final currencyText =
          '${_formatNumber(totalValue.round().toString().replaceAll(',', ''))}';
      identifiedExpenditure.fieldValue = currencyText.toString();
      final identifiedExpenditureGlobalKey = identifiedExpenditure.globalKey;
      final currentState =
          identifiedExpenditureGlobalKey.currentState as TextBoxState;
      if (identifiedExpenditureGlobalKey.currentState != null) {
        currentState.refreshState(currencyText.toString(), false);
      }
    }
  }

//MARK:- Calculating Capital to protect monththly expenditure
  void capitaltoprotectmonththlyexpenditure(double total) {
    var tempTotalMonthlyExpenses = total;
    //Updating Monthly expenditure
    final totalMonthlyexpenditure =
        (_sectionSubSectionDetails[1006][5] as SectionSubSection);
    final monthlyExpensesCurrencyText =
        '${_formatNumber(tempTotalMonthlyExpenses.round().toString().replaceAll(',', ''))}';
    totalMonthlyexpenditure.fieldValue = monthlyExpensesCurrencyText;
    final totalMonthlyExpensesGlobalKey = totalMonthlyexpenditure.globalKey;
    final currentState =
        totalMonthlyExpensesGlobalKey.currentState as TextBoxState;
    if (totalMonthlyExpensesGlobalKey.currentState != null) {
      currentState.refreshState(monthlyExpensesCurrencyText, false);
    }
    //Rate of Intrest
    final rateOfIntrest =
        (_sectionSubSectionDetails[1006][6] as SectionSubSection);
    rateOfIntrest.fieldValue = 10.toString();
    final rateOfIntrestGlobalKey = rateOfIntrest.globalKey;
    final rateOfIntrestCurrentState =
        rateOfIntrestGlobalKey.currentState as TextBoxState;
    if (rateOfIntrestGlobalKey.currentState != null) {
      rateOfIntrestCurrentState.refreshState(10.toString(), false);
    }
    //Capital to protect monththly expenditure
    final value = ((tempTotalMonthlyExpenses * 12) / 0.1).round();
    final _valueCurrencyText =
        '${_formatNumber(value.round().toString().replaceAll(',', ''))}';
    final protectMonththlyExpenditure =
        (_sectionSubSectionDetails[1006][7] as SectionSubSection);
    protectMonththlyExpenditure.fieldValue = _valueCurrencyText;
    final protectMonththlyExpenditureGlobalKey =
        protectMonththlyExpenditure.globalKey;
    final protectMonththlyExpenditureCurrentState =
        protectMonththlyExpenditureGlobalKey.currentState as TextBoxState;
    if (protectMonththlyExpenditureGlobalKey.currentState != null) {
      protectMonththlyExpenditureCurrentState.refreshState(
          _valueCurrencyText, false);
    }
  }

//MARK:- returnProspectSpouse
  returnProspectSpouse() {
    var houseHoldTotal = 0.0;
    final prospectSectionSubSection =
        (_sectionSubSectionDetails[1006][2] as SectionSubSection);
    houseHoldTotal = houseHoldTotal +
        ((prospectSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                prospectSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final spouseSectionSubSection =
        (_sectionSubSectionDetails[1006][3] as SectionSubSection);
    houseHoldTotal = houseHoldTotal +
        ((spouseSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                spouseSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    return houseHoldTotal;
  }

//MARK:- returnValueOAssetsAndLiabilities
  returnValueOfAssets() {
    var total = 0.0;
    final landHouseSectionSubSection =
        (_sectionSubSectionDetails[1005][2] as SectionSubSection);
    total = total +
        ((landHouseSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                landHouseSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final motorVehicleSectionSubSection =
        (_sectionSubSectionDetails[1005][3] as SectionSubSection);
    total = total +
        ((motorVehicleSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                motorVehicleSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final bankDepositeSectionSubSection =
        (_sectionSubSectionDetails[1005][5] as SectionSubSection);
    total = total +
        ((bankDepositeSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                bankDepositeSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final investmentsSectionSubSection =
        (_sectionSubSectionDetails[1005][6] as SectionSubSection);
    total = total +
        ((investmentsSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                investmentsSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    return total;
  }

  returnValueOfLiabilities() {
    var total = 0.0;
    final loansSectionSubSection =
        (_sectionSubSectionDetails[1005][9] as SectionSubSection);
    total = total +
        ((loansSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                loansSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final mortgageSectionSubSection =
        (_sectionSubSectionDetails[1005][10] as SectionSubSection);
    total = total +
        ((mortgageSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                mortgageSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final leaseSectionSubSection =
        (_sectionSubSectionDetails[1005][11] as SectionSubSection);
    total = total +
        ((leaseSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                leaseSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final othersSectionSubSection =
        (_sectionSubSectionDetails[1005][12] as SectionSubSection);
    total = total +
        ((othersSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                othersSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    return total;
  }

//MARK:- returnHouseHoldExpenses
  returnHouseHoldExpenses() {
    var totalMonExp = 0.0;
    final foodSectionSubSection =
        (_sectionSubSectionDetails[1004][1] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((foodSectionSubSection.fieldValue.length > 0)
            ? double.parse(foodSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final houseRentSectionSubSection =
        (_sectionSubSectionDetails[1004][2] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((houseRentSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                houseRentSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final clothesSectionSubSection =
        (_sectionSubSectionDetails[1004][3] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((clothesSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                clothesSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final transportSectionSubSection =
        (_sectionSubSectionDetails[1004][4] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((transportSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                transportSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final familyHealthSectionSubSection =
        (_sectionSubSectionDetails[1004][5] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((familyHealthSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                familyHealthSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final educationSectionSubSection =
        (_sectionSubSectionDetails[1004][6] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((educationSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                educationSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final specialEventSectionSubSection =
        (_sectionSubSectionDetails[1004][7] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((specialEventSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                specialEventSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final maidSectionSubSection =
        (_sectionSubSectionDetails[1004][8] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((maidSectionSubSection.fieldValue.length > 0)
            ? double.parse(maidSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    final otherSectionSubSection =
        (_sectionSubSectionDetails[1004][9] as SectionSubSection);
    totalMonExp = totalMonExp +
        ((otherSectionSubSection.fieldValue.length > 0)
            ? double.parse(
                otherSectionSubSection.fieldValue.replaceAll(",", ""))
            : 0);
    return totalMonExp;
  }

//MAR:- return subsectionID
  returnSubSectionIDWithFieldID(int fieldID, int subSectionID, int deptId) {
    switch (fieldID) {
      case 1030:
        return (fieldID == 1030 && deptId == 1096) ? 1006 : 1003;
      case 1012:
        return 1003;
      case 1001:
        return (fieldID == 1001 && deptId == 1051) ? 1003 : subSectionID;
      case 1002:
        return (fieldID == 1002 && deptId == 1051) ? 1003 : subSectionID;
      case 1086:
        return (subSectionID == 1016 && deptId != 1251) ? 1010 : subSectionID;
      case 1087:
        return (subSectionID == 1016 && deptId != 1251) ? 1010 : subSectionID;
      default:
        return subSectionID;
    }
  }

//MARK:- return index
  returnIndexWithField(
      int fieldDependencyID, List<SectionSubSection> _sectionDetails) {
    if (_sectionDetails.length > 0) {
      for (var index = 0; index < _sectionDetails.length; index++) {
        final _value = _sectionDetails[index];
        if (_value.fieldDependencyID == fieldDependencyID) {
          return index;
        }
      }
    }
  }

//API Request
  Future<void> _requestWith(int id, _subsectionDetails) async {
    switch (id) {
      case 1000:
        suspectInsertIntoFieldResponse(
            _sectionSubSectionDetails, webRefNumber, context);
        break;
      case 1001:
        prospectInsertIntoFieldResponse(
            _sectionSubSectionDetails, webRefNumber, context);
        break;
    }
  }

  void stopActivity() {
    Navigator.pop(context);
    Utility().showAlertDialog(context, widget.object["businessSubID"]);
  }
}
