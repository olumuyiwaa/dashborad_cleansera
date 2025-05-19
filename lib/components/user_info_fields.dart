import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/user.dart';
import '../responsive.dart';
import 'input_drop_down.dart';
import 'input_field.dart';

class UserInfoFields extends StatefulWidget {
  final User user;
  const UserInfoFields({super.key, required this.user});

  @override
  State<UserInfoFields> createState() => _UserInfoFieldsState();
}

class _UserInfoFieldsState extends State<UserInfoFields> {
  // Controllers scoped to the state
  final _nameController = TextEditingController();
  final _titleController = TextEditingController();
  final _contractController = TextEditingController();
  final _gradeController = TextEditingController();
  final _divisionController = TextEditingController();
  final _divisionManagerController = TextEditingController();
  final _loginController = TextEditingController();
  final _statusController = TextEditingController();
  final _dateController = TextEditingController();

  // Dropdown values
  String _selectedPractice = 'General Cleaning';
  String _selectedLocation = 'New York, NY';

  final List<String> locations = [
    'New York, NY',
    'Los Angeles, CA',
    'Houston, TX',
    'Chicago, IL',
    'San Francisco, CA',
    'Atlanta, GA',
    'Seattle, WA',
    'Detroit, MI',
    'Denver, CO',
    'Boston, MA',
    'Phoenix, AZ',
    'Orlando, FL',
    'Philadelphia, PA',
    'Portland, OR',
    'Minneapolis, MN',
  ];

  final List<String> practices = [
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
  @override
  void initState() {
    super.initState();
    _selectedPractice = widget.user.practice;
    _selectedLocation = widget.user.location;
    _nameController.text = widget.user.name;
    _titleController.text = widget.user.title;
    _contractController.text = widget.user.contract;
    _gradeController.text = widget.user.grade;
    _divisionController.text = widget.user.division;
    _divisionManagerController.text = widget.user.divisionManager;
    _loginController.text = widget.user.login;
    _statusController.text = widget.user.status;
    _dateController.text = '${widget.user.dateCreated.toLocal()}'.split(' ')[0];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    _contractController.dispose();
    _gradeController.dispose();
    _divisionController.dispose();
    _divisionManagerController.dispose();
    _loginController.dispose();
    _statusController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User Details",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                    CloseButton()
                  ],
                ),
                // Profile & Actions for desktop
                if (Responsive.isDesktop(context)) ...[
                  const Divider(),
                  const SizedBox(height: defaultPadding),
                ],
                const SizedBox(height: defaultPadding),

                // Name & Title Row
                Row(
                  children: [
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Name',
                        inputHintText: 'Enter full name',
                        textController: _nameController,
                        textObscure: false,
                        isreadOnly: false,
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Title',
                        inputHintText: 'Mr/Ms/Dr',
                        textController: _titleController,
                        textObscure: false,
                        isreadOnly: false,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: defaultPadding),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          const Text('Practice',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          InputDropDown(
                            value: _selectedPractice,
                            items: practices,
                            onChanged: (value) {
                              setState(() => _selectedPractice = value!);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          const Text('Location',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          InputDropDown(
                            value: _selectedLocation,
                            items: locations,
                            onChanged: (value) {
                              setState(() => _selectedLocation = value!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),

                Row(
                  children: [
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Contract',
                        inputHintText: 'Full-time / Part-time',
                        textController: _contractController,
                        textObscure: false,
                        isreadOnly: false,
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Grade',
                        inputHintText: 'e.g. A1, B2',
                        textController: _gradeController,
                        textObscure: false,
                        isreadOnly: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),

                // Division & Manager row
                Row(
                  children: [
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Division',
                        inputHintText: 'Division name',
                        textController: _divisionController,
                        textObscure: false,
                        isreadOnly: false,
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Division Manager',
                        inputHintText: 'Manager name',
                        textController: _divisionManagerController,
                        textObscure: false,
                        isreadOnly: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),

                // Login & Status/Date row
                Row(
                  children: [
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Login',
                        inputHintText: 'username',
                        textController: _loginController,
                        textObscure: false,
                        isreadOnly: false,
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Status',
                        inputHintText: 'Activated / Pending',
                        textController: _statusController,
                        textObscure: false,
                        isreadOnly: true,
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Inputfield(
                        inputTitle: 'Date Created',
                        inputHintText: 'DD/MM/YYYY',
                        textController: _dateController,
                        textObscure: false,
                        isreadOnly: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Submit button
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      // TODO: Save logic
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save Changes',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          )),
    );
  }

  double _fieldWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Responsive.isDesktop(context) ? width / 5 : width / 2.3;
  }

  Widget _actionIcon(IconData icon, VoidCallback onTap, {Color? color}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: Icon(icon, color: color ?? Colors.blue),
        onPressed: onTap,
      ),
    );
  }
}
