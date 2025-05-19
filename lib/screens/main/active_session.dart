import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/header.dart';
import '../../components/side_menu.dart';
import '../../constants.dart';
import '../../controllers/menu_app_controller.dart';
import '../../models/project.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../dashboard/administration.dart';
import '../dashboard/calender.dart';
import '../dashboard/chat.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/faq_section.dart';
import '../dashboard/people.dart';
import '../dashboard/reports.dart';
import '../dashboard/tasks.dart';
import '../dashboard/user_details.dart';

class ActiveSession extends StatefulWidget {
  final int pageIndex;

  const ActiveSession({super.key, this.pageIndex = 0});
  @override
  State<ActiveSession> createState() => _ActiveSessionState();
}

class _ActiveSessionState extends State<ActiveSession> {
  int _pageIndex = 0;
  String _currentTitle = "Dashboard";
  User user = User.empty();

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.pageIndex;
  }

  final List<Project> allProjects = [
    Project(
      name: 'John Doe',
      email: 'john@example.com',
      address: '123 Main St',
      city: 'Nairobi',
      region: 'East Africa',
      status: 'In Progress',
      frequency: 'Weekly',
      projectDescription: 'Interior cleaning project',
      rooms: '5',
      workers: '2',
      propertySize: '200 sqm',
      specialRequest: 'Eco-friendly products',
      additionalServices: 'Window cleaning',
      startDate: '2024-11-01',
      finishDate: '2024-12-01',
      type: 'Residential',
    ),
    Project(
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      address: '456 Elm Street',
      city: 'Kampala',
      region: 'East Africa',
      status: 'Completed',
      frequency: 'Monthly',
      projectDescription: 'Office deep cleaning',
      rooms: '10',
      workers: '4',
      propertySize: '400 sqm',
      specialRequest: 'Disinfection included',
      additionalServices: 'Carpet shampoo',
      startDate: '2024-09-15',
      finishDate: '2024-10-15',
      type: 'Commercial',
    ),
    Project(
      name: 'Ahmed Yusuf',
      email: 'ahmedy@example.com',
      address: '12 Jomo Kenyatta Rd',
      city: 'Mombasa',
      region: 'East Africa',
      status: 'Scheduled',
      frequency: 'Bi-weekly',
      projectDescription: 'Post-construction cleanup',
      rooms: '8',
      workers: '3',
      propertySize: '300 sqm',
      specialRequest: 'Dust removal focus',
      additionalServices: 'Wall washing',
      startDate: '2025-01-10',
      finishDate: '2025-01-20',
      type: 'Post-Construction',
    ),
    Project(
      name: 'Lucy Wangari',
      email: 'lucyw@example.com',
      address: '99 River View Lane',
      city: 'Nakuru',
      region: 'East Africa',
      status: 'Pending',
      frequency: 'One-time',
      projectDescription: 'Move-in cleaning',
      rooms: '4',
      workers: '2',
      propertySize: '150 sqm',
      specialRequest: 'Fragrance-free products',
      additionalServices: 'Appliance cleaning',
      startDate: '2025-03-05',
      finishDate: '2025-03-06',
      type: 'Residential',
    ),
    Project(
      name: 'Michael Otieno',
      email: 'm.otieno@example.com',
      address: '7 Sunset Blvd',
      city: 'Dar es Salaam',
      region: 'East Africa',
      status: 'In Progress',
      frequency: 'Weekly',
      projectDescription: 'Commercial building cleaning',
      rooms: '15',
      workers: '5',
      propertySize: '800 sqm',
      specialRequest: 'Night shift service',
      additionalServices: 'Trash management',
      startDate: '2025-02-01',
      finishDate: '2025-06-01',
      type: 'Commercial',
    ),
    Project(
      name: 'Fatima Hassan',
      email: 'fatima.h@example.com',
      address: '88 Palm Estate',
      city: 'Dodoma',
      region: 'East Africa',
      status: 'Completed',
      frequency: 'One-time',
      projectDescription: 'Spring cleaning',
      rooms: '6',
      workers: '3',
      propertySize: '250 sqm',
      specialRequest: 'Pet-safe supplies',
      additionalServices: 'Curtain cleaning',
      startDate: '2024-08-20',
      finishDate: '2024-08-21',
      type: 'Seasonal',
    ),
    Project(
      name: 'Brian Muthoni',
      email: 'bmuthoni@example.com',
      address: '35 Garden Ave',
      city: 'Kigali',
      region: 'East Africa',
      status: 'Scheduled',
      frequency: 'Monthly',
      projectDescription: 'Routine maintenance cleaning',
      rooms: '7',
      workers: '3',
      propertySize: '350 sqm',
      specialRequest: 'Include balcony',
      additionalServices: 'Furniture polish',
      startDate: '2025-04-10',
      finishDate: '2025-04-11',
      type: 'Residential',
    ),
  ];

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
    // Pages to display for each BottomNavigationBarItem
    final List<Widget> selectedPage = [
      DashboardScreen(
        onItemTapped: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        onTitleTapped: (String title) {
          setState(() {
            _currentTitle = title;
          });
        },
        onItemUser: (User value) {
          setState(() {
            user = value;
          });
        },
      ),
      People(
        onItemTapped: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        onTitleTapped: (String title) {
          setState(() {
            _currentTitle = title;
          });
        },
        onItemUser: (User value) {
          setState(() {
            user = value;
          });
        },
        allStaffs: _allStaff,
      ),
      Tasks(
        projects: allProjects,
        users: _allStaff,
      ),
      Calendar(
        projects: allProjects,
      ),
      Reports(),
      ChatApp(),
      Administration(),
      FAQSection(),
      UserDetails(
        user: user,
        projects: allProjects,
        users: _allStaff,
      ),
    ];

    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(
        pageIndex: _pageIndex,
        onItemTapped: (int index) {
          setState(() {
            _pageIndex = index.clamp(0, selectedPage.length - 1);
          });
        },
        onTitleTapped: (String title) {
          setState(() {
            _currentTitle = title;
          });
        },
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              SizedBox(
                width: 256,
                child: SideMenu(
                  pageIndex: _pageIndex,
                  onItemTapped: (int index) {
                    setState(() {
                      _pageIndex = index.clamp(0, selectedPage.length - 1);
                    });
                  },
                  onTitleTapped: (String title) {
                    setState(() {
                      _currentTitle = title;
                    });
                  },
                ),
              ),

            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SingleChildScrollView(
                  primary: false,
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Header(
                        title: _currentTitle,
                        onItemTapped: (int index) {
                          setState(() {
                            _pageIndex =
                                index.clamp(0, selectedPage.length - 1);
                          });
                        },
                        onTitleTapped: (String title) {
                          setState(() {
                            _currentTitle = title;
                          });
                        },
                      ),
                      SizedBox(height: defaultPadding),
                      selectedPage[_pageIndex.clamp(0, selectedPage.length - 1)]
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
