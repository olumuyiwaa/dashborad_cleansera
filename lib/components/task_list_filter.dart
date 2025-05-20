import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';

class TaskListFilters extends StatefulWidget {
  final Function(List<String>, List<String>) onFilterChanged;

  const TaskListFilters({
    Key? key,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  State<TaskListFilters> createState() => _TaskListFiltersState();
}

class _TaskListFiltersState extends State<TaskListFilters> {
  // Industry options
  final List<String> _practiceOptions = [
    'All',
    'Commercial Cleaning',
    'Residential Cleaning',
    'Industrial Cleaning',
    'Deep Cleaning',
    'Event Cleaning',
    'Post-Construction Cleaning',
    'Green Cleaning',
    'Medical Facility Cleaning',
    'Hazardous Waste Cleanup',
    'Janitorial Services',
    'Window Cleaning',
    'Hotel Cleaning',
    'Office Cleaning',
    'School Cleaning',
    'Residential',
    'Commercial',
    'Post-Construction',
    'Seasonal',
    'Industrial',
    'Healthcare',
    'Retail',
    'Educational',
    'Hospitality',
    'Government',
    'Outdoor',
    'Special Event',
    'Move-Out',
    'Renovation Cleanup',
    'Eco-Friendly',
    'Emergency Cleaning'
  ];

  // Status options with corresponding counts
  final Map<String, int> _statusCounts = {
    'In progress': 581,
    'Upcoming': 2,
    'Suspended': 0,
    'Completed': 0,
    'Anticipated': 0,
  };

  // Selected filters
  List<String> _selectedPractice = ['All'];
  List<String> _selectedStatuses = [];

  void _updateFilters() {
    widget.onFilterChanged(_selectedStatuses, _selectedPractice);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Task(Job) list',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Industry filter
            Padding(
              padding: const EdgeInsets.only(bottom: defaultPadding),
              child: !Responsive.isMobile(context)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 80,
                          height: 34,
                          child: Text(
                            'Practice',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: _practiceOptions.map((industry) {
                              return FilterChip(
                                label: Text(industry),
                                selected: _selectedPractice.contains(industry),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      // If "All" is selected, clear other selections
                                      if (industry == 'All') {
                                        _selectedPractice = ['All'];
                                      } else {
                                        // If another option is selected, remove "All"
                                        _selectedPractice.remove('All');
                                        // Add the selected industry
                                        _selectedPractice.add(industry);
                                      }
                                    } else {
                                      // Remove the industry if unselected
                                      _selectedPractice.remove(industry);
                                      // If nothing is selected, default to "All"
                                      if (_selectedPractice.isEmpty) {
                                        _selectedPractice = ['All'];
                                      }
                                    }
                                    _updateFilters();
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: Colors.blue,
                                checkmarkColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: _selectedPractice.contains(industry)
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: _selectedPractice.contains(industry)
                                        ? Colors.blue
                                        : Colors.grey.shade300,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 80,
                          height: 34,
                          child: Text(
                            'Practice',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: _practiceOptions.map((industry) {
                            return FilterChip(
                              label: Text(industry),
                              selected: _selectedPractice.contains(industry),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    // If "All" is selected, clear other selections
                                    if (industry == 'All') {
                                      _selectedPractice = ['All'];
                                    } else {
                                      // If another option is selected, remove "All"
                                      _selectedPractice.remove('All');
                                      // Add the selected industry
                                      _selectedPractice.add(industry);
                                    }
                                  } else {
                                    // Remove the industry if unselected
                                    _selectedPractice.remove(industry);
                                    // If nothing is selected, default to "All"
                                    if (_selectedPractice.isEmpty) {
                                      _selectedPractice = ['All'];
                                    }
                                  }
                                  _updateFilters();
                                });
                              },
                              backgroundColor: Colors.white,
                              selectedColor: Colors.blue,
                              checkmarkColor: Colors.white,
                              labelStyle: TextStyle(
                                color: _selectedPractice.contains(industry)
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: _selectedPractice.contains(industry)
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
            ),

            // Status filter
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: !Responsive.isMobile(context)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 80,
                          height: 34,
                          child: Text(
                            'Status',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Status checkboxes
                              Wrap(
                                spacing: 16.0,
                                children: _statusCounts.keys.map((status) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value:
                                            _selectedStatuses.contains(status),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value ?? false) {
                                              if (!_selectedStatuses
                                                  .contains(status)) {
                                                _selectedStatuses.add(status);
                                              }
                                            } else {
                                              _selectedStatuses.remove(status);
                                            }
                                            _updateFilters();
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                      ),
                                      Text(status),
                                    ],
                                  );
                                }).toList(),
                              ),

                              // Status count summary
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 16.0,
                                children: [
                                  ..._statusCounts.entries
                                      .where((entry) =>
                                          entry.value > 0 &&
                                          _selectedStatuses.contains(entry.key))
                                      .map((entry) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          entry.key,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: entry.key == 'In progress'
                                                ? Colors.blue
                                                : Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            entry.value.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 80,
                          height: 34,
                          child: Text(
                            'Status',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Status checkboxes
                            Wrap(
                              spacing: 16.0,
                              children: _statusCounts.keys.map((status) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: _selectedStatuses.contains(status),
                                      onChanged: (value) {
                                        setState(() {
                                          if (value ?? false) {
                                            if (!_selectedStatuses
                                                .contains(status)) {
                                              _selectedStatuses.add(status);
                                            }
                                          } else {
                                            _selectedStatuses.remove(status);
                                          }
                                          _updateFilters();
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      checkColor: Colors.white,
                                      activeColor: Colors.blue,
                                    ),
                                    Text(status),
                                  ],
                                );
                              }).toList(),
                            ),

                            // Status count summary
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 16.0,
                              children: [
                                ..._statusCounts.entries
                                    .where((entry) =>
                                        entry.value > 0 &&
                                        _selectedStatuses.contains(entry.key))
                                    .map((entry) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        entry.key,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: entry.key == 'In progress'
                                              ? Colors.blue
                                              : Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          entry.value.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ));
  }
}
