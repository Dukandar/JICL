import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_screens/BusinessDetailsScreen.dart';
import 'package:jiclapp/app_util/Utility.dart';
import '../app_util/constant.dart';
import 'BusinessCardScreen.dart';

class BusinessScreen extends StatefulWidget {
  final object;
  final function;
  BusinessScreen(this.function, this.object);
  @override
  State<StatefulWidget> createState() {
    return BusinessScreenState();
  }
}

class BusinessScreenState extends State<BusinessScreen> {
  var businessCount = {};
  var businessDetailArray = [];
  void initState() {
    super.initState();
    getFieldResponse(widget.object["businessID"]);
  }

  @override
  Widget build(BuildContext context) {
    final object = widget.object;
    return new WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: Container(
          decoration: BoxDecoration(image: Utility().returnBackgroundImage()),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                title: Text(object["title"]),
                backgroundColor: Utility()
                    .returnThemColorWithIndex(Utility().returnThemColorIndex()),
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () =>
                      {widget.function(), Navigator.of(context).pop()},
                )),
            body: childLayoutWidget(
                context, object["index"], object["businessID"]),
          ),
        ),
      ),
    );
  }

  returnBusinessDetailWith(List businessDetail) {
    var businessDetailArray = [];
    for (int i = 0; i < businessDetail.length; i++) {
      var tempArray = [];
      tempArray.add(businessDetail[i]);
      if (i + 1 < businessDetail.length) {
        tempArray.add(businessDetail[i + 1]);
      }
      businessDetailArray.add(tempArray);
      i = i + 1;
    }
    return businessDetailArray;
  }

  returnBusinessDeailsWithCount(int businessId) {
    var tempBusinessDetails =
        businessDetails.returnBusinessDetailsWithIndex(businessId);
    switch (businessId) {
      case 1000:
        tempBusinessDetails[1].count = businessCount["suspectPool"];
        break;
      case 2000:
        tempBusinessDetails[0].count = businessCount["prospectPool"];
        tempBusinessDetails[1].count = businessCount["confirmprospectPool"];
        tempBusinessDetails[2].count = businessCount["fNAPool"];
        break;
      case 3000:
        tempBusinessDetails[0].count = businessCount["quotation"];
        break;
      case 4000:
        tempBusinessDetails[0].count = businessCount["proposal"];
        tempBusinessDetails[1].count = businessCount["proposalStatus"];
        tempBusinessDetails[3].count = businessCount["failedproposal"];
        break;
    }
    return tempBusinessDetails;
  }

  getFieldResponse(int businessId) async {
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
    var tempBusinessDetails = returnBusinessDeailsWithCount(businessId);
    businessDetailArray = returnBusinessDetailWith(tempBusinessDetails);
    setState(() {});
  }

  Widget childLayoutWidget(BuildContext context, int index, int businessId) {
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
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: businessDetailArray[subIndex].length,
                  itemBuilder: (BuildContext itemCtx, int itemIndex) {
                    final gridItem = businessDetailArray[subIndex][itemIndex];
                    return new GestureDetector(
                      onTap: () => {
                        _navigatePageWith(
                            _returnMapObjectWithGridItem(gridItem, businessId),
                            context)
                      },
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
                              margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                              child: Text(gridItem.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: Utility().returnHeaderTextStyle()),
                            ),
                            Container(
                                height: 30,
                                width: 100,
                                // margin: EdgeInsets.only(top: 16.0, bottom: 10.0),
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

  _navigatePageWith(object, BuildContext context) {
    switch (object["businessSubID"]) {
      case 1000:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BusinessDetailScreen(object)));
        break;
      default:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BusinessCardScreen(refreshState, object)));
        break;
        break;
    }
  }

  Map _returnMapObjectWithGridItem(dynamic _gridItem, int _businessId) {
    Map<String, dynamic> mapObject = {
      "title": _gridItem.title,
      "businessID": _businessId,
      "businessSubID": _gridItem.businessId,
      "poolname": _gridItem.poolName
    };
    return mapObject;
  }

  void refreshState() {
    getFieldResponse(widget.object["businessID"]);
  }
}
