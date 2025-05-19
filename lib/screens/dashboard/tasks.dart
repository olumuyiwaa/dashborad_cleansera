import 'package:flutter/material.dart';

import '../../components/task_list_filter.dart';
import '../../components/task_list_table.dart';
import '../../constants.dart';
import '../../models/project.dart';
import '../../models/user.dart';

void _handleFilterChange(List<String> statuses, List<String> industries) {
  // Handle filter changes
  print('Selected statuses: $statuses');
  print('Selected industry: $industries');
  // You would typically use this to filter your data
}

class Tasks extends StatelessWidget {
  final List<Project> projects;
  final List<User> users;

  const Tasks({
    super.key,
    required this.projects,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(spacing: defaultPadding, children: [
      TaskListFilters(
        onFilterChanged: _handleFilterChange,
      ),
      SizedBox(
          height: 692,
          child: ProjectListTable(
            allProjects: projects,
            users: users,
            user: User.empty(),
          ))
    ]));
  }
}
