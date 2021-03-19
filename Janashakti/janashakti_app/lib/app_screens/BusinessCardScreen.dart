import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_screens/BusinessDocumentView.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'BusinessDetailsScreen.dart';

class BusinessCardScreen extends StatefulWidget {
  final function;
  final object;
  BusinessCardScreen(this.function, this.object);
  @override
  State<StatefulWidget> createState() {
    return BusinessCardScreenState();
  }
}

class BusinessCardScreenState extends State<BusinessCardScreen> {
  List<List<HeaderSectionFields>> _headerSectionFields = new List();
  @override
  void initState() {
    super.initState();
    getHeaderdetails(widget.object["poolname"], widget.object["businessSubID"]);
  }

  //Get header details
  void getHeaderdetails(String _poolName, int _businessSubID) async {
    //Get Field Response
    List<FieldResponse> _fieldResponse =
        await DBHelper().getFieldResponseDetailsWithSectionId(_businessSubID);
    //Get fieldData
    List<FieldData> fieldDataDetails = await DBHelper().getFieldDataList();
    if (_fieldResponse.length > 0) {
      List<String> tempList =
          _fieldResponse.map((e) => e.webRefNumber).toList();
      List<String> _tempWebRefNumbers =
          LinkedHashSet<String>.from(tempList).toList();
      await Future.forEach(_tempWebRefNumbers, (value) async {
        List<HeaderSectionFields> _headerSectionFieldsList =
            await DBHelper().getHeaderSectionFields(_poolName);
        List<ServiceResponseID> _serviceResponseID =
            await DBHelper().getServiceResponseIDWith(value);
        final _tempDetails = (_fieldResponse
            .where((element) => element.webRefNumber == value)).toList();
        for (final item in _headerSectionFieldsList) {
          HeaderSectionFields _headerSectionField = item;
             //Selected Product
          final _selectedProduct = _tempDetails
              .where((e) => e.fieldID == 1081)
              .toList();
          if(_selectedProduct != null && _selectedProduct.length > 0){
            final _product = _selectedProduct[0].fieldValue;
            final _fieldData = fieldDataDetails.where((e)=>e.fieldDataID == _product).toList()[0];
            _headerSectionField.selectedProduct = _fieldData.fieldValue;
          }    
          final _tempList = _tempDetails
              .where((e) => e.fieldID == _headerSectionField.fieldID)
              .toList();
          final _filedValue = _returnFieldValue(
              ((_tempList.length > 0) ? _tempList[0].fieldValue : ""),
              _headerSectionField.fieldID,
              value,
              _serviceResponseID);
          _headerSectionField.fieldValue = _filedValue;
          _headerSectionField.webRefNumber = value;
        }
        _headerSectionFields.add(_headerSectionFieldsList);
      });
    }
    _cardScreenAPI(_businessSubID);
  }

  //API Status and Failed Proposal
  void _cardScreenAPI(int _businessSubID) async {
    switch (_businessSubID) {
      case 4001:
        Utility().activity(context);
        Future.delayed(
            const Duration(microseconds: LabelConstant.kDispatchTime),
            () async {
          String _response = await APIManager().fetchUWProposals();
          Navigator.pop(context);
          if (_response.length > 0) {
            final _responseData = jsonDecode(_response);
            if (_responseData["LstProposals"] != null &&
                _responseData["LstProposals"].length > 0) {
              final _lstProposals = _responseData["LstProposals"] as List;
              for (final item in _headerSectionFields) {
                final _list = _lstProposals
                    .where((e) => e["QuoteNo"] == item[4].fieldValue)
                    .toList();
                if (_list.length > 0) {
                  final _map = _list[0];
                  item[6].fieldValue = _map["Status"];
                  item[7].fieldValue =
                      (_map["PolicyNo"] != null) ? _map["PolicyNo"] : "";
                }
              }
              setState(() {});
            }
          }
        });
        break;
      case 4003:
        Utility().activity(context);
        Future.delayed(
            const Duration(microseconds: LabelConstant.kDispatchTime),
            () async {
          String _response = await APIManager().fetchProposalFailedCases();
          Navigator.pop(context);
          if (_response.length > 0) {
            final _responseData = jsonDecode(_response);
            if (_responseData["LstProposals"] != null &&
                _responseData["LstProposals"].length > 0) {
              final _lstProposals = _responseData["LstProposals"] as List;
              for (final item in _headerSectionFields) {
                final _list = _lstProposals
                    .where((e) => e["QuoteNo"] == item[4].fieldValue)
                    .toList();
                if (_list.length > 0) {
                  final _map = _list[0];
                  item[6].fieldValue = _map["Status"];
                  item[7].fieldValue =
                      (_map["PolicyNo"] != null) ? _map["PolicyNo"] : "";
                }
              }
              setState(() {});
            }
          }
        });
        break;
      default:
    }
    setState(() {});
  }

