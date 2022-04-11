import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../values/colors.dart';
import '../values/constants.dart';
import '../widget/widgets_style.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum CurrentDashoardType {
  sales,
  cashier,
  waiter,
  kitchen,
  functionHall,
  staffClient,
  configure,
  pricing,
  analytics,
  inventory
}

class _HomeState extends State<Home> {
  bool dashBoardMenuVisiblity = false;
  Color currentMenuBackGroundColor = darkBlue;

  var dashBoardType = CurrentDashoardType.sales;

  @override
  Widget build(BuildContext context) {
    print(':  $dashBoardType');
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: blueShade700,
            // padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          dashBoardMenuVisiblity = !dashBoardMenuVisiblity;
                          print(dashBoardMenuVisiblity);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CircleAvatar(
                          backgroundColor: white,
                          radius: 30.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        dashboardTitle,
                        style: bigTextStyle(),
                      ),
                    ),
                    const Expanded(
                      child: Spacer(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        personName,
                        style: smallTextStyle(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: CircleAvatar(
                        backgroundColor: black,
                        radius: 30.0,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Visibility(
                        visible: dashBoardMenuVisiblity,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Column(
                            children: [
                              Container(
                                color:
                                    dashBoardType == CurrentDashoardType.sales
                                        ? currentMenuBackGroundColor
                                        : blueShade700,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: IconButton(
                                    // Use the MdiIcons class for the IconData
                                    icon: Icon(
                                      MdiIcons.gridLarge,
                                      color: white,
                                    ),
                                    hoverColor: white,
                                    onPressed: () {
                                      setState(() {
                                        dashBoardType =
                                            CurrentDashoardType.sales;
                                        dashboardTitle = 'Sales Dashboard';
                                        print(dashBoardType);
                                        print('sales');
                                      });
                                    }),
                              ),
                              Container(
                                color:
                                    dashBoardType == CurrentDashoardType.cashier
                                        ? currentMenuBackGroundColor
                                        : blueShade700,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: IconButton(
                                    // Use the MdiIcons class for the IconData
                                    icon: Icon(
                                      MdiIcons.contentSaveOutline,
                                      color: white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        dashBoardType =
                                            CurrentDashoardType.cashier;
                                        dashboardTitle = 'Cashier Dashboard';
                                      });
                                    }),
                              ),
                              Container(
                                color:
                                    dashBoardType == CurrentDashoardType.waiter
                                        ? currentMenuBackGroundColor
                                        : blueShade700,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: IconButton(
                                    // Use the MdiIcons class for the IconData
                                    icon: Icon(
                                      MdiIcons.account,
                                      color: white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        dashBoardType =
                                            CurrentDashoardType.waiter;
                                        dashboardTitle = 'Waiter Dashboard';
                                      });
                                    }),
                              ),
                              Container(
                                color:
                                dashBoardType == CurrentDashoardType.pricing
                                    ? currentMenuBackGroundColor
                                    : blueShade700,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: IconButton(
                                    // Use the MdiIcons class for the IconData
                                    icon: Icon(
                                      MdiIcons.currencyUsd,
                                      color: white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                    dashBoardType = CurrentDashoardType.pricing;
                                        dashboardTitle = 'Pricing';
                                      });
                                    }),
                              ),
                              Container(
                                color:
                                dashBoardType == CurrentDashoardType.staffClient
                                    ? currentMenuBackGroundColor
                                    : blueShade700,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: IconButton(
                                    // Use the MdiIcons class for the IconData

                                    icon: Icon(
                                      MdiIcons.accountMultiple,
                                      color: white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        dashBoardType = CurrentDashoardType.staffClient;
                                        dashboardTitle = 'Satff /Clients';
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: dashBoardMenuVisiblity
                            ? MediaQuery.of(context).size.width * 0.8
                            : MediaQuery.of(context).size.width * 1,
                        color: Colors.red,
                        child: Center(
                            child: Text(
                          dashboardTitle,
                          style: smallTextStyle(),
                        )),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
