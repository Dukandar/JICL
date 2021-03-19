import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_screens/BusinessCardScreen.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'BusinessScreen.dart';
import 'LeftMenu.dart';
import 'package:jiclapp/app_util/constant.dart';

class HomeScreen extends StatefulWidget {
  final int businessID;
  HomeScreen(this.businessID);
  @override
  State<StatefulWidget> createState() {
    return HomeScreenSate();
  }
}

class HomeScreenSate extends State<HomeScreen> {
  var businessDetailArray = [];
  var businessCount = {};
  void initState() {
    super.initState();
    getFieldResponse();
  }

  getFieldResponse() {
    if (widget.businessID == BusinessIDS.kNewBusinessID) {
      _newBusinessPool();
    } else if (widget.businessID == BusinessIDS.kPaymentID) {
      _paymentPool();
    }
  }

  void _paymentPool() async {
    //Proposal Payment
    List<FieldResponse> fieldResponse =
        await DBHelper().getFieldResponseDetails();
    final paymentData =
        fieldResponse.where((element) => element.sectionID == 6000);
    final paymentPool = paymentData.map((e) => e.webRefNumber).toList();
    final payment = LinkedHashSet<String>.from(paymentPool).toList();
    var _gridDetails = PaymentDashBoard.details;
    _gridDetails[0].count = payment.length;
    _businessDetailWith(PaymentDashBoard.details);
  }

