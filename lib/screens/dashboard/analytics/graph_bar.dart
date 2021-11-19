import 'package:flutter/material.dart';
class GraphBar extends StatelessWidget {

  final double barSpacing = 10;
  final double graphHeight;

  GraphBar({this.graphHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: barSpacing,top: 5),
      child: Container(
          width: 40,
          height: graphHeight,decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black38,
              Colors.black12,
            ],
          )
      )),
    );
  }
}