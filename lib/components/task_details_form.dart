import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/project.dart';
import 'input_drop_down.dart';
import 'input_field.dart';

class TaskDetailsForm extends StatefulWidget {
  final Project project;
  const TaskDetailsForm({Key? key, required this.project}) : super(key: key);

  @override
  State<TaskDetailsForm> createState() => _TaskDetailsFormState();
}

class _TaskDetailsFormState extends State<TaskDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Checkboxes
  bool _carpetCleaning = true;
  bool _windowCleaning = true;
  bool _refrigeratorCleaning = false;
  bool _ovenCleaning = false;
  bool _laundryService = false;
  String frequency = "Daily";
  List<String> frequencies = [
    'One-Time',
    'Daily',
    'Weekly',
    'Bi-Weekly',
    'Monthly',
    'Every 6 Months',
    'Yearly'
  ];
  String timeOfDay = "Morning";
  List<String> timesOfDay = ['Morning', 'Afternoon', 'Evening'];
  String billingOption = "One-Time";
  List<String> billingOptions = [
    "One-Time",
    "Hourly",
    "Daily",
    "Weekly",
    "Bi-Weekly",
    "Monthly",
    "Per Square Foot",
    "Per Room",
    "Subscription (Flat Rate)",
    "Contract-Based",
    "Per Visit",
    "Custom Quote"
  ];

  String status = "In Progress";
  List<String> Statuses = [
    'In Progress',
    'Upcoming',
    'Suspended',
    'Completed',
    'Anticipated'
  ];
  String practice = "Residential";

  List<String> practices = [
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
  String propertyType = "Apartment";
  List<String> propertyTypes = [
    "Apartment",
    "House",
    "Office",
    "Commercial Building",
    "Retail Store",
    "Warehouse",
    "School",
    "Hospital",
    "Hotel",
    "Restaurant",
    "Industrial Facility",
    "Gym/Fitness Center",
    "Event Venue",
    "Church/Mosque",
    "Construction Site",
    "Daycare/Preschool",
    "Clinic/Medical Office",
    "Salon/Barbershop",
    "Bank/Financial Institution"
  ];

  // Text controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _propertySizeController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();
  final TextEditingController _workersController = TextEditingController();
  final TextEditingController _projectDescriptionController =
      TextEditingController();
  final TextEditingController _specialRequestController =
      TextEditingController();

  // Date controllers
  DateTime? _startDate;
  DateTime? _finishDate;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.project.name;
    _emailController.text = widget.project.email;
    _cityController.text = widget.project.city;
    _regionController.text = widget.project.region;
    _addressController.text = widget.project.address;
    _propertySizeController.text = widget.project.propertySize;
    _roomsController.text = widget.project.rooms;
    _workersController.text = widget.project.workers;
    _projectDescriptionController.text = widget.project.projectDescription;
    _specialRequestController.text = widget.project.specialRequest;
    frequency = widget.project.frequency;
    status = widget.project.status;
    practice = widget.project.type;
    // _dateController.text = '${widget.user.dateCreated.toLocal()}'.split(' ')[0];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _addressController.dispose();
    _propertySizeController.dispose();
    _roomsController.dispose();
    _workersController.dispose();
    _projectDescriptionController.dispose();
    _specialRequestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Task Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // First row - Name, Address, City
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Inputfield(
                              inputHintText: 'John Doe',
                              inputTitle: 'Name',
                              textObscure: false,
                              textController: _nameController,
                              isreadOnly: false,
                            ),
                            const SizedBox(height: 6),
                            Inputfield(
                              inputHintText: 'username@server.com',
                              inputTitle: 'Email Address',
                              textObscure: false,
                              textController: _emailController,
                              isreadOnly: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              'Full Address',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color:
                                        Colors.grey, // Change color as needed
                                    width: 2, // Border width
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .blue, // Change color when focused
                                    width: 2,
                                  ),
                                ),
                              ),
                              maxLines: 5,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Inputfield(
                              inputHintText: 'City',
                              inputTitle: 'City',
                              textObscure: false,
                              textController: _cityController,
                              isreadOnly: false,
                            ),
                            const SizedBox(height: 6),
                            Inputfield(
                              inputHintText: 'State/Region',
                              inputTitle: 'State/Region',
                              textObscure: false,
                              textController: _regionController,
                              isreadOnly: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Status',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 8),
                                        InputDropDown(
                                          value: status,
                                          items: Statuses,
                                          onChanged: (value) {
                                            if (value != null) {
                                              setState(() {
                                                status = value;
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Preferred time of day',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 8),
                                        InputDropDown(
                                          value: timeOfDay,
                                          items: timesOfDay,
                                          onChanged: (value) {
                                            if (value != null) {
                                              setState(() {
                                                timeOfDay = value;
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Practice(Request Type)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 8),
                                        InputDropDown(
                                          value: practice,
                                          items: practices,
                                          onChanged: (value) {
                                            if (value != null) {
                                              setState(() {
                                                practice = value;
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Type Of Property',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 8),
                                        InputDropDown(
                                          value: propertyType,
                                          items: propertyTypes,
                                          onChanged: (value) {
                                            if (value != null) {
                                              setState(() {
                                                propertyType = value;
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              'Project description',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: _projectDescriptionController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color:
                                        Colors.grey, // Change color as needed
                                    width: 2, // Border width
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .blue, // Change color when focused
                                    width: 2,
                                  ),
                                ),
                              ),
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Inputfield(
                              inputHintText: 'Number Of Rooms/offices',
                              inputTitle: 'Number Of Rooms/offices',
                              textObscure: false,
                              textController: _cityController,
                              isreadOnly: false,
                            ),
                            const SizedBox(height: 6),
                            Inputfield(
                              inputHintText: 'Number of workers needed',
                              inputTitle: 'Number of workers needed',
                              textObscure: false,
                              textController: _regionController,
                              isreadOnly: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Fifth row - Billing, Size, Frequency, Start date, Finish date
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              'Billing Option',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            InputDropDown(
                              value: billingOption,
                              items: billingOptions,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    billingOption = value;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Inputfield(
                          inputHintText: 'sq.ft',
                          inputTitle: 'Size of property(if Known) sq.ft',
                          textObscure: false,
                          textController: _regionController,
                          isreadOnly: false,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              'Frequency of Service',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            InputDropDown(
                              value: frequency,
                              items: frequencies,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    frequency = value;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              'Start date from:',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            _buildDatePicker(
                              context: context,
                              onTap: () =>
                                  _selectDate(context, isStartDate: true),
                              text: _startDate == null
                                  ? 'Select'
                                  : DateFormat('MM/dd/yyyy')
                                      .format(_startDate!),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              'Finish date from:',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            _buildDatePicker(
                              context: context,
                              onTap: () =>
                                  _selectDate(context, isStartDate: false),
                              text: _finishDate == null
                                  ? 'Select'
                                  : DateFormat('MM/dd/yyyy')
                                      .format(_finishDate!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Additional Services section
                  const Text(
                    'Additional Services:',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildCheckbox('Carpet Cleaning', _carpetCleaning,
                          (value) {
                        setState(() {
                          _carpetCleaning = value!;
                        });
                      }),
                      const SizedBox(width: 10),
                      _buildCheckbox('Window Cleaning', _windowCleaning,
                          (value) {
                        setState(() {
                          _windowCleaning = value!;
                        });
                      }),
                      const SizedBox(width: 10),
                      _buildCheckbox(
                          'Refrigerator Cleaning', _refrigeratorCleaning,
                          (value) {
                        setState(() {
                          _refrigeratorCleaning = value!;
                        });
                      }),
                      const SizedBox(width: 10),
                      _buildCheckbox('Oven Cleaning', _ovenCleaning, (value) {
                        setState(() {
                          _ovenCleaning = value!;
                        });
                      }),
                      const SizedBox(width: 10),
                      _buildCheckbox('Laundry Service', _laundryService,
                          (value) {
                        setState(() {
                          _laundryService = value!;
                        });
                      }),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Special Requests and Image sections
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Special Request or Instructions',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: EdgeInsets.all(8.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey, // Change color as needed
                                      width: 2, // Border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .blue, // Change color when focused
                                      width: 2,
                                    ),
                                  )),
                              maxLines: 8,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Attach Image:'),
                            const SizedBox(height: 10),
                            Container(
                              height: 180,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: GestureDetector(
                                        onTap: _pickImage,
                                        child: Icon(
                                          Icons.image,
                                          size: 120,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: _pickImage,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Submit buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Clear form logic
                          _nameController.clear();
                          _emailController.clear();
                          _addressController.clear();
                          _propertySizeController.clear();
                          _roomsController.clear();
                          _workersController.clear();
                          _projectDescriptionController.clear();
                          _specialRequestController.clear();
                          setState(() {
                            _startDate = null;
                            _finishDate = null;
                            _carpetCleaning = false;
                            _windowCleaning = false;
                            _refrigeratorCleaning = false;
                            _ovenCleaning = false;
                            _laundryService = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        child: const Text('Clear'),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          // Submit form logic
                          if (_formKey.currentState!.validate()) {
                            // Process data
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.of(context).pop(); // Close the modal
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // Helper method to build date pickers
  Widget _buildDatePicker({
    required BuildContext context,
    required VoidCallback onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(Icons.calendar_today, size: 20),
          ],
        ),
      ),
    );
  }

  // Helper method to build checkboxes
  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            activeColor: Colors.blue,
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  // Date picker method
  Future<void> _selectDate(BuildContext context,
      {required bool isStartDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _finishDate = picked;
        }
      });
    }
  }

  // Example of a file/image picker implementation
  Future<void> _pickImage() async {
    // Implement file picking logic here
    // You would typically use packages like image_picker or file_picker
    // For now, just show a placeholder message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Image picker not implemented in this example')),
    );
  }
}
