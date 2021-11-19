import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoStudiesScreen extends StatelessWidget {
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
                              "Hello, Welcome!",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You are not enrolled in any studies at this time.",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black45),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Text(
                                  "In order to join a study, please tap",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black45),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    'assets/images/menu.png',
                                    color: Colors.black,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "If you have been provided a userID, please select",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black45),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "-'Join Closed Study'",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "If you wish to join an open survey, please select",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black45),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "-'Find Open Study'",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.blue),
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
