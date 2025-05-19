import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/project.dart';
import '../models/user.dart';
import 'task_details.dart';
import 'task_details_form.dart';

class ProjectListTable extends StatefulWidget {
  final List<Project> allProjects;
  final List<User> users;
  final User user;
  const ProjectListTable(
      {super.key,
      required this.allProjects,
      required this.users,
      required this.user});

  @override
  State<ProjectListTable> createState() => _ProjectListTableState();
}

class _ProjectListTableState extends State<ProjectListTable> {
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  final int _maxPageButtons = 3;

  void _showTaskDetailsModal(BuildContext context, Project project) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            child: TaskDetailsPreviewModal(
              project: project,
              users: widget.users,
            ),
          ),
        );
      },
    );
  }

  void _showEditTaskFormModal(BuildContext context, Project project) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: const EdgeInsets.all(16.0),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                child: TaskDetailsForm(
                  project: project,
                )));
      },
    );
  }

  void _showTaskFormModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            child: TaskDetailsForm(
              project: Project.empty(),
            ),
          ),
        );
      },
    );
  }

  List<Project> get _currentPageProjects {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    if (startIndex >= widget.allProjects.length) {
      return [];
    }
    return widget.allProjects.sublist(
        startIndex,
        endIndex > widget.allProjects.length
            ? widget.allProjects.length
            : endIndex);
  }

  int get _totalPages => (widget.allProjects.length / _itemsPerPage).ceil();

  // Calculate which page buttons to show
  List<int> get _visiblePageNumbers {
    if (_totalPages <= _maxPageButtons) {
      // If total pages are less than or equal to max buttons, show all pages
      return List.generate(_totalPages, (index) => index + 1);
    }

    // Calculate start and end of visible page range
    int start = _currentPage - (_maxPageButtons ~/ 2);
    int end = start + _maxPageButtons - 1;

    // Adjust if range is out of bounds
    if (start < 1) {
      start = 1;
      end = start + _maxPageButtons - 1;
    }

    if (end > _totalPages) {
      end = _totalPages;
      start = end - _maxPageButtons + 1;
      if (start < 1) start = 1;
    }

    return List.generate(end - start + 1, (index) => start + index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Found: ${widget.allProjects.length}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      label: const Text('Create Task'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        _showTaskFormModal(context);
                      },
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Export to Excel functionality would go here
                      },
                      icon: const Icon(Icons.download, color: Colors.blue),
                      label: const Text(
                        'Export to Excel',
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: DataTable(
                      headingRowColor:
                          MaterialStateProperty.all(Colors.grey[200]),
                      columns: const [
                        DataColumn(
                            label:
                                Text('Name', style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label:
                                Text('Email', style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label:
                                Text('Status', style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Frequency',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Project Description',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Workers',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Property Size',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Start Date',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Actions',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12)))),
                      ],
                      rows: _currentPageProjects
                          .map((project) => DataRow(cells: [
                                DataCell(onTap: () {
                                  _showTaskDetailsModal(context, project);
                                },
                                    Text(project.name,
                                        style: TextStyle(fontSize: 12))),
                                DataCell(Text(project.email,
                                    style: TextStyle(fontSize: 12))),
                                DataCell(Text(project.status,
                                    style: TextStyle(fontSize: 12))),
                                DataCell(Text(project.frequency,
                                    style: TextStyle(fontSize: 12))),
                                DataCell(Text(project.projectDescription,
                                    style: TextStyle(fontSize: 12))),
                                DataCell(Text(project.workers,
                                    style: TextStyle(fontSize: 12))),
                                DataCell(Text(project.propertySize,
                                    style: TextStyle(fontSize: 12))),
                                DataCell(Text(project.startDate,
                                    style: TextStyle(fontSize: 12))),
                                DataCell(Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 4,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete,
                                          size: 18,
                                          color: Colors.red,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          _showEditTaskFormModal(
                                              context, project);
                                        },
                                        icon: Icon(Icons.edit, size: 18))
                                  ],
                                )),
                              ]))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _currentPage > 1
                      ? () {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      : null,
                  tooltip: 'Previous',
                ),
                // Show first page button if not in visible range
                if (_visiblePageNumbers.isNotEmpty &&
                    _visiblePageNumbers.first > 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentPage = 1;
                        });
                      },
                      child: const Text('1'),
                    ),
                  ),
                // Show ellipsis if there's a gap between first page and visible range
                if (_visiblePageNumbers.isNotEmpty &&
                    _visiblePageNumbers.first > 2)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text('...'),
                  ),
                // Show the visible page buttons
                for (int i in _visiblePageNumbers)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor:
                            _currentPage == i ? Colors.blue : Colors.grey[200],
                        foregroundColor:
                            _currentPage == i ? Colors.white : Colors.black,
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentPage = i;
                        });
                      },
                      child: Text(i.toString()),
                    ),
                  ),
                // Show ellipsis if there's a gap between visible range and last page
                if (_visiblePageNumbers.isNotEmpty &&
                    _visiblePageNumbers.last < _totalPages - 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text('...'),
                  ),
                // Show last page button if not in visible range
                if (_visiblePageNumbers.isNotEmpty &&
                    _visiblePageNumbers.last < _totalPages)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentPage = _totalPages;
                        });
                      },
                      child: Text(_totalPages.toString()),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _currentPage < _totalPages
                      ? () {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      : null,
                  tooltip: 'Next',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
