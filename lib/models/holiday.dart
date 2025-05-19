class HolidayRequest {
  final String id;
  final String staffId;
  final DateTime startDate;
  final DateTime endDate;
  final String reason;
  final String status;
  final DateTime? reviewedAt;

  HolidayRequest({
    required this.id,
    required this.staffId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.status,
    this.reviewedAt,
  });
}
