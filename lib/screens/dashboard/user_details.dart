import 'package:flutter/material.dart';

import '../../components/task_list_table.dart';
import '../../components/user_info_preview.dart';
import '../../constants.dart';
import '../../models/project.dart';
import '../../models/user.dart';

void _handleFilterChange(List<String> statuses, List<String> industries) {
  // Handle filter changes
  print('Selected statuses: $statuses');
  print('Selected industry: $industries');
  // You would typically use this to filter your data
}

class UserDetails extends StatefulWidget {
  final User user;
  final List<User> users;
  final List<Project> projects;
  UserDetails(
      {super.key,
      required this.user,
      required this.projects,
      required this.users});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
// Controllers for text fields

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(spacing: defaultPadding, children: [
      UserInfoPreview(
        user: widget.user,
      ),
      SizedBox(
          height: 692,
          child: ProjectListTable(
            user: widget.user,
            allProjects: widget.projects,
            users: widget.users,
          ))
    ]));
  }
}
