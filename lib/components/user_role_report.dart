import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'input_drop_down.dart';

class UserRoleReport extends StatefulWidget {
  // final Function(Map<String, dynamic>) onFilterApplied;

  const UserRoleReport({
    super.key,
    // required this.onFilterApplied,
  });

  @override
  State<UserRoleReport> createState() => _UserRoleReportState();
}

class _UserRoleReportState extends State<UserRoleReport> {
  // Filter values
  String _location = 'All';
  String _userDivision = 'All';
  String _user = 'All';
  String _task = 'Other';
  DateTime? _startDate;
  DateTime? _endDate;
  String _capacity = 'External';

  // Reset all filters
  void _clearFilters() {
    setState(() {
      _location = 'All';
      _userDivision = 'All';
      _user = 'All';
      _task = 'Other';
      _startDate = null;
      _endDate = null;
      _capacity = 'External';
    });
  }

  // Apply current filters
  void _applyFilters() {
    final filterData = {
      'location': _location,
      'userDivision': _userDivision,
      'user': _user,
      'task': _task,
      'startDate': _startDate,
      'endDate': _endDate,
      'capacity': _capacity,
    };
    // widget.onFilterApplied(filterData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter title
          const Text(
            'Filter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // First row - dropdowns
          Row(
            children: [
              // Location dropdown
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Location'),
                    const SizedBox(height: 8),
                    InputDropDown(
                      value: _location,
                      items: ['All', 'Europe', 'Asia', 'Americas'],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _location = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              // User division dropdown
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Division'),
                    const SizedBox(height: 8),
                    InputDropDown(
                      value: _userDivision,
                      items: ['All', 'IT', 'Finance', 'HR', 'Sales'],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _userDivision = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              // User dropdown
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('User'),
                    const SizedBox(height: 8),
                    InputDropDown(
                      value: _user,
                      items: ['All', 'John', 'Jane', 'Sam', 'Alex'],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _user = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),

              const Spacer(),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 24),

          // Second row - date pickers
          Row(
            children: [
              // Start date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Start date:'),
                    const SizedBox(height: 8),
                    _buildDatePicker(
                      value: _startDate,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (date != null) {
                          setState(() {
                            _startDate = date;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              // Finish date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Finish date:'),
                    const SizedBox(height: 8),
                    _buildDatePicker(
                      value: _endDate,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (date != null) {
                          setState(() {
                            _endDate = date;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),

              // Empty spaces to align with dropdowns above
              const Spacer(),
              const Spacer(),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 24),

          // Note
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Note:',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "All fields are selected separately and conjuncted with AND operator when generating report;\nNo selection = 'Any' (no filtration by this field)",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: _clearFilters,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Clear',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _applyFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Generate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build consistent date pickers
  Widget _buildDatePicker({
    required DateTime? value,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value == null ? 'Select' : DateFormat('dd/MM/yyyy').format(value),
              style: TextStyle(
                color: value == null ? Colors.grey[600] : Colors.black,
              ),
            ),
            const Icon(Icons.calendar_today, size: 18),
          ],
        ),
      ),
    );
  }
}
