import 'package:athenacx_flutter_demo/screens/dashboard/my_studies/studies_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'studies_constants.dart';
import 'studies_model.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

class StudiesScreen extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<StudiesScreen> with TickerProviderStateMixin {
  List<Studies> studyList = [];

  double borderWidth = 0.3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudyList();
  }

  void getStudyList() {
    studyList.add(
      new Studies(
        title: StudyType.URGENT.displayName,
        contents: [
          StudiesContent(
            studyName: 'Study no. 1',
            duration: Duration(seconds: 300),
          ),
          StudiesContent(
            studyName: 'Study no. 7',
            duration: Duration(seconds: 180),
          )
        ],
        isExpanded: true,
        primaryColor: Colors.pink.shade400,
        secondaryColor: Colors.pink.shade50,
      ),
    );
    studyList.add(
      new Studies(
        title: StudyType.AVAILABLE.displayName,
        contents: [
          StudiesContent(
            studyName: 'Study no. 2',
            duration: Duration(seconds: 0),
          ),
          StudiesContent(
            studyName: 'Study no. 3',
            duration: Duration(seconds: 0),
          ),
          StudiesContent(
            studyName: 'Study no. 4',
            duration: Duration(seconds: 0),
          ),
          StudiesContent(
            studyName: 'Study no. 6',
            duration: Duration(seconds: 0),
          ),
        ],
        isExpanded: false,
        primaryColor: Colors.blue.shade400,
        secondaryColor: Colors.blue.shade50,
      ),
    );
    studyList.add(
      new Studies(
        title: StudyType.UNAVAILABLE.displayName,
        contents: [
          StudiesContent(
            studyName: 'Study no. 5',
            duration: Duration(seconds: 0),
          ),
          StudiesContent(
            studyName: 'Study no. 8',
            duration: Duration(seconds: 0),
          ),
          StudiesContent(
            studyName: 'Study no. 9',
            duration: Duration(seconds: 0),
          ),
          StudiesContent(
            studyName: 'Study no. 10',
            duration: Duration(seconds: 0),
          ),
        ],
        isExpanded: false,
        primaryColor: Colors.grey.shade400,
        secondaryColor: Colors.grey.shade50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView.builder(
          itemCount: studyList.length,
          itemBuilder: (context, index) {
            return Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Card(
                  color: studyList[index].primaryColor,
                  elevation: 2,
                  child: ExpansionTile(
                    initiallyExpanded: studyList[index].isExpanded,
                    trailing: Container(
                      width: 15,
                      height: 15,
                      child: Center(
                        child: Text(
                          studyList[index].isExpanded ? "-" : "+",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              width: borderWidth, color: Colors.white)),
                    ),
                    title: Text(
                      studyList[index].title,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    children: <Widget>[
                      new Column(
                        children: _buildExpandableContent(studyList[index]),
                      ),
                    ],
                    onExpansionChanged: (value) {
                      setState(() {
                        studyList[index].isExpanded = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildExpandableContent(Studies studies) {
    List<Widget> columnContent = [];

    for (StudiesContent content in studies.contents) {
      columnContent.add(
        GestureDetector(
          onTap: () {
            if (studies.title != StudyType.UNAVAILABLE.displayName) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => StopWatchTimerPage(),
              //   ),
              // );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left:
                    BorderSide(color: studies.primaryColor, width: borderWidth),
                bottom:
                    BorderSide(color: studies.primaryColor, width: borderWidth),
                right:
                    BorderSide(color: studies.primaryColor, width: borderWidth),
              ),
            ),
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: studies.secondaryColor,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            content.studyName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                            ),
                          ),
                          Visibility(
                            visible: studies.title ==
                                StudyType.URGENT.displayName,
                            child: CountdownFormatted(
                              duration: content.duration,
                              builder: (BuildContext ctx, String remaining) {
                                return Text(
                                  remaining,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.pink.shade400),
                                ); // 01:00:00
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return columnContent;
  }
}
