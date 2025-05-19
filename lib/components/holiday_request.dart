import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/holiday.dart';
import '../models/user.dart';

class HolidaySheet extends StatefulWidget {
  final User staff;
  const HolidaySheet({super.key, required this.staff});

  @override
  State<HolidaySheet> createState() => _HolidaySheetState();
}

class _HolidaySheetState extends State<HolidaySheet> {
  @override
  void initState() {
    super.initState();
    entries =
        allEntries.where((entry) => entry.staffId == widget.staff.id).toList();
  }

  List<HolidayRequest> entries = [];
  final List<HolidayRequest> allEntries = [
    HolidayRequest(
      id: 'hr001',
      staffId: '14532678978968',
      startDate: DateTime(2025, 6, 10),
      endDate: DateTime(2025, 6, 14),
      reason: 'Family vacation',
      status: 'Pending',
      reviewedAt: null,
    ),
    HolidayRequest(
      id: 'hr002',
      staffId: '24567809876541',
      startDate: DateTime(2025, 7, 5),
      endDate: DateTime(2025, 7, 9),
      reason: 'Medical appointment',
      status: 'Approved',
      reviewedAt: DateTime(2025, 5, 18),
    ),
    HolidayRequest(
      id: 'hr003',
      staffId: '39876541987654',
      startDate: DateTime(2025, 5, 20),
      endDate: DateTime(2025, 5, 22),
      reason: 'Personal reasons',
      status: 'Rejected',
      reviewedAt: DateTime(2025, 5, 19),
    ),
    HolidayRequest(
      id: 'hr004',
      staffId: '98765413245674',
      startDate: DateTime(2025, 6, 1),
      endDate: DateTime(2025, 6, 3),
      reason: 'Attending a wedding',
      status: 'Pending',
      reviewedAt: null,
    ),
    HolidayRequest(
      id: 'hr005',
      staffId: '954678789905415',
      startDate: DateTime(2025, 6, 15),
      endDate: DateTime(2025, 6, 20),
      reason: 'Travel abroad',
      status: 'Pending',
      reviewedAt: null,
    ),
    HolidayRequest(
      id: 'hr006',
      staffId: '61589043881234',
      startDate: DateTime(2025, 7, 1),
      endDate: DateTime(2025, 7, 10),
      reason: 'Annual leave',
      status: 'Approved',
      reviewedAt: DateTime(2025, 5, 17),
    ),
    HolidayRequest(
      id: 'hr007',
      staffId: '78912345670098',
      startDate: DateTime(2025, 6, 25),
      endDate: DateTime(2025, 6, 28),
      reason: 'Family reunion',
      status: 'Pending',
      reviewedAt: null,
    ),
    HolidayRequest(
      id: 'hr008',
      staffId: '80245678900983',
      startDate: DateTime(2025, 6, 12),
      endDate: DateTime(2025, 6, 16),
      reason: 'Health recovery',
      status: 'Approved',
      reviewedAt: DateTime(2025, 5, 18),
    ),
    HolidayRequest(
      id: 'hr009',
      staffId: '12938475647653',
      startDate: DateTime(2025, 5, 21),
      endDate: DateTime(2025, 5, 23),
      reason: 'Research conference',
      status: 'Rejected',
      reviewedAt: DateTime(2025, 5, 18),
    ),
    HolidayRequest(
      id: 'hr010',
      staffId: '77345678909871',
      startDate: DateTime(2025, 6, 3),
      endDate: DateTime(2025, 6, 7),
      reason: 'Visiting family',
      status: 'Pending',
      reviewedAt: null,
    ),
    HolidayRequest(
      id: 'hr011',
      staffId: '45218798745622',
      startDate: DateTime(2025, 6, 18),
      endDate: DateTime(2025, 6, 20),
      reason: 'Religious holiday',
      status: 'Pending',
      reviewedAt: null,
    ),
    HolidayRequest(
      id: 'hr012',
      staffId: '99887766554433',
      startDate: DateTime(2025, 7, 5),
      endDate: DateTime(2025, 7, 12),
      reason: 'Vacation abroad',
      status: 'Approved',
      reviewedAt: DateTime(2025, 5, 18),
    ),
    HolidayRequest(
      id: 'hr013',
      staffId: '33445566778899',
      startDate: DateTime(2025, 6, 10),
      endDate: DateTime(2025, 6, 14),
      reason: 'Exam preparation',
      status: 'Pending',
      reviewedAt: null,
    ),
    HolidayRequest(
      id: 'hr014',
      staffId: '44556677889900',
      startDate: DateTime(2025, 6, 19),
      endDate: DateTime(2025, 6, 22),
      reason: 'Family emergency',
      status: 'Approved',
      reviewedAt: DateTime(2025, 5, 18),
    ),
    HolidayRequest(
      id: 'hr015',
      staffId: '12312312312312',
      startDate: DateTime(2025, 6, 8),
      endDate: DateTime(2025, 6, 11),
      reason: 'Cultural festival',
      status: 'Pending',
      reviewedAt: null,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('yyyy‑MM‑dd');

    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        title: Text('${widget.staff.name} - HolidaySheet'),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: entries.isEmpty
              ? Text("No Holiday Request At The Moment")
              : DataTable(
                  columns: [
                    DataColumn(label: Text('Staff')),
                    DataColumn(label: Text('Reason')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('ReviewedAt')),
                    DataColumn(label: Text('Duration (Start to End)')),
                    DataColumn(
                        label: Expanded(
                            child: Text('Actions',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12)))),
                  ],
                  rows: entries.map((e) {
                    return DataRow(cells: [
                      DataCell(Text(widget.staff.name)),
                      DataCell(Text(e.reason)),
                      DataCell(Text(e.status)),
                      DataCell(Text(e.reviewedAt != null
                          ? dateFmt.format(e.reviewedAt!)
                          : "Not Reviewed")),
                      DataCell(Text(
                          '${dateFmt.format(e.startDate)} to ${dateFmt.format(e.endDate)}')),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                size: 18,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_circle,
                                size: 18,
                                color: Colors.green,
                              ))
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
        ));
  }
}
