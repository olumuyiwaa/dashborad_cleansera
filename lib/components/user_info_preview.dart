import 'package:flutter/material.dart';

import '../models/user.dart';
import 'holiday_request.dart';
import 'time_sheet.dart';
import 'user_info_fields.dart';

class UserInfoPreview extends StatelessWidget {
  final User user;

  const UserInfoPreview({
    super.key,
    required this.user,
  });
  void _showUserDetailsModal(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserInfoFields(
          user: user,
        );
      },
    );
  }

  void _showUserTimeSheetModal(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Timesheet(
          staff: user,
        );
      },
    );
  }

  void _showUserHoldidaySheetModal(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HolidaySheet(
          staff: user,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildSection('Personal Information', [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: _buildDetailItem(Icons.person, 'Name', user.name)),
                  Expanded(
                      child:
                          _buildDetailItem(Icons.title, 'Title', user.title)),
                  Expanded(
                      child: _buildDetailItem(
                          Icons.cleaning_services, 'Practice', user.practice)),
                  Expanded(
                      child: _buildDetailItem(
                          Icons.location_on, 'Location', user.location)),
                ])
          ]),
          const Divider(height: 30),
          _buildSection('Employment Details', [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: _buildDetailItem(
                          Icons.article, 'Contract', user.contract)),
                  Expanded(
                      child:
                          _buildDetailItem(Icons.grade, 'Grade', user.grade)),
                  Expanded(
                      child: _buildDetailItem(
                          Icons.account_tree, 'Division', user.division)),
                  Expanded(
                      child: _buildDetailItem(Icons.supervisor_account,
                          'Division Manager', user.divisionManager)),
                ])
          ]),
          const Divider(height: 30),
          _buildSection('Account Info', [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: _buildDetailItem(
                          Icons.account_circle, 'Login', user.login)),
                  Expanded(child: _buildStatusChip(user.status)),
                  Expanded(
                      child: _buildDetailItem(Icons.date_range, 'Date Created',
                          '${user.dateCreated.toLocal()}'.split(' ')[0])),
                ])
          ]),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: user.profileImageUrl != null
              ? NetworkImage(user.profileImageUrl!)
              : null,
          child: user.profileImageUrl == null
              ? Text(
                  user.name.isNotEmpty ? user.name[0] : '?',
                  style: const TextStyle(fontSize: 24),
                )
              : null,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Details',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              user.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        InkWell(
            onTap: () {
              _showUserDetailsModal(context, user);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Icon(Icons.edit, size: 24, color: Colors.grey[600]))),
        const SizedBox(width: 16),
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Icon(Icons.delete, size: 24, color: Colors.red)),
        Spacer(),
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Icon(Icons.mail, size: 24, color: Colors.blue)),
        const SizedBox(width: 16),
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Icon(Icons.file_open, size: 24, color: Colors.blue)),
        const SizedBox(width: 16),
        InkWell(
            onTap: () {
              _showUserHoldidaySheetModal(context, user);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Icon(Icons.airplanemode_active,
                    size: 24, color: Colors.blue))),
        const SizedBox(width: 16),
        InkWell(
            onTap: () {
              _showUserTimeSheetModal(context, user);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child:
                    Icon(Icons.hourglass_bottom, size: 24, color: Colors.blue)))
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(icon, size: 20, color: Colors.grey[600])),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    IconData icon;

    switch (status.toLowerCase()) {
      case 'activated':
        chipColor = Colors.green;
        icon = Icons.check_circle;
        break;
      case 'deactivated':
        chipColor = Colors.red;
        icon = Icons.cancel;
        break;
      default:
        chipColor = Colors.grey;
        icon = Icons.help_outline;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(Icons.toggle_on, size: 20, color: Colors.grey[600])),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: chipColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: chipColor.withOpacity(0.5), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: chipColor),
                const SizedBox(width: 6),
                Text(
                  status,
                  style: TextStyle(
                    color: chipColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
