import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_screens/BenefitDetails/RiderMinMaxMultiples.dart';
import 'package:jiclapp/app_screens/BenefitDetails/RiderPremium.dart';
import 'package:jiclapp/app_screens/BenefitDetails/SaveQuote.dart';
import 'package:jiclapp/app_util/FormValidator.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:intl/intl.dart';

class BenefitDetailsScreen extends StatefulWidget {
  final _subSectionDetails;
  final _webRefNumber;
  BenefitDetailsScreen(this._subSectionDetails, this._webRefNumber);
  @override
  State<StatefulWidget> createState() {
    return BenefitDetailsScreenState();
  }
}

class BenefitDetailsScreenState extends State<BenefitDetailsScreen> {
  Map<String, dynamic> _riderMastersDetails = Map();
  Map<int, dynamic> _benifitOverViewDetails = Map();
  final _pageControllercontroller = new PageController();
  var riderDetails = {};
  var _globalKeys = [];
  var _autoValidateArray = [];
  var benefitSectionSubSection = [];
  var currentPage = 0;
  var filterList = [];
  var fieldData = [];
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(LabelConstant.kLocale).format(int.parse(s));
  void initState() {
    super.initState();
    setRiderMasterDetailsWithPlanCode(
        widget._subSectionDetails[1015][9].fieldValue);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: new Container(
            decoration: BoxDecoration(image: Utility().returnBackgroundImage()),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text(LabelConstant.kBenefitDetails),
                  backgroundColor: Utility().returnThemColorWithIndex(
                      Utility().returnThemColorIndex()),
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: new Icon(Icons.collections),
                      onPressed: () {
                        if (_globalKeys[currentPage].currentState.validate()) {
                          riderPremium(
                              context,
                              widget._webRefNumber,
                              widget._subSectionDetails,
                              _benifitOverViewDetails,
                              _riderMastersDetails,
                              currentPage);
                        } else {
                          _autoValidateArray[currentPage] = true;
                          Utility().showToastMessage(LabelConstant.kMandatory);
                        }
                      },
                    ),
                  ],
                ),
                body: _returnStateBoady(context, _riderMastersDetails))),
      ),
    );
  }

  _returnStateBoady(context, _riderMastersDetails) {
    final modelPremiumDetails = returnModePremiumDetails();
    return Container(
        padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 10.0),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: benefitSectionSubSection.length + 1,
          onPageChanged: (int index) => {
            currentPage = index,
            FocusScope.of(context).unfocus(),
            setState(() {})
          },
          controller: _pageControllercontroller,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              height: MediaQuery.of(ctxt).size.height,
              child: Column(children: <Widget>[
                (index + 1 == benefitSectionSubSection.length + 1)
                    ? Container()
                    : Container(
                        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                        height: 44.0,
                        width: MediaQuery.of(ctxt).size.width,
                        decoration: BoxDecoration(
                            color: Utility().returnThemColorWithIndex(
                                Utility().returnThemColorIndex()),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Utility().returnThemColorWithIndex(
                                      Utility().returnThemColorIndex()),
                                  blurRadius: 4,
                                  offset: Offset(2.0, 2.0))
                            ]),
                        child: Text(benefitSectionSubSection[index].name,
                            textAlign: TextAlign.center,
                            style: Utility().returnBenifitTextStyle())),
                Expanded(
                    child: Container(
                  child: Form(
                    child: Transform.scale(
                        scale: (index % 2 == 0) ? 0.98 : 1.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ((benefitSectionSubSection.length) > 0 &&
                                      currentPage != 0)
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
                                          _pageControllercontroller
                                              .previousPage(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeIn);
                                        },
                                      ),
                                    )
                                  : Container(),
                              Container(
                                height: MediaQuery.of(ctxt).size.height - 223.0,
                                width: MediaQuery.of(ctxt).size.width - 60.0,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Card(
                                      color: Colors.transparent,
                                      elevation: 6,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: (index + 1 ==
                                              benefitSectionSubSection.length +
                                                  1)
                                          ? _returnPremiumDetails(
                                              context, index)
                                          : _returnSubStateBoady(
                                              context,
                                              benefitSectionSubSection[index],
                                              index),
                                    )
                                  ],
                                ),
                              ),
                              (benefitSectionSubSection.length >=
                                      currentPage + 1)
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
                                  : Container()
                            ])),
                  ),
                )),
                (index + 1 == benefitSectionSubSection.length + 1)
                    ? Container()
                    : Container(
                        height: 50.0,
                        child: Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: modelPremiumDetails.length,
                                itemBuilder:
                                    (BuildContext ctxt, int modelSubIndex) {
                                  return Container(
                                      margin: EdgeInsets.fromLTRB(
                                          4.0, 0.0, 4.0, 0.0),
                                      width:
                                          (MediaQuery.of(context).size.width / 2) -
                                              28.0,
                                      decoration: BoxDecoration(
                                        color:
                                            returnBenefitDetailsBackgroundColorWithIndex(
                                                modelSubIndex),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: (modelSubIndex == 0)
                                          ? Center(
                                              child: Text(
                                                  modelPremiumDetails[
                                                          modelSubIndex]
                                                      .name,
                                                  textAlign: TextAlign.center,
                                                  style: Utility()
                                                      .returnModelPremiumTextStyle()),
                                            )
                                          : new TextFormField(
                                              controller: (_benifitOverViewDetails.length > 0)
                                                  ? ((_benifitOverViewDetails[index]
                                                              ["BSA"] ==
                                                          null)
                                                      ? ((_benifitOverViewDetails[index]
                                                                  ["FE"]
                                                              as PremiumDetails)
                                                          .modePremiumTextEditingController)
                                                      : ((_benifitOverViewDetails[index]
                                                                  ["BSA"]
                                                              as PremiumDetails)
                                                          .modePremiumTextEditingController))
                                                  : TextEditingController(),
                                              validator: (value) {
                                                return null;
                                              },
                                              style: TextStyle(fontSize: 20.0),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  counterStyle: TextStyle(fontSize: 0),
                                                  labelText: modelPremiumDetails[modelSubIndex].name,
                                                  labelStyle: Utility().returnLabelStyle(),
                                                  hintText: modelPremiumDetails[modelSubIndex].name,
                                                  hintStyle: Utility().returnHintStyle(),
                                                  contentPadding: EdgeInsets.all(5.0))));
                                })))
              ]),
            );
          },
        ));
  }

  _returnSubStateBoady(
      context, BenefitDetails benefitSectionSubSection, index) {
    final guidelines = returnGuidelines();
    final benefitDetails = returnBenefitDetails();
    var tempBenefitOverViewDetails = _benifitOverViewDetails[index];
    final riderMasterDetail = (_riderMastersDetails.length > 0)
        ? _riderMastersDetails[benefitSectionSubSection.life]
        : [];
    return Container(
        child: Form(
            key: _globalKeys[(index)],
            autovalidate: (index + 1 <= _autoValidateArray.length)
                ? ((_autoValidateArray[index] != null)
                    ? _autoValidateArray[index]
                    : false)
                : false,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: riderMasterDetail.length,
                itemBuilder: (BuildContext ctxt, int riderIndex) {
                  return Wrap(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                        width: MediaQuery.of(ctxt).size.width,
                        decoration: BoxDecoration(
                            color: Utility().returnContainerColorWithIndex(
                                Utility().returnThemColorIndex()),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Utility().returnThemColorWithIndex(
                                      Utility().returnThemColorIndex()),
                                  blurRadius: 4,
                                  offset: Offset(2.0, 2.0))
                            ]),
                        child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              Container(
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 40.0,
                                        child: IconButton(
                                          iconSize: 30,
                                          icon: new Image.asset(
                                              "assets/images/${riderMasterDetail[riderIndex].imageName}.png"),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                          width: 60.0,
                                          height: 48.0,
                                          child: Center(
                                            child: Text(
                                              riderMasterDetail[riderIndex]
                                                  .benefitCode,
                                              style: Utility()
                                                  .returnRiderHeaderTextStyle(),
                                            ),
                                          )),
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.0),
                                child: Text(
                                  riderMasterDetail[riderIndex].description,
                                  textAlign: TextAlign.left,
                                  style: Utility().returnRiderDescTextStyle(),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.5,
                                color: Utility().returnThemColorWithIndex(
                                    Utility().returnThemColorIndex()),
                                margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5.0),
                                  height: 40.0,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: guidelines.length,
                                      itemBuilder: (BuildContext ctxt,
                                          int gudiSubIndex) {
                                        return Container(
                                            margin: EdgeInsets.fromLTRB(
                                                4.0, 0.0, 4.0, 0.0),
                                            width: (MediaQuery.of(context).size.width / 3) -
                                                ((gudiSubIndex == 2) ? 70.0 : 25.0),
                                            decoration: BoxDecoration(
                                              color:
                                                  returnGuidelinesBackgroundColorWithIndex(
                                                      gudiSubIndex),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: new TextFormField(
                                                controller: (gudiSubIndex == 0)
                                                    ? ((tempBenefitOverViewDetails[
                                                                riderMasterDetail[riderIndex]
                                                                    .benefitCode])
                                                            as PremiumDetails)
                                                        .minTextEditingController
                                                    : (gudiSubIndex == 1)
                                                        ? ((tempBenefitOverViewDetails[riderMasterDetail[riderIndex].benefitCode])
                                                                as PremiumDetails)
                                                            .maxTextEditingController
                                                        : ((tempBenefitOverViewDetails[riderMasterDetail[riderIndex].benefitCode])
                                                                as PremiumDetails)
                                                            .multipleTextEditingController,
                                                readOnly: true,
                                                validator: (value) {
                                                  return null;
                                                },
                                                style: TextStyle(fontSize: 16),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    counterStyle: TextStyle(fontSize: 0),
                                                    labelText: guidelines[gudiSubIndex].name,
                                                    hintText: guidelines[gudiSubIndex].name,
                                                    contentPadding: EdgeInsets.all(5.0) //.fromLTRB(4.0, 10.0, 20.0, 15.0),
                                                    )));
                                      })),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.5,
                                color: Utility().returnThemColorWithIndex(
                                    Utility().returnThemColorIndex()),
                                margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                                  height: 60.0,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: benefitDetails.length,
                                      itemBuilder: (BuildContext ctxt,
                                          int benefitIndex) {
                                        return Container(
                                            margin: EdgeInsets.fromLTRB(
                                                6.0, 10.0, 0.0, 6.0),
                                            height: 60.0,
                                            width: (MediaQuery.of(context).size.width / 2) -
                                                ((benefitIndex == 1) ? 80 : 34.0),
                                            decoration: BoxDecoration(
                                              color:
                                                  returnBenefitDetailsBackgroundColorWithIndex(
                                                      benefitIndex),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: (riderMasterDetail[riderIndex].benefitCode == "HRCL" &&
                                                    benefitIndex == 0)
                                                ? returnDropDownWithIndex(
                                                    context,
                                                    index,
                                                    (tempBenefitOverViewDetails[riderMasterDetail[riderIndex].benefitCode])
                                                        as PremiumDetails,
                                                    benefitDetails[benefitIndex]
                                                        .name,
                                                    riderIndex)
                                                : new TextFormField(
                                                    controller: (benefitIndex == 0)
                                                        ? ((tempBenefitOverViewDetails[riderMasterDetail[riderIndex].benefitCode])
                                                                as PremiumDetails)
                                                            .sumAssuredTextEditingController
                                                        : ((tempBenefitOverViewDetails[riderMasterDetail[riderIndex].benefitCode])
                                                                as PremiumDetails)
                                                            .premiumTextEditingController,
                                                    onChanged: (value) {
                                                      if (_autoValidateArray[
                                                          currentPage]) {
                                                        _globalKeys[currentPage]
                                                            .currentState
                                                            .validate();
                                                      }
                                                      updateMinMaxMultiples(
                                                          value,
                                                          riderIndex,
                                                          index);
                                                    },
                                                    onFieldSubmitted: (value) {
                                                      if (_autoValidateArray[
                                                          currentPage]) {
                                                        _globalKeys[currentPage]
                                                            .currentState
                                                            .validate();
                                                      }
                                                      updateMinMaxMultiples(
                                                          value,
                                                          riderIndex,
                                                          index);
                                                    },
                                                    readOnly: (benefitIndex == 1)
                                                        ? true
                                                        : returnReadOnlyStatusWithRiderIndex(riderIndex, index, benefitSectionSubSection),
                                                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                                    inputFormatters: [NumericTextFormatter()],
                                                    validator: (value) {
                                                      if (benefitIndex == 0) {
                                                        var tempBenefitOverViewDetails =
                                                            _benifitOverViewDetails[
                                                                currentPage];
                                                        if ((tempBenefitOverViewDetails
                                                                    .keys)
                                                                .length >
                                                            riderIndex) {
                                                          final benifitCode =
                                                              (tempBenefitOverViewDetails
                                                                      .keys)
                                                                  .elementAt(
                                                                      riderIndex);
                                                          final premiumDetails =
                                                              tempBenefitOverViewDetails[
                                                                  benifitCode];
                                                          return FormValidator()
                                                              .validPremiumInputText(
                                                                  value
                                                                      .replaceAll(
                                                                          ',',
                                                                          ''),
                                                                  premiumDetails,
                                                                  benifitCode);
                                                        }
                                                      }
                                                      return null;
                                                    },
                                                    style: TextStyle(fontSize: 16, color: Utility().returnPlaceHolderColorWithIndex(Utility().returnThemColorIndex())),
                                                    decoration: InputDecoration(
                                                      errorMaxLines: 4,
                                                      border: InputBorder.none,
                                                      enabledBorder: (benefitIndex ==
                                                              0)
                                                          ? OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Utility()
                                                                      .returnBoarderColorWithIndex(
                                                                          Utility()
                                                                              .returnThemColorIndex())))
                                                          : null,
                                                      counterText: '',
                                                      counterStyle: TextStyle(
                                                          fontSize: 0),
                                                      labelText: benefitDetails[
                                                              benefitIndex]
                                                          .name,
                                                      labelStyle: Utility()
                                                          .returnLabelStyle(),
                                                      hintText: benefitDetails[
                                                              benefitIndex]
                                                          .name,
                                                      hintStyle: Utility()
                                                          .returnHintStyle(),
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              5.0), //.fromLTRB(4.0, 10.0, 20.0, 15.0),
                                                    )));
                                      })),
                            ])),
                      )
                    ],
                  );
                })));
  }

  returnReadOnlyStatusWithRiderIndex(
      int riderIndex, int index, BenefitDetails benefitSectionSubSection) {
    switch (riderIndex) {
      case 0:
        if (benefitSectionSubSection.life == "spouse") {
          return true;
        }
        break;
      case 1:
        if (benefitSectionSubSection.life == "spouse") {
          return true;
        }
        break;
    }
    return false;
  }

