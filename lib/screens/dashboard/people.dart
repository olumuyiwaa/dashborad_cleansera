import 'package:flutter/material.dart';

import '../../components/active_staff.dart';
import '../../components/filter.dart';
import '../../components/staff_list_table.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';

class People extends StatelessWidget {
  final List<User> allStaffs;

  final ValueChanged<int> onItemTapped;
  final ValueChanged<String> onTitleTapped;
  final ValueChanged<User> onItemUser;

  People(
      {super.key,
      required this.onItemTapped,
      required this.onTitleTapped,
      required this.onItemUser,
      required this.allStaffs});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(spacing: defaultPadding, children: [
      ActivePeopleWidget(),
      Row(
        spacing: defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Responsive.isMobile(context)) FilterWidget(),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                spacing: defaultPadding,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 692,
                      child: StaffListTable(
                        allStaffs: allStaffs,
                        onItemTapped: (int index) {
                          onItemTapped(index);
                        },
                        onTitleTapped: (String title) {
                          onTitleTapped(title);
                        },
                        onItemUser: (User value) {
                          onItemUser(value);
                        },
                      )),
                  if (Responsive.isMobile(context)) FilterWidget(),
                ],
              ),
            ),
          ),
        ],
      )
    ]));
  }
}
