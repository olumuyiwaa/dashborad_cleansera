import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/time_sheet_model.dart';
import '../models/user.dart';

class Timesheet extends StatefulWidget {
  final User staff;
  const Timesheet({super.key, required this.staff});

  @override
  State<Timesheet> createState() => _TimesheetState();
}

class _TimesheetState extends State<Timesheet> {
  @override
  void initState() {
    super.initState();
    entries =
        allEntries.where((entry) => entry.staffId == widget.staff.id).toList();
  }

  List<TimesheetEntry> entries = [];
  final List<TimesheetEntry> allEntries = [
    TimesheetEntry(
      staffId: '14532678978968',
      projectName: 'Interior cleaning project',
      timestamp: DateTime(2024, 11, 3, 8, 0),
      isClockIn: true,
      latitude: -1.2921,
      longitude: 36.8219,
    ),
    TimesheetEntry(
      staffId: '14532678978968',
      projectName: 'Interior cleaning project',
      timestamp: DateTime(2024, 11, 3, 17, 0),
      isClockIn: false,
      latitude: -1.2921,
      longitude: 36.8219,
    ),
    TimesheetEntry(
      staffId: '24567809876541',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 5, 9, 0),
      isClockIn: true,
      latitude: -0.3031,
      longitude: 36.0800,
    ),
    TimesheetEntry(
      staffId: '24567809876541',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 5, 15, 30),
      isClockIn: false,
      latitude: -0.3031,
      longitude: 36.0800,
    ),
    TimesheetEntry(
      staffId: '39876541987654',
      projectName: 'Spring cleaning',
      timestamp: DateTime(2024, 8, 20, 10, 0),
      isClockIn: true,
      latitude: -6.1630,
      longitude: 35.7516,
    ),
    TimesheetEntry(
      staffId: '39876541987654',
      projectName: 'Spring cleaning',
      timestamp: DateTime(2024, 8, 20, 16, 30),
      isClockIn: false,
      latitude: -6.1630,
      longitude: 35.7516,
    ),
    TimesheetEntry(
      staffId: '98765413245674',
      projectName: 'Post-construction cleanup',
      timestamp: DateTime(2025, 1, 10, 8, 30),
      isClockIn: true,
      latitude: -4.0435,
      longitude: 39.6682,
    ),
    TimesheetEntry(
      staffId: '98765413245674',
      projectName: 'Post-construction cleanup',
      timestamp: DateTime(2025, 1, 10, 17, 15),
      isClockIn: false,
      latitude: -4.0435,
      longitude: 39.6682,
    ),
    TimesheetEntry(
      staffId: '954678789905415',
      projectName: 'Office deep cleaning',
      timestamp: DateTime(2024, 9, 15, 9, 0),
      isClockIn: true,
      latitude: 0.3476,
      longitude: 32.5825,
    ),
    TimesheetEntry(
      staffId: '954678789905415',
      projectName: 'Office deep cleaning',
      timestamp: DateTime(2024, 9, 15, 18, 0),
      isClockIn: false,
      latitude: 0.3476,
      longitude: 32.5825,
    ),
    TimesheetEntry(
      staffId: '61589043881234',
      projectName: 'Commercial building cleaning',
      timestamp: DateTime(2025, 2, 2, 20, 0),
      isClockIn: true,
      latitude: -6.7924,
      longitude: 39.2083,
    ),
    TimesheetEntry(
      staffId: '61589043881234',
      projectName: 'Commercial building cleaning',
      timestamp: DateTime(2025, 2, 3, 4, 0),
      isClockIn: false,
      latitude: -6.7924,
      longitude: 39.2083,
    ),
    TimesheetEntry(
      staffId: '78912345670098',
      projectName: 'Routine maintenance cleaning',
      timestamp: DateTime(2025, 4, 10, 10, 0),
      isClockIn: true,
      latitude: -1.9536,
      longitude: 30.0605,
    ),
    TimesheetEntry(
      staffId: '78912345670098',
      projectName: 'Routine maintenance cleaning',
      timestamp: DateTime(2025, 4, 10, 16, 30),
      isClockIn: false,
      latitude: -1.9536,
      longitude: 30.0605,
    ),
    TimesheetEntry(
      staffId: '77345678909871',
      projectName: 'Interior cleaning project',
      timestamp: DateTime(2024, 11, 7, 7, 45),
      isClockIn: true,
      latitude: -1.2921,
      longitude: 36.8219,
    ),
    TimesheetEntry(
      staffId: '77345678909871',
      projectName: 'Interior cleaning project',
      timestamp: DateTime(2024, 11, 7, 16, 15),
      isClockIn: false,
      latitude: -1.2921,
      longitude: 36.8219,
    ),
    TimesheetEntry(
      staffId: '99887766554433',
      projectName: 'Post-construction cleanup',
      timestamp: DateTime(2025, 1, 12, 9, 30),
      isClockIn: true,
      latitude: -4.0435,
      longitude: 39.6682,
    ),
    TimesheetEntry(
      staffId: '99887766554433',
      projectName: 'Post-construction cleanup',
      timestamp: DateTime(2025, 1, 12, 17, 0),
      isClockIn: false,
      latitude: -4.0435,
      longitude: 39.6682,
    ),
    // User: 14532678978968 not in 'Move-in cleaning'
    TimesheetEntry(
      staffId: '14532678978968',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 6, 9, 0),
      isClockIn: true,
      latitude: -0.3031,
      longitude: 36.0800,
    ),
    TimesheetEntry(
      staffId: '14532678978968',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 6, 15, 0),
      isClockIn: false,
      latitude: -0.3031,
      longitude: 36.0800,
    ),