//MARK:- Preimun
  _returnPremiumDetails(context, index) {
    final totalPrmium = returnTotalPremium();
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalPrmium.length,
            itemBuilder: (BuildContext ctxt, int totalIndex) {
              final premiumDetails = totalPrmium[totalIndex];
              return Container(
                  margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                  width: MediaQuery.of(ctxt).size.width - 60.0,
                  height: 54.0,
                  decoration: BoxDecoration(
                      color: (totalIndex + 1 == totalPrmium.length)
                          ? Colors.transparent
                          : Utility().returnContainerColorWithIndex(
                              Utility().returnThemColorIndex()),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: (totalIndex + 1 == totalPrmium.length)
                                ? Colors.transparent
                                : Utility().returnThemColorWithIndex(
                                    Utility().returnThemColorIndex()),
                            blurRadius: 4,
                            offset: Offset(2.0, 2.0))
                      ]),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: premiumDetails.length,
                      itemBuilder: (BuildContext ctxt, int premiumIndex) {
                        return Container(
                            margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                            width:
                                (MediaQuery.of(context).size.width / 2) - 60.0,
                            decoration: BoxDecoration(
                              color: (totalIndex + 1 == totalPrmium.length)
                                  ? Colors.transparent
                                  : returnBenefitDetailsBackgroundColorWithIndex(
                                      premiumIndex),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: (premiumIndex == 0)
                                ? (totalIndex + 1 == totalPrmium.length)
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          color: Colors.orange,
                                          child: Text(
                                              premiumDetails[premiumIndex].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0)),
                                          onPressed: () => {
                                            saveQuote(
                                                widget._webRefNumber,
                                                context,
                                                _benifitOverViewDetails,
                                                widget._subSectionDetails,
                                                _riderMastersDetails,
                                                currentPage,
                                                _pageControllercontroller)
                                          },
                                        ),
                                      )
                                    : Center(
                                        child: Text(premiumDetails[premiumIndex].name,
                                            textAlign: TextAlign.center,
                                            style: Utility()
                                                .returnModelPremiumTextStyle()))
                                : ((totalIndex + 1 == totalPrmium.length)
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          color: Colors.orange,
                                          child: Text(
                                              premiumDetails[premiumIndex].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0)),
                                          onPressed: () =>
                                              {Navigator.pop(context)},
                                        ),
                                      )
                                    : new TextFormField(
                                        controller: (totalIndex == 0)
                                            ? (_benifitOverViewDetails[0]["BSA"]
                                                    as PremiumDetails)
                                                .totalModeTextEditingController
                                            : (totalIndex == 1)
                                                ? (_benifitOverViewDetails[0]["BSA"]
                                                        as PremiumDetails)
                                                    .annualTextEditingController
                                                : (totalIndex == 2)
                                                    ? (_benifitOverViewDetails[0]
                                                                ["BSA"]
                                                            as PremiumDetails)
                                                        .halfYearlyTextEditingController
                                                    : (totalIndex == 3)
                                                        ? (_benifitOverViewDetails[0]["BSA"] as PremiumDetails)
                                                            .quaterlyTextEditingController
                                                        : (_benifitOverViewDetails[0]["BSA"] as PremiumDetails)
                                                            .monthlyTextEditingController,
                                        readOnly: true,
                                        validator: (value) {
                                          return "";
                                        },
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                        decoration: InputDecoration(
                                            counterText: '',
                                            counterStyle: TextStyle(fontSize: 0),
                                            labelText: "Premium",
                                            labelStyle: Utility().returnLabelStyle(),
                                            hintText: "Premium",
                                            hintStyle: Utility().returnHintStyle(),
                                            contentPadding: EdgeInsets.all(5.0) //.fromLTRB(4.0, 10.0, 20.0, 15.0),
                                            ))));
                      }));
            }));
  }

