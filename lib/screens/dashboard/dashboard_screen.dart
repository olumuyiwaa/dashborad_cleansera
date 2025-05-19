import 'package:flutter/material.dart';

import '../../components/analytics_dashboards.dart';
import '../../components/staff_list_table.dart';
import '../../components/stat_cards.dart';
import '../../components/users_jobs_breakdown.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';

class DashboardScreen extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  final ValueChanged<String> onTitleTapped;
  final ValueChanged<User> onItemUser;

  DashboardScreen({
    super.key,
    required this.onItemTapped,
    required this.onTitleTapped,
    required this.onItemUser, // Make sure to pass the callback from the parent
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<User> _allStaff = [
    User(
      id: '14532678978968',
      name: 'Alice Johnson',
      title: 'Ms',
      practice: 'Commercial Cleaning',
      location: 'New York, NY',
      contract: 'Full-time',
      grade: 'A1',
      division: 'East Coast',
      divisionManager: 'Robert Smith',
      login: 'alice.johnson',
      status: 'Activated',
      dateCreated: DateTime(2022, 5, 3),
      profileImageUrl: 'https://i.pravatar.cc/150?img=1',
    ),
    User(
      id: '24567809876541',
      name: 'Brian Lee',
      title: 'Mr',
      practice: 'Residential Cleaning',
      location: 'Los Angeles, CA',
      contract: 'Part-time',
      grade: 'B2',
      division: 'West Coast',
      divisionManager: 'Susan Davis',
      login: 'brian.lee',
      status: 'Pending',
      dateCreated: DateTime(2023, 1, 12),
      profileImageUrl: 'https://i.pravatar.cc/150?img=2',
    ),
    User(
      id: '39876541987654',
      name: 'Clara Mendes',
      title: 'Mrs',
      practice: 'Industrial Cleaning',
      location: 'Houston, TX',
      contract: 'Contract',
      grade: 'C3',
      division: 'South Division',
      divisionManager: 'David Brown',
      login: 'clara.mendes',
      status: 'Deactivated',
      dateCreated: DateTime(2021, 9, 27),
      profileImageUrl: 'https://i.pravatar.cc/150?img=3',
    ),
    User(
      id: '98765413245674',
      name: 'Daniel Osei',
      title: 'Mr',
      practice: 'Deep Cleaning',
      location: 'Chicago, IL',
      contract: 'Full-time',
      grade: 'A2',
      division: 'Midwest',
      divisionManager: 'Linda Thompson',
      login: 'daniel.osei',
      status: 'Activated',
      dateCreated: DateTime(2023, 4, 15),
      profileImageUrl: 'https://i.pravatar.cc/150?img=4',
    ),
    User(
      id: '954678789905415',
      name: 'Emily Zhang',
      title: 'Ms',
      practice: 'Event Cleaning',
      location: 'San Francisco, CA',
      contract: 'Intern',
      grade: 'Intern',
      division: 'West Coast',
      divisionManager: 'Susan Davis',
      login: 'emily.zhang',
      status: 'Activated',
      dateCreated: DateTime(2024, 2, 1),
      profileImageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    User(
      id: '61589043881234',
      name: 'Franklin Musa',
      title: 'Mr',
      practice: 'Post-Construction Cleaning',
      location: 'Atlanta, GA',
      contract: 'Full-time',
      grade: 'B1',
      division: 'South Division',
      divisionManager: 'David Brown',
      login: 'franklin.musa',
      status: 'Activated',
      dateCreated: DateTime(2022, 11, 5),
      profileImageUrl: 'https://i.pravatar.cc/150?img=6',
    ),
    User(
      id: '78912345670098',
      name: 'Grace Njeri',
      title: 'Ms',
      practice: 'Green Cleaning',
      location: 'Seattle, WA',
      contract: 'Part-time',
      grade: 'B3',
      division: 'Northwest',
      divisionManager: 'Tom Greene',
      login: 'grace.njeri',
      status: 'Activated',
      dateCreated: DateTime(2023, 8, 20),
      profileImageUrl: 'https://i.pravatar.cc/150?img=7',
    ),
    User(
      id: '80245678900983',
      name: 'Hassan Saleh',
      title: 'Mr',
      practice: 'Medical Facility Cleaning',
      location: 'Detroit, MI',
      contract: 'Full-time',
      grade: 'A3',
      division: 'Midwest',
      divisionManager: 'Linda Thompson',
      login: 'hassan.saleh',
      status: 'Pending',
      dateCreated: DateTime(2024, 3, 10),
      profileImageUrl: 'https://i.pravatar.cc/150?img=8',
    ),
    User(
      id: '12938475647653',
      name: 'Ivy Thomas',
      title: 'Dr',
      practice: 'Hazardous Waste Cleanup',
      location: 'Denver, CO',
      contract: 'Contract',
      grade: 'C1',
      division: 'Mountain',
      divisionManager: 'Patricia West',
      login: 'ivy.thomas',
      status: 'Deactivated',
      dateCreated: DateTime(2021, 6, 8),
      profileImageUrl: 'https://i.pravatar.cc/150?img=9',
    ),
    User(
      id: '77345678909871',
      name: 'James Korir',
      title: 'Mr',
      practice: 'Janitorial Services',
      location: 'Boston, MA',
      contract: 'Full-time',
      grade: 'A1',
      division: 'Northeast',
      divisionManager: 'Robert Smith',
      login: 'james.korir',
      status: 'Activated',
      dateCreated: DateTime(2022, 9, 30),
      profileImageUrl: 'https://i.pravatar.cc/150?img=10',
    ),
    User(
      id: '45218798745622',
      name: 'Khadija Abdi',
      title: 'Mrs',
      practice: 'Window Cleaning',
      location: 'Phoenix, AZ',
      contract: 'Part-time',
      grade: 'B2',
      division: 'Southwest',
      divisionManager: 'Helen Woods',
      login: 'khadija.abdi',
      status: 'Pending',
      dateCreated: DateTime(2023, 5, 18),
      profileImageUrl: 'https://i.pravatar.cc/150?img=11',
    ),
    User(
      id: '99887766554433',
      name: 'Liam Walker',
      title: 'Mr',
      practice: 'Hotel Cleaning',
      location: 'Orlando, FL',
      contract: 'Full-time',
      grade: 'A2',
      division: 'Southeast',
      divisionManager: 'Angela Moore',
      login: 'liam.walker',
      status: 'Activated',
      dateCreated: DateTime(2024, 1, 25),
      profileImageUrl: 'https://i.pravatar.cc/150?img=12',
    ),
    User(
      id: '33445566778899',
      name: 'Miriam Osakwe',
      title: 'Ms',
      practice: 'Office Cleaning',
      location: 'Philadelphia, PA',
      contract: 'Contract',
      grade: 'C2',
      division: 'Northeast',
      divisionManager: 'Robert Smith',
      login: 'miriam.osakwe',
      status: 'Activated',
      dateCreated: DateTime(2023, 7, 2),
      profileImageUrl: 'https://i.pravatar.cc/150?img=13',
    ),
    User(
      id: '44556677889900',
      name: 'Nathan Kim',
      title: 'Mr',
      practice: 'Commercial Cleaning',
      location: 'Portland, OR',
      contract: 'Intern',
      grade: 'Intern',
      division: 'Northwest',
      divisionManager: 'Tom Greene',
      login: 'nathan.kim',
      status: 'Pending',
      dateCreated: DateTime(2024, 4, 1),
      profileImageUrl: 'https://i.pravatar.cc/150?img=14',
    ),
    User(
      id: '12312312312312',
      name: 'Olivia Chen',
      title: 'Dr',
      practice: 'School Cleaning',
      location: 'Minneapolis, MN',
      contract: 'Full-time',
      grade: 'A1',
      division: 'Midwest',
      divisionManager: 'Linda Thompson',
      login: 'olivia.chen',
      status: 'Activated',
      dateCreated: DateTime(2022, 12, 11),
      profileImageUrl: 'https://i.pravatar.cc/150?img=15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnalyticsDashboard(),
                SizedBox(height: defaultPadding),
                SizedBox(
                    height: 692,
                    child: StaffListTable(
                      allStaffs: _allStaff,
                      onItemTapped: (int index) {
                        widget.onItemTapped(index);
                      },
                      onTitleTapped: (String title) {
                        widget.onTitleTapped(title);
                      },
                      onItemUser: (User value) {
                        widget.onItemUser(value);
                      },
                    )),
                if (Responsive.isMobile(context))
                  SizedBox(height: defaultPadding),
                if (Responsive.isMobile(context))
                  StatCards(
                    onItemTapped: (int index) {
                      widget.onItemTapped(index);
                    },
                    onTitleTapped: (String title) {
                      widget.onTitleTapped(title);
                    },
                  ),
                if (Responsive.isMobile(context))
                  SizedBox(height: defaultPadding),
                if (Responsive.isMobile(context)) UsersJobsBreakdown(),
              ],
            ),
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        // On Mobile means if the screen is less than 850 we don't want to show it
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: Column(
              children: [
                StatCards(
                  onItemTapped: (int index) {
                    widget.onItemTapped(index);
                  },
                  onTitleTapped: (String title) {
                    widget.onTitleTapped(title);
                  },
                ),
                UsersJobsBreakdown()
              ],
            ),
          ),
      ],
    ));
  }
}
