import 'dart:ffi';

import 'package:athenacx_flutter_demo/data/local_prefs.dart';
import 'package:athenacx_flutter_demo/drawer/drawer_constants.dart';
import 'package:athenacx_flutter_demo/screens/dashboard/analytics/analytics.dart';
import 'package:athenacx_flutter_demo/screens/dashboard/analytics/no_analytics.dart';
import 'package:athenacx_flutter_demo/screens/dashboard/open_studies/find_open_study.dart';
import 'package:athenacx_flutter_demo/screens/dashboard/join_close_study.dart';
import 'package:athenacx_flutter_demo/screens/dashboard/my_studies/studies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import '../../drawer/drawer.dart';
import 'my_studies/no_studies.dart';

class DashboardScreen extends StatefulWidget {
  static const String DASHBOARD_SCREEN = "/dashboard";

  static const String SURVEY_DOWNLOADED = "isSurveyDownloaded";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<DashboardScreen> {
  DrawerItems currentItem = DrawerItems.MY_STUDIES;

  Widget currentWidget = NoStudiesScreen();

  LocalPreferences localPreferences = new LocalPreferences();

  bool isSurveyDownloaded = false;

  Future<bool> checkSurveyDownloadStatus() async {
    isSurveyDownloaded =
        await localPreferences.getBoolToPref(DashboardScreen.SURVEY_DOWNLOADED);
    if (isSurveyDownloaded == null) isSurveyDownloaded = false;
    return isSurveyDownloaded;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logobg.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: FutureBuilder<bool>(
              future: checkSurveyDownloadStatus(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return getBodyContent(currentItem);
              }),
        ),
        appBar: AppBar(
            title: currentItem == DrawerItems.FIND_OPEN_STUDY
                ? Text("Home Page")
                : Text(currentItem.displayDrawerName)),
        drawer: MyDrawer(
            currentItem: currentItem,
            onDrawerClicked: (item) {
              setState(() {
                if (item == DrawerItems.SYNC_FITBIT) {
                  showFitbitSyncAlert(this.context);
                } else {
                  this.currentItem = item;
                }
              });
            }),
      ),
    );
  }

  Widget getBodyContent(DrawerItems items) {
    switch (items) {
      case DrawerItems.MY_STUDIES:
        return isSurveyDownloaded ? StudiesScreen() : NoStudiesScreen();
      case DrawerItems.JOIN_CLOSED_STUDY:
        return JoinClosedStudiesScreen(
          callback: () {
            setState(() {
              currentItem = DrawerItems.MY_STUDIES;
            });
          },
        );
      case DrawerItems.FIND_OPEN_STUDY:
        return FindOpenStudiesScreen(
          callback: () {
            setState(() {
              currentItem = DrawerItems.MY_STUDIES;
            });
          },
        );
      case DrawerItems.VIEW_ANALYTICS:
        return isSurveyDownloaded ? AnalyticsScreen() : NoAnalyticsScreen();
      default:
        return NoStudiesScreen();
    }
  }

  void showFitbitSyncAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (context) => BasicDialogAlert(
        content: Text(
          "Please login to your Fitbit account in order to connect your device.",
          style: TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text(
              "OK",
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          BasicDialogAction(
            title: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
