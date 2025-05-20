import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class AnalyticsDashboard extends StatefulWidget {
  const AnalyticsDashboard({super.key});

  @override
  State<AnalyticsDashboard> createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  String _selectedYear = DateTime.now().year.toString();
  List<String> years = [
    DateTime.now().year.toString(),
    (DateTime.now().year - 1).toString(),
    (DateTime.now().year - 2).toString(),
    (DateTime.now().year - 3).toString(),
    (DateTime.now().year - 4).toString(),
  ];
  // Data for the chart
  final List<double> _targetValues = [
    25000,
    35000,
    30000,
    28000,
    20000,
    25000,
    22000,
    30000,
    35000,
    23000,
    17000,
    20000
  ];
  final List<double> _actualValues = [
    7000,
    17000,
    15000,
    15000,
    7000,
    10000,
    4000,
    2000,
    8000,
    5000,
    4000,
    9000
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 8 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildChartSection(),
          ],
        ));
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            Icon(
              Icons.analytics_rounded,
              size: 32,
              color: Colors.grey,
            ),
            const Text(
              'Analytics',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            _buildFilterButton('Completed'),
            _buildFilterButton('All'),
            _buildYearDropdown(),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterButton(String filter) {
    return Container(
      constraints: BoxConstraints(minWidth: 56),
      padding: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: Row(
        spacing: 4,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: filter == "Completed"
                    ? Colors.blue
                    : Colors.blue.withOpacity(.2)),
          ),
          Text(
            filter,
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildYearDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedYear,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedYear = newValue;
              });
            }
          },
          items: years.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildChartSection() {
    return SizedBox(
      height: 420,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 40000,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.blueGrey.shade800,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String month = getMonthName(groupIndex);
                return BarTooltipItem(
                  '$month: ${rod.toY.toInt()}',
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(getMonthName(value.toInt(), short: true)),
                  );
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  String text = '';
                  if (value == 0) {
                    text = '0';
                  } else if (value == 10000) {
                    text = '10K';
                  } else if (value == 20000) {
                    text = '20K';
                  } else if (value == 30000) {
                    text = '30K';
                  } else if (value == 40000) {
                    text = '40K';
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(text, style: const TextStyle(fontSize: 12)),
                  );
                },
                reservedSize: 40,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            horizontalInterval: 10000,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.transparent,
                strokeWidth: 0,
              );
            },
          ),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(12, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: _actualValues[index],
                  color: Colors.blue,
                  width: 24,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: _targetValues[index],
                    color: Colors.blue.withOpacity(0.1),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  String getMonthName(int monthIndex, {bool short = false}) {
    final List<String> monthsLong = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final List<String> monthsShort = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    if (monthIndex >= 0 && monthIndex < 12) {
      return short ? monthsShort[monthIndex] : monthsLong[monthIndex];
    }
    return '';
  }
}