// User: 24567809876541 not in 'Spring cleaning'
    TimesheetEntry(
      staffId: '24567809876541',
      projectName: 'Spring cleaning',
      timestamp: DateTime(2024, 8, 21, 10, 0),
      isClockIn: true,
      latitude: -6.1630,
      longitude: 35.7516,
    ),
    TimesheetEntry(
      staffId: '24567809876541',
      projectName: 'Spring cleaning',
      timestamp: DateTime(2024, 8, 21, 17, 0),
      isClockIn: false,
      latitude: -6.1630,
      longitude: 35.7516,
    ),

// User: 39876541987654 not in 'Move-in cleaning'
    TimesheetEntry(
      staffId: '39876541987654',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 7, 8, 30),
      isClockIn: true,
      latitude: -0.3031,
      longitude: 36.0800,
    ),
    TimesheetEntry(
      staffId: '39876541987654',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 7, 14, 45),
      isClockIn: false,
      latitude: -0.3031,
      longitude: 36.0800,
    ),

// User: 98765413245674 not in 'Spring cleaning'
    TimesheetEntry(
      staffId: '98765413245674',
      projectName: 'Spring cleaning',
      timestamp: DateTime(2024, 8, 25, 9, 15),
      isClockIn: true,
      latitude: -6.1630,
      longitude: 35.7516,
    ),
    TimesheetEntry(
      staffId: '98765413245674',
      projectName: 'Spring cleaning',
      timestamp: DateTime(2024, 8, 25, 16, 45),
      isClockIn: false,
      latitude: -6.1630,
      longitude: 35.7516,
    ),

// User: 954678789905415 not in 'Routine maintenance cleaning'
    TimesheetEntry(
      staffId: '954678789905415',
      projectName: 'Routine maintenance cleaning',
      timestamp: DateTime(2025, 4, 11, 9, 0),
      isClockIn: true,
      latitude: -1.9536,
      longitude: 30.0605,
    ),
    TimesheetEntry(
      staffId: '954678789905415',
      projectName: 'Routine maintenance cleaning',
      timestamp: DateTime(2025, 4, 11, 17, 0),
      isClockIn: false,
      latitude: -1.9536,
      longitude: 30.0605,
    ),

// User: 61589043881234 not in 'Office deep cleaning'
    TimesheetEntry(
      staffId: '61589043881234',
      projectName: 'Office deep cleaning',
      timestamp: DateTime(2024, 9, 16, 8, 45),
      isClockIn: true,
      latitude: 0.3476,
      longitude: 32.5825,
    ),
    TimesheetEntry(
      staffId: '61589043881234',
      projectName: 'Office deep cleaning',
      timestamp: DateTime(2024, 9, 16, 17, 30),
      isClockIn: false,
      latitude: 0.3476,
      longitude: 32.5825,
    ),

// User: 78912345670098 not in 'Commercial building cleaning'
    TimesheetEntry(
      staffId: '78912345670098',
      projectName: 'Commercial building cleaning',
      timestamp: DateTime(2025, 2, 4, 19, 30),
      isClockIn: true,
      latitude: -6.7924,
      longitude: 39.2083,
    ),
    TimesheetEntry(
      staffId: '78912345670098',
      projectName: 'Commercial building cleaning',
      timestamp: DateTime(2025, 2, 5, 3, 30),
      isClockIn: false,
      latitude: -6.7924,
      longitude: 39.2083,
    ),

// User: 77345678909871 not in 'Routine maintenance cleaning'
    TimesheetEntry(
      staffId: '77345678909871',
      projectName: 'Routine maintenance cleaning',
      timestamp: DateTime(2025, 4, 12, 10, 15),
      isClockIn: true,
      latitude: -1.9536,
      longitude: 30.0605,
    ),
    TimesheetEntry(
      staffId: '77345678909871',
      projectName: 'Routine maintenance cleaning',
      timestamp: DateTime(2025, 4, 12, 16, 45),
      isClockIn: false,
      latitude: -1.9536,
      longitude: 30.0605,
    ),

// User: 99887766554433 not in 'Move-in cleaning'
    TimesheetEntry(
      staffId: '99887766554433',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 9, 9, 30),
      isClockIn: true,
      latitude: -0.3031,
      longitude: 36.0800,
    ),
    TimesheetEntry(
      staffId: '99887766554433',
      projectName: 'Move-in cleaning',
      timestamp: DateTime(2025, 3, 9, 15, 30),
      isClockIn: false,
      latitude: -0.3031,
      longitude: 36.0800,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('yyyy‑MM‑dd HH:mm');

    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        title: Text('${widget.staff.name} - Timesheet'),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: entries.isEmpty
              ? Text("Time Sheet Is Empty At The Moment")
              : DataTable(
                  columns: [
                    DataColumn(label: Text('Staff')),
                    DataColumn(label: Text('Project')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Timestamp')),
                    DataColumn(label: Text('Location (lat,lng)')),
                  ],
                  rows: entries.map((e) {
                    return DataRow(cells: [
                      DataCell(Text(widget.staff.name)),
                      DataCell(Text(e.projectName)),
                      DataCell(Text(e.isClockIn ? 'Clock In' : 'Clock Out')),
                      DataCell(Text(dateFmt.format(e.timestamp))),
                      DataCell(Text(
                          '${e.latitude.toStringAsFixed(4)}, ${e.longitude.toStringAsFixed(4)}')),
                    ]);
                  }).toList(),
                ),
        ));
  }
}