//MARK: DropDown
  returnDropDownWithIndex(BuildContext context, int index,
      PremiumDetails _premiumDetails, String _placeHolder, int _riderIndex) {
    return Container(
        color: Utility()
            .returnContainerColorWithIndex(Utility().returnThemColorIndex()),
        height: 60.0,
        child: GestureDetector(
          onTap: () => {
            FocusScope.of(context).unfocus(),
            if (index == 0)
              {
                _returnDialogWithBuildContext(context,
                    _premiumDetails.benfitCode, _premiumDetails, _riderIndex)
              }
          },
          child: Padding(
              padding: EdgeInsets.all(0.0),
              child: AbsorbPointer(
                  child: new Theme(
                data: new ThemeData(
                    hintColor: Utility().returnPlaceHolderColorWithIndex(
                        Utility().returnThemColorIndex())),
                child: TextFormField(
                  controller: _premiumDetails.sumAssuredTextEditingController,
                  style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: Utility().returnPlaceHolderColorWithIndex(
                          Utility().returnThemColorIndex())),
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorMaxLines: 4,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Utility().returnBoarderColorWithIndex(
                                Utility().returnThemColorIndex()))),
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                    labelText: _placeHolder,
                    hintText: _placeHolder,
                    contentPadding: EdgeInsets.all(5.0),
                    suffixIcon: new Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.orange,
                    ),
                  ),
                  validator: (value) {
                    var tempBenefitOverViewDetails =
                        _benifitOverViewDetails[currentPage];
                    final benifitCode = (tempBenefitOverViewDetails.keys)
                        .elementAt(_riderIndex);
                    final premiumDetails =
                        tempBenefitOverViewDetails[benifitCode];
                    return FormValidator().validPremiumInputText(
                        value.replaceAll(',', ''), premiumDetails, benifitCode);
                  },
                ),
              ))),
        ));
  }

  _returnDialogWithBuildContext(BuildContext context, String title,
      PremiumDetails _premiumDetails, int _riderIndex) async {
    //1232
    List<FieldData> fieldData = await DBHelper().getFieldDataWithField(1034);
    fieldData = fieldData;
    filterList = fieldData;
    if (filterList.length > 0) {
      retunrDialog(title, _premiumDetails, _riderIndex);
    }
  }

