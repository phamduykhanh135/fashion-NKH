import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart( this.W1, this.W2, this.W3, this.W4, {super.key});
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
              value: W3,
              color: MyColor.color_w3,
              showTitle: false
          ),
          PieChartSectionData(
            value: W4,
            color: MyColor.color_w4,
              showTitle: false
          ),

          PieChartSectionData(
              value: W1,
              color: MyColor.color_w1,
              showTitle: false
          ),
          PieChartSectionData(
              value: W2,
              color: MyColor.color_w2,
            showTitle: false
          ),

        ]
      )

    );
  }
}

