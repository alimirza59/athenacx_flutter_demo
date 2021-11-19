import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphTile extends StatelessWidget {

  const GraphTile({
    @required this.sampleData1,
  });

  final LineChartData sampleData1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5,left: 10,right: 10),
      child: Card(
        elevation: 10,
        child: Container(
          height: 300,
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: LineChart(
              sampleData1,
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ),
      ),
    );
  }
}
