import 'package:athenacx_flutter_demo/screens/dashboard/analytics/graph_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoAnalyticsScreen extends StatelessWidget {

  final double graphWidth = 155;

  final double graphHeight = 100;

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
                      color: Colors.deepPurple,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/bgd_repeat.png',
                            repeat: ImageRepeat.repeat,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "No Analytics, Yet!",
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
                            "You have no analytics yet as you have not provided us with any answers in a suitable study.",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black45),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Container(
                                  width: graphWidth,
                                  height: graphHeight,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 0.5,
                                        height: graphHeight,
                                        color: Colors.black45,
                                      ),
                                      GraphBar(graphHeight: graphHeight),
                                      GraphBar(graphHeight: graphHeight),
                                      GraphBar(graphHeight: graphHeight),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Container(
                                  width: graphWidth,
                                  height: 0.5,
                                  color: Colors.black45,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "If you wish to take part in some of the available open studies, please tap the 'menu' button in the top left hand side of the screen.",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black26),
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
