import 'package:athenacx_flutter_demo/data/local_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class JoinClosedStudiesScreen extends StatefulWidget {

  final Function callback;

  JoinClosedStudiesScreen({this.callback});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State(callback: callback);
  }
}

class _State extends State<JoinClosedStudiesScreen> {

  _State({this.callback});

  final Function callback;

  bool isConfirmButtonEnabled = false;

  double confirmButtonOpacity = 0.5;

  LocalPreferences localPreferences = new LocalPreferences();

  void enableConfirmButton() {
    setState(() {
      isConfirmButtonEnabled = true;
      confirmButtonOpacity = 1;
    });
  }

  void disableConfirmButton() {
    setState(() {
      isConfirmButtonEnabled = false;
      confirmButtonOpacity = 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 20,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 70,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/bgd_repeat.png',
                            repeat: ImageRepeat.repeat,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Here for a private study?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 30, left: 15, right: 15, bottom: 30),
                      child: Column(
                        children: [
                          Text(
                            "Please enter your participantID which has been given you in order to download your study",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black45),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 10, right: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black45, width: 0.3),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black45, width: 0.3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 0.3),
                                ),
                                hintText: 'participantID',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty ||
                                      value.trim().length == 0) {
                                    disableConfirmButton();
                                  } else {
                                    enableConfirmButton();
                                  }
                                });
                              },
                            ),
                          ),
                          Opacity(
                            opacity: confirmButtonOpacity,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // background color
                                    onPrimary: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                  ),
                                  onPressed: () {
                                    localPreferences.setBoolToPref(
                                        DashboardScreen.SURVEY_DOWNLOADED, true);
                                    this.callback();
                                  },
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