  //Return home , work , mobile , type
  _returnFieldValue(String _fieldValue, int _fieldID, String _webRefNumber,
      List<ServiceResponseID> _serviceResponseID) {
    switch (_fieldID) {
      case 1008:
        return "Own";
      case 1006:
        return _fieldValue;
      case 1444:
        return Utility()
            .returnDaysLeftWithMilliSecound(_webRefNumber)
            .toString();
      case 1445:
        return (_serviceResponseID.length > 0)
            ? _serviceResponseID[0].quotationNumber
            : "";
      case 1446:
        return "";
      case 1109:
        return (_serviceResponseID.length > 0)
            ? _serviceResponseID[0].proposalNumber
            : "";
      default:
        final _tempList = _fieldValue.split("@");
        return (_tempList.length > 1) ? _tempList[1] : _fieldValue;
    }
  }

  double _returnContianerWithHeight(
      List _headerSectionFields, String _boolName) {
    switch (_boolName) {
      case "quotation":
        return (_headerSectionFields[8].fieldValue.length > 0)
            ? (_headerSectionFields.length * 49).toDouble()
            : ((_headerSectionFields.length - 1) * 49).toDouble();
      default:
        return (_headerSectionFields.length * 49).toDouble();
    }
  }

//MARK:-
  Widget build(BuildContext context) {
    final object = widget.object;
    return new WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
          home: new Container(
        decoration: BoxDecoration(image: Utility().returnBackgroundImage()),
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text(object["title"]),
              backgroundColor: Utility()
                  .returnThemColorWithIndex(Utility().returnThemColorIndex()),
              leading: IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () =>
                    {widget.function(), Navigator.of(context).pop()},
              )),
          body: _createStateWith(context, _headerSectionFields, object,
              widget.object["businessSubID"]),
        ),
      )),
    );
  }

  Widget _createStateWith(BuildContext context, List _headerSectionFields,
      object, int _businessSubID) {
    return Center(
      child: new Container(
        child: new ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _headerSectionFields.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new GestureDetector(
                onTap: () => {
                  gestureTapped(context, _headerSectionFields[index][0], object,
                      _headerSectionFields[index])
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                    margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 2.0),
                    height: _returnContianerWithHeight(
                        _headerSectionFields[index], widget.object["poolname"]),
                    //(_headerSectionFields[index].length * 49).toDouble(),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Utility().returnThemColorWithIndex(
                                Utility().returnThemColorIndex()),
                            blurRadius: 20,
                            offset: Offset(0.0, 8.0))
                      ],
                    ),
                    child: _createSubState(_headerSectionFields[index], context,
                        object, _businessSubID)),
              );
            }),
      ),
    );
  }

  Widget _createSubState(List<HeaderSectionFields> _headerSectionFields,
      BuildContext context, object, int _businessSubID) {
    return Container(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _headerSectionFields.length,
          itemBuilder: (BuildContext ctxt, int subIndex) {
            double _headerTextWidth = 160;
            double _padding = 20.0;
            return (_headerSectionFields[subIndex].fieldName ==
                    LabelConstant.kButton)
                ? (_headerSectionFields[8].fieldValue.length > 0)
                    ? createButtonSubState(_headerSectionFields[subIndex],
                        context, object, _headerSectionFields)
                    : Container()
                : Container(
                    height: 48.0,
                    child: new Row(children: <Widget>[
                      Container(
                        width: _headerTextWidth,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                            width: 140,
                            child: Text(
                                _headerSectionFields[subIndex].fieldName,
                                style: Utility().returnNormalTextStyle())),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width -
                              (_headerTextWidth + _padding),
                          child: Text(
                              (": " +
                                  _headerSectionFields[subIndex].fieldValue),
                              style: Utility().returnNormalTextStyle()))
                    ]),
                  );
          }),
    );
  }