//MARK:- Dialog
  retunrDialog(String title, PremiumDetails _premiumDetails, int _riderIndex) {
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
                              title,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: LabelConstant.kSearch,
                          //add icon outside input field
                          icon: Icon(Icons.search),
                        ),
                        onChanged: (data) {
                          filterList = [];
                          fieldData.forEach((element) {
                            if (element.fieldValue
                                .toLowerCase()
                                .contains(data.toLowerCase())) {
                              filterList.add(element);
                            }
                          });
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      height: (MediaQuery.of(context).size.height * 0.7) - 4.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: filterList
                            .map((data) => ListTile(
                                title: Text(data.fieldValue),
                                onTap: () => {
                                      FocusScope.of(context).unfocus(),
                                      _selectedData(data, altCntx,
                                          _premiumDetails, _riderIndex)
                                    }))
                            .toList(),
                      ),
                    ),
                  ],
                );
              }));
        });
  }

  void _selectedData(FieldData fieldData, BuildContext context,
      PremiumDetails _premiumDetails, int _riderIndex) {
    _premiumDetails.sumAssuredTextEditingController.text = fieldData.fieldValue;
    _premiumDetails.sumAssured = fieldData.fieldValue;
    if (int.parse(_premiumDetails.max.replaceAll(',', '')) > 0) {
      final _keys = _benifitOverViewDetails.keys;
      var _tempBenefitOverViewDetails = _benifitOverViewDetails[currentPage];
      final _benifitCode =
          (_tempBenefitOverViewDetails.keys).elementAt(_riderIndex);
      var _page = 0;
      for (final key in _keys) {
        final _benifitOverViewDetail = _benifitOverViewDetails[key] as Map;
        final _benifitCodes = _benifitOverViewDetail.keys;
        for (final _benfitKey in _benifitCodes) {
          final _premiumDetails =
              _benifitOverViewDetail[_benfitKey] as PremiumDetails;
          if (_benfitKey == _benifitCode) {
            if (_page == currentPage) {
            } else if (_page != 0) {
              _premiumDetails.sumAssuredTextEditingController.text =
                  fieldData.fieldValue;
              _premiumDetails.sumAssured = fieldData.fieldValue;
            }
          }
        }
        _page = _page + 1;
      }
    }
    Navigator.of(context).pop();
  }

