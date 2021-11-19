import 'package:athenacx_flutter_demo/data/local_prefs.dart';
import 'package:athenacx_flutter_demo/screens/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'open_studies_list_tile.dart';

class FindOpenStudiesScreen extends StatefulWidget {
  final Function callback;

  FindOpenStudiesScreen({this.callback});

  @override
  _State createState() => _State(callback: callback);
}

class _State extends State<FindOpenStudiesScreen> {
  _State({this.callback});

  final Function callback;

  List<OpenStudyListTile> openStudyList = [];

  LocalPreferences localPreferences = new LocalPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOpenStudiesList();
  }

  void getOpenStudiesList() {
    for (int i = 0; i < 10; i++) {
      openStudyList.add(
        OpenStudyListTile(
          title: 'Study no. ${i + 1}',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
          position: i,
          onTap: (position) {
            localPreferences.setBoolToPref(
                DashboardScreen.SURVEY_DOWNLOADED, true);
            callback();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView(
        children: openStudyList,
      ),
    );
  }
}