//MARK:Gesture Detector
  gestureTapped(BuildContext context, HeaderSectionFields _headerSectionField,
    object, List _headerSectionFields) async {
    String _response = "";
     Map detail = {
                    "title": object["title"],
                    "businessID": object["businessID"],
                    "businessSubID": object["businessSubID"],
                    "cardDetails": _headerSectionField,
                    "list": _headerSectionFields,
                    "response": _response
                  };
    if (object["businessSubID"] >= 4001 && object["businessSubID"] <= 4010) {
      return;
    }
    if (object["businessSubID"] == 3000) {
      Utility().check().then((internet) => {
            if (internet != null && internet)
              {
                Utility().activity(context),
                Future.delayed(
                    const Duration(milliseconds: LabelConstant.kDispatchTime),
                    () async {
                  
                  _response = await APIManager()
                      .loadMastersForQuote(_headerSectionFields[0].selectedProduct);
                      detail["response"] = _response;
                      Navigator.pop(context);
                  _navigatePageWith(detail, context);
                })
              }else{
                 _navigatePageWith(detail, context)
              }
          });
    } else {
      _navigatePageWith(detail, context);
    }
  }

  _navigatePageWith(Map object, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BusinessDetailScreen(object)));
  }

  Widget createButtonSubState(HeaderSectionFields _headerSectionField,
      BuildContext context, object, List _headerSectionFields) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      width: MediaQuery.of(context).size.width,
      height: 56.0,
      child: Row(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2.0 - 16.0,
          height: 46.0,
          child: Opacity(
            opacity: 1.0,
            child: FlatButton(
                color: Colors.transparent,
                textColor: Colors.black,
                onPressed: () {
                  // if (_cardDetails.quoteNo.length > 0) {
                  createProposalBtnTapped(
                      context, object, _headerSectionFields);
                  //}
                },
                child: Container(
                  width: 200.0,
                  height: 46.0,
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(LabelConstant.kCreateProposal,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 18,
                          offset: Offset(0.0, 6.0))
                    ],
                  ),
                )),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width / 2.0 - 16.0,
            height: 46.0,
            child: Opacity(
              opacity: 1.0,
              child: FlatButton(
                  color: Colors.transparent,
                  textColor: Colors.black,
                  onPressed: () {
                    viewPDFBtnTapped(_headerSectionField, context, object,
                        _headerSectionFields);
                  },
                  child: Container(
                    width: 200.0,
                    height: 46.0,
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(LabelConstant.kViewPDF,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 18,
                            offset: Offset(0.0, 6.0))
                      ],
                    ),
                  )),
            ))
      ]),
    );
  }

//MARK:- Button Action
  Future<void> createProposalBtnTapped(
      BuildContext context, object, List _headerSectionFields) async {
//Get premiumDetails and update
    HeaderSectionFields _headerSectionField = _headerSectionFields[8];
    List<PremiumDetails> premiumResponseDetails = await DBHelper()
        .getPremiumDetailsWithWebRefNumber(_headerSectionField.webRefNumber);
    if (premiumResponseDetails.length > 0) {
      Map tempObject = {
        "title": LabelConstant.kIncompleteProposals,
        "businessID": 4000,
        "businessSubID": 4000,
        "cardDetails": _headerSectionField
      };
      //QuotationPool
      Utility().check().then((internet) => {
            if (internet != null && internet)
              {
                Utility().activity(context),
                Future.delayed(
                    const Duration(milliseconds: LabelConstant.kDispatchTime),
                    () async {
                  String response = await APIManager()
                      .getLoadProposalInfohUsername(
                          UserManager().userID, _headerSectionField.fieldValue);
                  if (response.length > 0) {
                    final quotePollData = jsonDecode(response);
                    if (quotePollData["objMemberDetails"].length > 0) {
                      await DBHelper().insertJsonObject(
                          _headerSectionField.webRefNumber,
                          response,
                          "quotationPool");
                      //Send PDF Service
                      String _ = await APIManager()
                          .sendPDF(_headerSectionField.fieldValue);
                      Navigator.pop(context);
                      gestureTapped(context, _headerSectionField, tempObject,
                          _headerSectionFields);
                    } else {
                      gestureTapped(context, _headerSectionField, tempObject,
                          _headerSectionFields);
                    }
                  }
                })
              }
            else
              {
                gestureTapped(context, _headerSectionField, tempObject,
                    _headerSectionFields)
              }
          });
    }
  }

  Future<void> viewPDFBtnTapped(HeaderSectionFields _headerSectionField,
      BuildContext context, object, List _headerSectionFields) async {
    Map detail = {"cardDetails": _headerSectionFields[8]};
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BusinessDocumentView(detail)));
  }
}
