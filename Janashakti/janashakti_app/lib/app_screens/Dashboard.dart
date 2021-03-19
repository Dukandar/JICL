import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:jiclapp/app_util/ColorHandler.dart';

import 'LeftMenu.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_util/constant.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<DashboardScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return new WillPopScope(
       onWillPop: () async => false,
       child:  Scaffold(
        body: Container(
            decoration: BoxDecoration(image: Utility().returnBackgroundImage()),
            child: Scaffold(
                drawer: LeftMenu(),
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text(navigationTitle.kHome),
                  backgroundColor: Utility().returnThemColorWithIndex(
                      Utility().returnThemColorIndex()),
                ),
                body: GridView
                    .count(crossAxisCount: 1, childAspectRatio: 1.4, children: <
                        Widget>[
                  for (var item in dashboardItems)
                    GestureDetector(
                        // onTap: () => {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => DashboardScreen()))
                        //     },
                        // behavior: HitTestBehavior.translucent,
                        child: new Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HexColor.fromHex(item.bg),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 2, // 80%
                                    child: new Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(100.0)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Container(
                                                  height: 50,
                                                  margin: EdgeInsets.only(
                                                      top: 2,
                                                      left: 8,
                                                      right: 10,
                                                      bottom: 10),
                                                  child: Image.asset(
                                                    'assets/images/' +
                                                        item.icon,
                                                    width: 50.0,
                                                  )),
                                            ],
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                for (var textValue
                                                    in item.leftValues)
                                                  new Container(
                                                    // color: Colors.blueAccent,
                                                    height: 40,
                                                    child: Text(textValue,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                                  )
                                              ])
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 8, // 80%
                                    child: new Container(
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Container(
                                                  height: 50,
                                                  margin: EdgeInsets.only(
                                                      top: 2,
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                              child: Text(
                                                                  item.title,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          17,
                                                                      color: Colors
                                                                          .white)))),
                                                      Expanded(
                                                          child: Container(
                                                              child: Text(
                                                                  item.subTitle,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white)))),
                                                      Container(
                                                          height: 1,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                          color: Colors.white),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                item.rightValues.length,
                                                (index) {
                                              if (item.title == "MY GOAL") {
                                                final width =
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.5;
                                                return new Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                            child: Container(
                                                                height: 100,
                                                                child: Image.asset(
                                                                    "assets/images/ForeignTour01.png")))
                                                      ],
                                                    ),
                                                    Container(
                                                      width: width,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                                  height: 10,
                                                                  width: width /
                                                                      3.3,
                                                                  color: Colors
                                                                      .red)),
                                                          Expanded(
                                                              child: Container(
                                                                  height: 10,
                                                                  width: width /
                                                                      3.3,
                                                                  color: Colors
                                                                      .yellow)),
                                                          Expanded(
                                                              child: Container(
                                                                  height: 10,
                                                                  width: width /
                                                                      3.3,
                                                                  color: Colors
                                                                      .green)),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                            child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10),
                                                                child: Text(
                                                                    "Achievements %",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white))))
                                                      ],
                                                    )
                                                  ],
                                                );
                                              } else {
                                                return Row(
                                                    // height: 40,
                                                    // color: Colors.blueAccent,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 40,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              item.rightValues[
                                                                  index],
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      )
                                                    ]);
                                              }
                                            }),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            )))
                ]))))
     );
  }
}

class DashboardViewModel {
  final String bg;
  final String icon;
  final String title;
  final String subTitle;
  final String route;
  final List<String> leftValues;
  final List<String> rightValues;

  DashboardViewModel(
      {this.bg,
      this.icon,
      this.title,
      this.subTitle,
      this.route,
      this.leftValues,
      this.rightValues});
}

final List<DashboardViewModel> dashboardItems = [
  DashboardViewModel(
      bg: "#336799",
      icon: "goal.png",
      title: "MY GOAL",
      subTitle: "What is my Mission?",
      route: homeRoute,
      leftValues: ["0"],
      rightValues: ["Achievements"]),
  DashboardViewModel(
      bg: "#d94040",
      icon: "business.png",
      title: "MY BUSINESS",
      subTitle: "Where am I?",
      route: recruitmentRoute,
      leftValues: [
        "0",
        "120",
        "10"
      ],
      rightValues: [
        "Cumulative MCFP",
        "PR Year 1 (Value)",
        "PR Year 1 (Volume)"
      ]),
  DashboardViewModel(
      bg: "#26997c",
      icon: "trophy.png",
      title: "MY COMPETITIONS",
      subTitle: "What is my Rank?",
      route: adminRoute,
      leftValues: [
        "0",
        "120"
      ],
      rightValues: [
        "Monthly Medals (Cumulative)",
        "Monthly Certificate (Regional Rank)"
      ]),
  DashboardViewModel(
      bg: "#73870c",
      icon: "hand.png",
      title: "MY ACTIONS",
      subTitle: "What to work on?",
      route: newBusinessRoute,
      leftValues: [
        "0",
        "120",
        "10",
        "33"
      ],
      rightValues: [
        "Incomplete Proposals (Number)",
        "Pending Requirement (Number)",
        "Conversion Rate (Need Analysis to Quotation %)",
        "Closing Rate (Quotation to Policy %)"
      ]),
  DashboardViewModel(
      bg: "#d9a60d",
      icon: "customers.png",
      title: "MY CUSTOMERS",
      subTitle: "How to support?",
      route: hierarchyRoute,
      leftValues: [
        "100",
        "200"
      ],
      rightValues: [
        "Number of PendingService Requests",
        "Number of Pending Claims"
      ]),
  DashboardViewModel(
      bg: "#a15488",
      icon: "calendar.png",
      title: "MY CALENDAR",
      subTitle: "Review and Meetings",
      route: paymentRoute,
      leftValues: ["0"],
      rightValues: ["Calendar View"])
];
