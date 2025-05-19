import 'package:flutter/material.dart';

import '../../components/book_keeping_report.dart';
import '../../components/report_page_toggle.dart';
import '../../components/task_report.dart';
import '../../components/user_role_report.dart';
import '../../constants.dart';

int pageIndex = 0;

List<Widget> selectedPage = [
  TaskReport(),
  UserRoleReport(),
  BookKeepingReport(),
];

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(spacing: defaultPadding, children: [
      ReportPageToggleWidget(onPageChanged: (int selectedIndex) {
        setState(() {
          pageIndex = selectedIndex;
        });
      }),
      SizedBox(
          height: 692,
          child: selectedPage[pageIndex.clamp(0, selectedPage.length - 1)])
    ]));
  }
}
