import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Configuration.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/Utility.dart';

class CoverageDetails extends StatefulWidget {
  final _subSectionDetails;
  final _webRefNumber;
  final Function _function;

  CoverageDetails(
      Key key, this._function, this._subSectionDetails, this._webRefNumber)
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CoverageDetailsState();
  }
}

class CoverageDetailsState extends State<CoverageDetails> {
  CoverageDetailsState();
  var _selectedIndex = 0;
  Map _sectionSubSectionDetails = Map();
  List benefitSectionSubSection = List();
  Map<String, dynamic> riderMastersDetails = Map();
  Map<int, dynamic> _benifitOverViewDetails = Map();
  Map<String, dynamic> benfitDetails = Map();
  List<RiderMaster> riderMasters = [];
  void childCallBack(String fieldValue) {
    widget._function(
        widget._subSectionDetails.sectionID,
        widget._subSectionDetails.subSectionID,
        widget._subSectionDetails.fieldID,
        fieldValue,
        widget._subSectionDetails.index);
  }

  @override
  void initState() {
    super.initState();
    setFieldValue();
  }

  setFieldValue() {
    final details = widget._subSectionDetails.fieldValue;
    if (details.length > 0) {
      final decodeDetails = json.decode(details);
      if (decodeDetails.length > 0) {
        final keys = (decodeDetails as Map).keys.toList();
        for (final key in keys) {
          final details = decodeDetails[key];
          if (details.length > 0) {
            List premiumCoverageDetails = List();
            for (final item in details) {
              premiumCoverageDetails.add(PremiumCoverageDetails(
                  benifitCode: item["BenfitCode"],
                  sumAssured: item["SumAssured"],
                  description: item["Description"],
                  textEditingController: TextEditingController()));
            }
            benfitDetails[key] = premiumCoverageDetails;
          }
        }
      }
      updateValues();
      setState(() {});
    }
  }

  void updateValues() {
    final keys = benfitDetails.keys.toList();
    for (final key in keys) {
      final details = benfitDetails[key];
      if (details != null) {
        for (final item in details) {
          final premiumCoverageDetail = item as PremiumCoverageDetails;
          premiumCoverageDetail.textEditingController.text =
              premiumCoverageDetail.sumAssured;
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return new Container(
      child: new Column(children: <Widget>[
        Container(
            height: 60.0,
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: benfitDetails.keys.toList().length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => {
                            FocusScope.of(context).unfocus(),
                            gestureTappedWithIndex(index)
                          },
                      child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                              color: (index == _selectedIndex)
                                  ? Colors.orange
                                  : Utility().returnContainerColorWithIndex(
                                      Utility().returnThemColorIndex()),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: Offset(6.0, 6.0))
                              ]),
                          width: MediaQuery.of(context).size.width * 0.3,
                          margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                          child: Center(
                            child: Text(
                              (benfitDetails.keys.toList())[index],
                              textAlign: TextAlign.center,
                              style: (index == _selectedIndex)
                                  ? Utility().retuenWhilteTextStyle()
                                  : Utility()
                                      .returnBusinssDetailsNormalTextStyle(),
                            ),
                          )));
                })),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: _returnDependentField(
              context,
              (benfitDetails.length > 0)
                  ? benfitDetails[(benfitDetails.keys.toList())[_selectedIndex]]
                  : List()),
        ),
      ]),
    );
  }

  _returnDependentField(BuildContext context, List details) {
    return new Opacity(
        opacity: 1.0,
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: details.length,
              itemBuilder: (BuildContext ctxt, int index) {
                final detail = details[index] as PremiumCoverageDetails;
                return Wrap(children: <Widget>[
                  new Container(
                    width: MediaQuery.of(ctxt).size.width,
                    margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                    decoration: BoxDecoration(
                        color: Utility().returnContainerColorWithIndex(
                            Utility().returnThemColorIndex()),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Utility().returnThemColorWithIndex(
                                  Utility().returnThemColorIndex()),
                              blurRadius: 4,
                              offset: Offset(2.0, 2.0))
                        ]),
                    child: Column(children: <Widget>[
                      Container(
                          child: Center(
                        child: Row(children: <Widget>[
                          Container(
                            child: IconButton(
                              iconSize: 30,
                              icon: new Image.asset(
                                  "assets/images/${detail.benifitCode}.png"),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  detail.benifitCode,
                                  style: Utility()
                                      .returnBusinssDetailsNormalTextStyle(),
                                ),
                              )),
                        ]),
                      )),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text(
                          detail.description,
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
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                          width: MediaQuery.of(context).size.width - 128.0,
                          height: 80.0,
                          child: new Theme(
                            data: new ThemeData(
                              hintColor: Utility()
                                  .returnPlaceHolderColorWithIndex(
                                      Utility().returnThemColorIndex()),
                            ),
                            child: TextFormField(
                              controller: detail.textEditingController,
                              style: Utility()
                                  .returnBusinssDetailsNormalTextStyle(),
                              autofocus: false,
                              // initialValue:detail.sumAssured,
                              readOnly: true,
                              onChanged: (text) {},
                              decoration: InputDecoration(
                                labelText: (widget._subSectionDetails
                                            .fieldDependencyID ==
                                        1358)
                                    ? "Premium"
                                    : "Sum Insured",
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
                                border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.amber),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Utility()
                                          .returnTextFieldBoarderColorWithIndex(
                                              Utility().returnThemColorIndex()),
                                      width: 0.5),
                                ),
                              ),
                            ),
                          )),
                    ]),
                  )
                ]);
              }),
        ));
  }

  void gestureTappedWithIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  //MARK:-
  void quotationDetailsWithSectionID(
      int subSectionID, String webRefNumber, String fieldValue) async {
    List<SubSectionMaster> data =
        await DBHelper().getSubSectionMasterWith(subSectionID);
    if (data.length > 0) {
      var index = 0;
      await Future.forEach(data, (str) async {
        final detail = data[index];
        List<SectionSubSection> fieldMasterData = await DBHelper()
            .getFieldMasterDataWith(
                detail.subSectionID, subSectionID, webRefNumber);
        if (fieldMasterData.length > 0) {
          _sectionSubSectionDetails[detail.subSectionID] = fieldMasterData;
        }
        if (index + 1 == data.length) {
          setRiderMasterDetailsWithPlanCode("L14");
        }
        index = index + 1;
      });
    }
  }

