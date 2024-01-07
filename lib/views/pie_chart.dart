import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  MyPieChart( this.W1, this.W2, this.W3, this.W4);
  final W1;
  final W2;
  final W3;
  final W4;


  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: W1,
            color: Colors.blueAccent,
              showTitle: false
          ),
          PieChartSectionData(
              value: W2,
              color: Colors.red,
              showTitle: false
          ),
          PieChartSectionData(
              value: W3,
              color: Colors.green,
            showTitle: false
          ),
          PieChartSectionData(
              value: W4,
              color: Colors.yellow,
              showTitle: false
          )
        ]
      )

    );
  }
}