//MARK:- Updating fields
  Future<void> setRiderMasterDetailsWithPlanCode(String planCode) async {
    //Lifes
    //MainLife
    final mainLifeIndex =
        returnIndexWithField(1132, widget._subSectionDetails[1009]);
    var mainLifeData =
        (widget._subSectionDetails[1009][mainLifeIndex] as SectionSubSection);
    benefitSectionSubSection.add(BenefitDetails(
        name: mainLifeData.fieldValue,
        color: Color.fromRGBO(251, 217, 157, 1.0),
        imgName: "SumInsured",
        life: "main"));
    //Marital status
    final maritalStatusXndex =
        returnIndexWithField(1144, widget._subSectionDetails[1009]);
    var maritalStatusData = (widget._subSectionDetails[1009][maritalStatusXndex]
        as SectionSubSection);

    final selfToBeBeCoveredDetails =
        widget._subSectionDetails[1016][9] as SectionSubSection;
    final lifeToBeAssuredDetails =
        widget._subSectionDetails[1016][10] as SectionSubSection;
    final spouseToBeCovered =
        widget._subSectionDetails[1016][11] as SectionSubSection;
    final childToBeCovered =
        widget._subSectionDetails[1016][18] as SectionSubSection;
    final cashlessToBeCovered =
        widget._subSectionDetails[1016][27] as SectionSubSection;

    // //Spouse to be covered & Spouse Details
    if (maritalStatusData.fieldValue == "14") {
      final spouseIndex =
          returnIndexWithField(1161, widget._subSectionDetails[1010]);
      var spouseData =
          (widget._subSectionDetails[1010][spouseIndex] as SectionSubSection);
      if (selfToBeBeCoveredDetails.fieldValue == "1" &&
          spouseToBeCovered.fieldValue == "1") {
        benefitSectionSubSection.add(BenefitDetails(
            name: spouseData.fieldValue,
            color: Color.fromRGBO(251, 217, 157, 1.0),
            imgName: "SumInsured",
            life: "spouse"));
      } else if (selfToBeBeCoveredDetails.fieldValue == "0") {
        if (lifeToBeAssuredDetails.fieldValue == "2") {
          benefitSectionSubSection.add(BenefitDetails(
              name: spouseData.fieldValue,
              color: Color.fromRGBO(251, 217, 157, 1.0),
              imgName: "SumInsured",
              life: "spouse"));
        }
      }
    }
    //Dependent Details
    final dependentIndex =
        returnIndexWithField(1168, widget._subSectionDetails[1010]);
    var dependentData =
        (widget._subSectionDetails[1010][dependentIndex] as SectionSubSection);
    if (dependentData.fieldValue.length > 0) {
      final decodeDetails = json.decode(dependentData.fieldValue);
      if (dependentData.fieldValue.length > 0) {
        var tempArray = [];
        for (final value in decodeDetails) {
          final decode = jsonDecode(value);
          tempArray.add(decode);
        }
        print(tempArray);
        var dependentData = [];
        for (final val in tempArray) {
          if (val["1"].length > 0) {
            List<FieldData> fieldDataDetails = await DBHelper()
                .getFieldDataWithFieldDataID(val["1"].toString(), 1232);
            if (fieldDataDetails.length > 0) {
              final fieldDataDetail = fieldDataDetails[0];
              dependentData.add(fieldDataDetail.fieldValue);
            }
          } else {
            dependentData.add(val["1"]);
          }
        }
        if (selfToBeBeCoveredDetails.fieldValue == "1" &&
            childToBeCovered.fieldValue == "1") {
          for (final dependent in dependentData) {
            benefitSectionSubSection.add(BenefitDetails(
                name: dependent,
                color: Color.fromRGBO(251, 217, 157, 1.0),
                imgName: "SumInsured",
                life: "child"));
          }
        } else if (selfToBeBeCoveredDetails.fieldValue == "0") {
          if (lifeToBeAssuredDetails.fieldValue == "2" ||
              lifeToBeAssuredDetails.fieldValue == "3") {
            for (final dependent in dependentData) {
              benefitSectionSubSection.add(BenefitDetails(
                  name: dependent,
                  color: Color.fromRGBO(251, 217, 157, 1.0),
                  imgName: "SumInsured",
                  life: "child"));
            }
          }
        }
      }
    }
    //Get the riders accourding to lifes
    for (final item in benefitSectionSubSection) {
      final _formKey = GlobalKey<FormState>();
      _globalKeys.add(_formKey);
      final _autoValidate = false;
      _autoValidateArray.add(_autoValidate);
      final details = item as BenefitDetails;
      List<RiderMaster> tempRiderMaster =
          await DBHelper().getRiderMasterWithLife(details.life, planCode);
      if (cashlessToBeCovered.fieldValue == "3") {
        final riderMaster = tempRiderMaster
            .where((elemetn) => elemetn.benefitCode == "HRCL")
            .toList();
        if (riderMaster.length > 0) {
          final index = tempRiderMaster.indexOf(riderMaster[0]);
          tempRiderMaster.removeAt(index);
        }
      }
      if (tempRiderMaster.length > 0) {
        _riderMastersDetails[details.life] = tempRiderMaster;
      }
    }

    //Adding additional global key for premium details
    final _formKey = GlobalKey<FormState>();
    _globalKeys.add(_formKey);
    final _autoValidate = false;
    _autoValidateArray.add(_autoValidate);

    var index = 0;
    for (final benfit in benefitSectionSubSection) {
      final benfitDetails = benfit as BenefitDetails;
      final riderDetails = _riderMastersDetails[benfitDetails.life];
      Map<String, dynamic> reiderMap = Map();
      for (final item in riderDetails) {
        reiderMap[item.benefitCode] = PremiumDetails(
            min: "0",
            max: "0",
            multiple: "0",
            sumAssured: "0",
            premiumm: "0",
            modePremium: "0",
            monthlyPremium: "0",
            quaterlyPremium: "0",
            halfYearlyPremium: "0",
            annualPremium: "0",
            totalModePremium: "0",
            benfitCode: item.benefitCode,
            sumAssuredTextEditingController: TextEditingController(),
            minTextEditingController: TextEditingController(),
            maxTextEditingController: TextEditingController(),
            multipleTextEditingController: TextEditingController(),
            premiumTextEditingController: TextEditingController(),
            monthlyTextEditingController: TextEditingController(),
            quaterlyTextEditingController: TextEditingController(),
            halfYearlyTextEditingController: TextEditingController(),
            annualTextEditingController: TextEditingController(),
            modePremiumTextEditingController: TextEditingController(),
            totalModeTextEditingController: TextEditingController());
      }
      _benifitOverViewDetails[index] = reiderMap;
      index = index + 1;
    }
    //Get premiumDetails and update
    List<PremiumDetails> premiumResponseDetails = await DBHelper()
        .getPremiumDetailsWithWebRefNumber(widget._webRefNumber);
    if (premiumResponseDetails.length > 0) {
      final keys = _benifitOverViewDetails.keys;
      for (final key in keys) {
        final _benifitOverViewDetail = _benifitOverViewDetails[key];
        final codeKeys = (_benifitOverViewDetails[key] as Map).keys;
        for (final code in codeKeys) {
          final premiumDetails = _benifitOverViewDetail[code] as PremiumDetails;
          final premiumResponseDetail = (premiumResponseDetails.where(
              (element) =>
                  (element.benfitCode == premiumDetails.benfitCode) &&
                  (element.riderIndex == key))).toList();
          if (premiumResponseDetail.length > 0) {
            final data = premiumResponseDetail[0];
            premiumDetails.min = data.min;
            premiumDetails.minTextEditingController.text = data.min;
            premiumDetails.max = data.max;
            premiumDetails.maxTextEditingController.text = data.max;
            premiumDetails.multiple = data.multiple;
            premiumDetails.multipleTextEditingController.text = data.multiple;
            premiumDetails.sumAssured = data.sumAssured;
            premiumDetails.sumAssuredTextEditingController.text =
                data.sumAssured;
          }
        }
      }
    }
    setState(() {});
  }

  Future<void> updateMinMaxMultiples(
      String value, int riderIndex, int index) async {
    minMaxMultiples(
        value,
        riderIndex,
        index,
        context,
        widget._webRefNumber,
        widget._subSectionDetails,
        _riderMastersDetails,
        currentPage,
        _benifitOverViewDetails,
        _formatNumber,
        benefitSectionSubSection);
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

  Future<void> calculatePremium() async {}

//MARK:-
  returnBenefitDetailsBackgroundColorWithIndex(int index) {
    switch (index) {
      case 0:
        return ((Utility().returnThemColorIndex()) == 1)
            ? Colors.black
            : Colors.white;
      case 1:
        return Color.fromRGBO(212, 196, 197, 1);
    }
  }

  returnGuidelinesBackgroundColorWithIndex(int index) {
    switch (index) {
      case 0:
        return Color.fromRGBO(248, 216, 80, 1);
      case 1:
        return Color.fromRGBO(250, 171, 62, 1);
      case 2:
        return Color.fromRGBO(212, 196, 197, 1);
    }
  }

//MARK:-
  returnGuidelines() {
    return [
      Guidelines(
          name: LabelConstant.kMin,
          color: Color.fromRGBO(253, 223, 92, 1.0),
          imgName: "Min"),
      Guidelines(
          name: LabelConstant.kMax,
          color: Color.fromRGBO(255, 175, 68, 1.0),
          imgName: "Max"),
      Guidelines(
          name: LabelConstant.kMultiples,
          color: Color.fromRGBO(212, 196, 197, 1.0),
          imgName: "Total"),
    ];
  }

  returnBenefitDetails() {
    return [
      Guidelines(
          name: LabelConstant.kSumInsured,
          color: Color.fromRGBO(253, 223, 92, 1.0),
          imgName: "SumInsured"),
      Guidelines(
          name: LabelConstant.kPremium,
          color: Color.fromRGBO(212, 196, 197, 1.0),
          imgName: "Premium"),
    ];
  }

  returnModePremiumDetails() {
    return [
      Guidelines(
          name: LabelConstant.kModePremium,
          color: Color.fromRGBO(253, 223, 92, 1.0),
          imgName: ""),
      Guidelines(
          name: LabelConstant.kPremium,
          color: Color.fromRGBO(212, 196, 197, 1.0),
          imgName: ""),
    ];
  }

  returnTotalPremium() {
    return [
      [
        Guidelines(
            name: LabelConstant.kTotalModePremium,
            color: Color.fromRGBO(253, 223, 92, 1.0),
            imgName: ""),
        Guidelines(
            name: LabelConstant.kPremium,
            color: Color.fromRGBO(212, 196, 197, 1.0),
            imgName: ""),
      ],
      [
        Guidelines(
            name: LabelConstant.kAnnualPremium,
            color: Color.fromRGBO(253, 223, 92, 1.0),
            imgName: ""),
        Guidelines(
            name: LabelConstant.kPremium,
            color: Color.fromRGBO(212, 196, 197, 1.0),
            imgName: ""),
      ],
      [
        Guidelines(
            name: LabelConstant.kHalfYearlyPremium,
            color: Color.fromRGBO(253, 223, 92, 1.0),
            imgName: ""),
        Guidelines(
            name: LabelConstant.kPremium,
            color: Color.fromRGBO(212, 196, 197, 1.0),
            imgName: ""),
      ],
      [
        Guidelines(
            name: LabelConstant.kQuaterlyPremium,
            color: Color.fromRGBO(253, 223, 92, 1.0),
            imgName: ""),
        Guidelines(
            name: LabelConstant.kPremium,
            color: Color.fromRGBO(212, 196, 197, 1.0),
            imgName: ""),
      ],
      [
        Guidelines(
            name: LabelConstant.kMonthlyPremium,
            color: Color.fromRGBO(253, 223, 92, 1.0),
            imgName: ""),
        Guidelines(
            name: LabelConstant.kPremium,
            color: Color.fromRGBO(212, 196, 197, 1.0),
            imgName: ""),
      ],
      [
        Guidelines(
            name: LabelConstant.kSave,
            color: Color.fromRGBO(253, 223, 92, 1.0),
            imgName: ""),
        Guidelines(
            name: LabelConstant.kCancel,
            color: Color.fromRGBO(212, 196, 197, 1.0),
            imgName: ""),
      ]
    ];
  }
}

//MARK:- TextInput
class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = NumberFormat("#,###");
      final number =
          int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
