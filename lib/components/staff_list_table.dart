import 'package:cleansera_dashboards/components/user_info_fields.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/user.dart';

class StaffListTable extends StatefulWidget {
  final List<User> allStaffs;

  final ValueChanged<int> onItemTapped;
  final ValueChanged<String> onTitleTapped;
  final ValueChanged<User> onItemUser;

  const StaffListTable({
    super.key,
    required this.allStaffs,
    required this.onItemTapped,
    required this.onTitleTapped,
    required this.onItemUser,
  });

  @override
  State<StaffListTable> createState() => _StaffListTableState();
}

class _StaffListTableState extends State<StaffListTable> {
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  final int _maxPageButtons = 3;

  List<User> get _currentPageStaff {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    if (startIndex >= widget.allStaffs.length) {
      return [];
    }
    return widget.allStaffs.sublist(
        startIndex,
        endIndex > widget.allStaffs.length
            ? widget.allStaffs.length
            : endIndex);
  }

  int get _totalPages => (widget.allStaffs.length / _itemsPerPage).ceil();

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

  void _showUserCreateModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserInfoFields(
          user: User.empty(),
        );
      },
    );
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
                  'Staffs: ${widget.allStaffs.length}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: const Text('Create New Staff'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _showUserCreateModal(context);
                  },
                )
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
                      columnSpacing: 16,
                      headingRowColor:
                          MaterialStateProperty.all(Colors.grey[200]),
                      columns: const [
                        DataColumn(
                            label: Text('Full name',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Location',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Practice',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('User Grade',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Contract type',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('Start date',
                                style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Text('ID', style: TextStyle(fontSize: 12))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Actions',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12))))
                      ],
                      rows: _currentPageStaff
                          .map((staff) => DataRow(
                                cells: [
                                  DataCell(onTap: () {
                                    widget.onItemTapped(8);
                                    widget.onTitleTapped("User Details");
                                    widget.onItemUser(staff);
                                  },
                                      Text(staff.name,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700))),
                                  DataCell(Text(staff.location,
                                      style: const TextStyle(fontSize: 12))),
                                  DataCell(Text(staff.practice,
                                      style: const TextStyle(fontSize: 12))),
                                  DataCell(Text(staff.grade,
                                      style: const TextStyle(fontSize: 12))),
                                  DataCell(Text(staff.contract,
                                      style: const TextStyle(fontSize: 12))),
                                  DataCell(Text(
                                      staff.dateCreated
                                          .toLocal()
                                          .toString()
                                          .split(' ')[0],
                                      style: const TextStyle(fontSize: 12))),
                                  DataCell(Text(staff.id!,
                                      style: const TextStyle(fontSize: 12))),
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
                                            _showUserDetailsModal(
                                                context, staff);
                                          },
                                          icon: Icon(Icons.edit, size: 18))
                                    ],
                                  ))
                                ],
                              ))
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
