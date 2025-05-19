class TimesheetEntry {
  final String staffId;
  final String projectName;
  final DateTime timestamp;
  final bool isClockIn;
  final double latitude;
  final double longitude;

  TimesheetEntry({
    required this.staffId,
    required this.projectName,
    required this.timestamp,
    required this.isClockIn,
    required this.latitude,
    required this.longitude,
  });
}
