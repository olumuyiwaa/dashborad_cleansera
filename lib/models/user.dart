// models/user.dart

class User {
  final String? id;
  final String name;
  final String title; // Mr/Mrs/Ms
  final String practice; // Type of cleaning practice
  final String location;
  final String contract;
  final String grade;
  final String division;
  final String divisionManager;
  final String login;
  final String status;
  final DateTime dateCreated;
  final String? profileImageUrl;

  User({
    this.id,
    required this.name,
    required this.title,
    required this.practice,
    required this.location,
    required this.contract,
    required this.grade,
    required this.division,
    required this.divisionManager,
    required this.login,
    this.status = 'Activated',
    DateTime? dateCreated,
    this.profileImageUrl,
  }) : dateCreated = dateCreated ?? DateTime.now();

  // Create a User from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      practice: json['practice'],
      location: json['location'],
      contract: json['contract'],
      grade: json['grade'],
      division: json['division'],
      divisionManager: json['divisionManager'],
      login: json['login'],
      status: json['status'] ?? 'Activated',
      dateCreated: json['dateCreated'] != null
          ? DateTime.parse(json['dateCreated'])
          : DateTime.now(),
      profileImageUrl: json['profileImageUrl'],
    );
  }

  factory User.empty() {
    return User(
      id: '',
      name: '',
      title: '',
      practice: 'Commercial Cleaning',
      location: 'New York, NY',
      contract: '',
      grade: '',
      division: '',
      divisionManager: '',
      login: '',
      status: 'Activated',
      dateCreated: DateTime.now(),
      profileImageUrl: '',
    );
  }
}