  void _newBusinessPool() async {
    List<FieldResponse> fieldResponse =
        await DBHelper().getFieldResponseDetails();
    //1001,2000,2002,3000
    //SuspectPool
    final suspectPoolData =
        fieldResponse.where((element) => element.sectionID == 1001);
    final tempSuspectPool = suspectPoolData.map((e) => e.webRefNumber).toList();
    final suspectPool = LinkedHashSet<String>.from(tempSuspectPool).toList();
    businessCount["suspectPool"] = suspectPool.length;
    //ProspectPool
    final prospectPoolData =
        fieldResponse.where((element) => element.sectionID == 2000);
    final tempProspectPool =
        prospectPoolData.map((e) => e.webRefNumber).toList();
    final prospectPool = LinkedHashSet<String>.from(tempProspectPool).toList();
    businessCount["prospectPool"] = prospectPool.length;
    //ConfirmProspectPool
    final confirmProspectPoolData =
        fieldResponse.where((element) => element.sectionID == 2001);
    final confirmTempProspectPool =
        confirmProspectPoolData.map((e) => e.webRefNumber).toList();
    final confirmProspectPool =
        LinkedHashSet<String>.from(confirmTempProspectPool).toList();
    businessCount["confirmprospectPool"] = confirmProspectPool.length;
    //FNA
    final fNAData = fieldResponse.where((element) => element.sectionID == 2002);
    final fNADataPool = fNAData.map((e) => e.webRefNumber).toList();
    final fNAPool = LinkedHashSet<String>.from(fNADataPool).toList();
    businessCount["fNAPool"] = fNAPool.length;
    //quotation
    final quotationdata =
        fieldResponse.where((element) => element.sectionID == 3000);
    final quotationPool = quotationdata.map((e) => e.webRefNumber).toList();
    final quotation = LinkedHashSet<String>.from(quotationPool).toList();
    businessCount["quotation"] = quotation.length;
    //Proposal
    final proposaldata =
        fieldResponse.where((element) => element.sectionID == 4000);
    final proposalPool = proposaldata.map((e) => e.webRefNumber).toList();
    final proposal = LinkedHashSet<String>.from(proposalPool).toList();
    businessCount["proposal"] = proposal.length;
    //Failed Proposal
    final failedProposaldata =
        fieldResponse.where((element) => element.sectionID == 4003);
    final failedProposaldataPool =
        failedProposaldata.map((e) => e.webRefNumber).toList();
    final failedProposal =
        LinkedHashSet<String>.from(failedProposaldataPool).toList();
    businessCount["failedproposal"] = failedProposal.length;
    //Proposal Status
    final proposalStatusdata =
        fieldResponse.where((element) => element.sectionID == 4001);
    final proposalStatusPool =
        proposalStatusdata.map((e) => e.webRefNumber).toList();
    final proposalStatus =
        LinkedHashSet<String>.from(proposalStatusPool).toList();
    businessCount["proposalStatus"] = proposalStatus.length;

    homeDetails.details[0].count = businessCount["suspectPool"];
    homeDetails.details[1].count = businessCount["prospectPool"] +
        businessCount["confirmprospectPool"] +
        businessCount["fNAPool"];
    homeDetails.details[2].count = businessCount["quotation"];
    homeDetails.details[3].count = businessCount["proposal"] +
        businessCount["failedproposal"] +
        businessCount["proposalStatus"];
    _businessDetailWith(homeDetails.details);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(image: Utility().returnBackgroundImage()),
          child: Scaffold(
            drawer: LeftMenu(),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(navigationTitle.kNewBusiness),
              backgroundColor: Utility()
                  .returnThemColorWithIndex(Utility().returnThemColorIndex()),
            ),
            body: childLayoutWidget(context),
          ),
        ),
      ),
    );
  }

  _businessDetailWith(List businessDetail) {
    var _tempbusinessDetailArray = [];
    for (int i = 0; i < businessDetail.length; i++) {
      var tempArray = [];
      tempArray.add(businessDetail[i]);
      if (i + 1 < businessDetail.length) {
        tempArray.add(businessDetail[i + 1]);
      }
      _tempbusinessDetailArray.add(tempArray);
      i = i + 1;
    }
    businessDetailArray = _tempbusinessDetailArray;
    setState(() {});
  }

  Widget childLayoutWidget(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: businessDetailArray.length,
          itemBuilder: (BuildContext ctxt, int subIndex) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: businessDetailArray[subIndex].length,
                  itemBuilder: (BuildContext itemCtx, int itemIndex) {
                    final gridItem = businessDetailArray[subIndex][itemIndex];
                    return new GestureDetector(
                      onTap: () => {_navigateToNextPage(gridItem, subIndex)},
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: gridItem.color,
                            boxShadow: [
                              BoxShadow(
                                color: Utility().returnThemColorWithIndex(
                                    Utility().returnThemColorIndex()),
                                blurRadius: 5.0,
                                offset: Offset(0.0, 8.0),
                              )
                            ]),
                        margin: (itemIndex % 2 == 0)
                            ? EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10)
                            : EdgeInsets.only(
                                top: 10, left: 0, right: 10, bottom: 10),
                        height: 150,
                        width: (businessDetailArray[subIndex].length == 1)
                            ? MediaQuery.of(itemCtx).size.width
                            : MediaQuery.of(itemCtx).size.width / 2.0 -
                                ((itemIndex % 2 == 0) ? 26.0 : 0.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 60,
                                width: 100,
                                margin:
                                    EdgeInsets.only(top: 30.0, bottom: 10.0),
                                child: Text(gridItem.title,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: Utility().returnHeaderTextStyle())),
                            Container(
                                height: 30,
                                width: 100,
                                child: Text((gridItem.count).toString(),
                                    textAlign: TextAlign.center,
                                    style: Utility().returnHeaderTextStyle()))
                          ],
                        ),
                      ),
                    );
                  },
                ));
          }),
    ));
  }

  void refreshState() {
    getFieldResponse();
  }

  void _navigateToNextPage(dynamic gridItem, int subIndex) {
    if (widget.businessID == BusinessIDS.kNewBusinessID) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BusinessScreen(
                  refreshState, _returnPaymentObject(gridItem, subIndex))));
    } else if (widget.businessID == BusinessIDS.kPaymentID) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BusinessCardScreen(
                  refreshState, _returnPaymentObject(gridItem, subIndex))));
    }
  }

  Map _returnPaymentObject(dynamic _gridItem, int subIndex) {
    Map _object = {
      "title": _gridItem.title,
      "index": subIndex,
      "businessID": _gridItem.businessId,
      "businessSubID": _gridItem.businessId,
      "businessCount": businessCount,
      "poolname": _gridItem.poolName
    };
    return _object;
  }
}
