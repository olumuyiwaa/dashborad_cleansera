import 'package:cleansera_dashboards/constants.dart';
import 'package:flutter/material.dart';

import '../models/project.dart';
import '../models/user.dart';

class TaskDetailsPreviewModal extends StatefulWidget {
  final Project project;
  List<User> users;

  TaskDetailsPreviewModal({
    super.key,
    required this.project,
    required this.users,
  });

  @override
  State<TaskDetailsPreviewModal> createState() =>
      _TaskDetailsPreviewModalState();
}

class _TaskDetailsPreviewModalState extends State<TaskDetailsPreviewModal> {
  List<User> selectedStaffs = [];
  List<User> filteredStaffs = [];
  bool _isSearching = false;
  TextEditingController staffInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSection(
                          'Client Information',
                          [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: _buildDetailItem(Icons.person,
                                          'Name', widget.project.name)),
                                  Expanded(
                                      child: _buildDetailItem(Icons.email,
                                          'Email', widget.project.email)),
                                  Expanded(
                                      child: _buildDetailItem(Icons.location_on,
                                          'Address', widget.project.address)),
                                  Expanded(
                                      child: _buildDetailItem(
                                          Icons.location_city,
                                          'City',
                                          widget.project.city)),
                                  Expanded(
                                      child: _buildDetailItem(Icons.map,
                                          'Region', widget.project.region)),
                                ])
                          ],
                        ),
                        const Divider(height: 30),
                        _buildSection(
                          'Project Details',
                          [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: _buildStatusChip(
                                          widget.project.status)),
                                  Expanded(
                                      child: _buildDetailItem(
                                          Icons.repeat,
                                          'Frequency',
                                          widget.project.frequency)),
                                  Expanded(
                                      child: _buildDetailItem(
                                          Icons.meeting_room,
                                          'Rooms',
                                          widget.project.rooms)),
                                  Expanded(
                                      child: _buildDetailItem(Icons.people,
                                          'Workers', widget.project.workers)),
                                  Expanded(
                                      child: _buildDetailItem(
                                          Icons.square_foot,
                                          'Property Size',
                                          widget.project.propertySize)),
                                ]),
                            SizedBox(
                              height: 8,
                            ),
                            _buildDetailItem(Icons.description, 'Description',
                                widget.project.projectDescription),
                          ],
                        ),
                        const Divider(height: 30),
                        _buildSection(
                          'Schedule & Special Requests',
                          [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: _buildDateRow(context, 'Start Date',
                                        widget.project.startDate)),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: _buildDateRow(context, 'Finish Date',
                                        widget.project.finishDate)),
                                if (widget
                                    .project.specialRequest.isNotEmpty) ...[
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: _buildDetailItem(
                                          Icons.star,
                                          'Special Request',
                                          widget.project.specialRequest)),
                                ],
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  _buildSearchAndSelectedStaffs(),
                  SizedBox(height: defaultPadding),
                  _buildFooter(context),
                ],
              ),
            )));
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.assignment,
              color: Colors.grey.shade700,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task Summary',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                widget.project.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Icon(icon, size: 18, color: Colors.grey[600]),
          ),
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
                const SizedBox(height: 4),
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

  Widget _buildSearchAndSelectedStaffs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: staffInputController,
                decoration: const InputDecoration(
                  hintText: 'Search Staff...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                onChanged: (value) {
                  setState(() {
                    _isSearching = value.isNotEmpty;
                    filteredStaffs = widget.users
                        .where((staff) => staff.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              if (_isSearching && filteredStaffs.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: filteredStaffs.length,
                    itemBuilder: (context, index) {
                      final staff = filteredStaffs[index];
                      final isSelected = selectedStaffs.contains(staff);
                      return ListTile(
                        dense: true,
                        title: Text(staff.name),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle,
                                color: Colors.green)
                            : null,
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedStaffs.remove(staff);
                            } else {
                              selectedStaffs.add(staff);
                            }
                            staffInputController.clear();
                            _isSearching = false;
                          });
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text('Assigned Staffs', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: selectedStaffs
              .map((staff) => Chip(
                    label: Text(staff.name),
                    deleteIcon: const Icon(Icons.remove_circle,
                        color: Colors.red, size: 18),
                    onDeleted: () {
                      setState(() {
                        selectedStaffs.remove(staff);
                      });
                    },
                  ))
              .toList(),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          label: const Text(
            'Update Assigned Staffs',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // Add your action here
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    IconData statusIcon;

    switch (status.toLowerCase()) {
      case 'completed':
        chipColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'in progress':
        chipColor = Colors.blue;
        statusIcon = Icons.refresh;
        break;
      case 'pending':
        chipColor = Colors.orange;
        statusIcon = Icons.hourglass_empty;
        break;
      default:
        chipColor = Colors.grey;
        statusIcon = Icons.circle;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
            child: Icon(Icons.assignment_turned_in,
                size: 18, color: Colors.grey[600]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: chipColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: chipColor.withOpacity(0.5), width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 16, color: chipColor),
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
          ),
        ],
      ),
    );
  }

  Widget _buildDateRow(BuildContext context, String label, String? date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            child:
                Icon(Icons.calendar_today, size: 18, color: Colors.grey[600]),
          ),
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
                const SizedBox(height: 4),
                Text(
                  date ?? 'Not selected',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: date == null ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton.icon(
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            label: const Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            label: const Text('Edit'),
            onPressed: () {
              // Add your action here
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