//MARK:- Updating fields
  Future<void> setRiderMasterDetailsWithPlanCode(String planCode) async {
    //Lifes
    //MainLife
    final mainLifeIndex =
        returnIndexWithField(1132, _sectionSubSectionDetails[1009]);
    var mainLifeData =
        (_sectionSubSectionDetails[1009][mainLifeIndex] as SectionSubSection);
    benefitSectionSubSection.add(BenefitDetails(
        name: mainLifeData.fieldValue,
        color: Color.fromRGBO(251, 217, 157, 1.0),
        imgName: "SumInsured",
        life: "main"));
    //Marital status
    final maritalStatusXndex =
        returnIndexWithField(1144, _sectionSubSectionDetails[1009]);
    var maritalStatusData = (_sectionSubSectionDetails[1009][maritalStatusXndex]
        as SectionSubSection);

    final selfToBeBeCoveredDetails =
        _sectionSubSectionDetails[1016][9] as SectionSubSection;
    final lifeToBeAssuredDetails =
        _sectionSubSectionDetails[1016][10] as SectionSubSection;
    final spouseToBeCovered =
        _sectionSubSectionDetails[1016][11] as SectionSubSection;
    final childToBeCovered =
        _sectionSubSectionDetails[1016][18] as SectionSubSection;

    // //Spouse to be covered & Spouse Details
    if (maritalStatusData.fieldValue == "14") {
      final spouseIndex =
          returnIndexWithField(1161, _sectionSubSectionDetails[1010]);
      var spouseData =
          (_sectionSubSectionDetails[1010][spouseIndex] as SectionSubSection);
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
        returnIndexWithField(1168, _sectionSubSectionDetails[1010]);
    var dependentData =
        (_sectionSubSectionDetails[1010][dependentIndex] as SectionSubSection);
    if (dependentData.fieldValue.length > 0) {
      final decodeDetails = json.decode(dependentData.fieldValue);
      if (decodeDetails.length > 0) {
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
        print(dependentData);
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
      final details = item as BenefitDetails;
      List<RiderMaster> tempRiderMaster =
          await DBHelper().getRiderMasterWithLife(details.life, planCode);
      if (tempRiderMaster.length > 0) {
        riderMastersDetails[details.life] = tempRiderMaster;
      }
    }

    var index = 0;
    for (final benfit in benefitSectionSubSection) {
      final benfitDetails = benfit as BenefitDetails;
      final riderDetails = riderMastersDetails[benfitDetails.life];
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
    //Utility().activity(context);
    Timer.run(() async {
      List<ServiceResponseID> serviceResponseID =
          await DBHelper().getServiceResponseIDWith(widget._webRefNumber);
      if (serviceResponseID.length > 0) {
        final contactID = serviceResponseID[0].contactID;
        String response = await APIManager().calculatePremium(
            _sectionSubSectionDetails,
            _benifitOverViewDetails,
            riderMastersDetails,
            _selectedIndex,
            int.parse(contactID));
        final premiumDetails = jsonDecode(response);
        if (response.length > 0) {
          List<dynamic> benefitOverView = premiumDetails["LstBenefitOverView"];
          var index = 0;
          for (final item in benefitOverView) {
            final objBenefitMemberRelationship =
                item["objBenefitMemberRelationship"][_selectedIndex];
            final key = (benfitDetails.keys.toList())[_selectedIndex];
            final details = benfitDetails[key];
            if (index + 1 <= (details as List).length) {
              final tempDetails = details[index] as PremiumCoverageDetails;
              if (tempDetails != null) {
                if (objBenefitMemberRelationship["Rider_Premium"] == null ||
                    objBenefitMemberRelationship["Rider_Premium"].length == 0) {
                  tempDetails.textEditingController.text = "0";
                } else {
                  tempDetails.textEditingController.text =
                      objBenefitMemberRelationship["Rider_Premium"];
                }
              }
            }
            index = index + 1;
          }
          childCallBack("0,0");
        } else {
          childCallBack("0,0");
          Utility().showToastMessage(premiumDetails["Message"]);
        }
      }
    });
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

//Call Back Funcation
  void refreshState(String webRefNumber, String fieldValue) {
    quotationDetailsWithSectionID(3000, webRefNumber, fieldValue);
  }
}
