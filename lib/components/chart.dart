import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 120,
              startDegreeOffset: -90,
              sections: paiChartSelectionData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "595",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      fontSize: 24),
                ),
                Text("Total")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: primaryColor,
    value: 25,
    showTitle: false,
    radius: 28,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 24,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 20,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 12,
  ),
];
