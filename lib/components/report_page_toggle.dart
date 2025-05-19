import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportPageToggleWidget extends StatefulWidget {
  final Function(int) onPageChanged;
  final int initialPage;

  const ReportPageToggleWidget({
    super.key,
    required this.onPageChanged,
    this.initialPage = 0,
  });

  @override
  State<ReportPageToggleWidget> createState() => _PageToggleWidgetState();
}

class _PageToggleWidgetState extends State<ReportPageToggleWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialPage;
  }

  // Page options with their icons and labels
  final List<Map<String, dynamic>> _pageOptions = [
    {
      'icon': "assets/icons/reports.svg",
      'label': 'User - Tasks',
    },
    {
      'icon': "assets/icons/people.svg",
      'label': 'User by role',
    },
    {
      'icon': "assets/icons/administration.svg",
      'label': 'Bookeeping report',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        _pageOptions.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildPageButton(index),
        ),
      ),
    );
  }

  Widget _buildPageButton(int index) {
    final option = _pageOptions[index];
    final bool isSelected = _selectedIndex == index;
    final bool isBlueBackground = option['backgroundColor'] != null;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onPageChanged(index);
      },
      child: Container(
        height: 164,
        width: 240,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              option['icon'],
              height: 32,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              option['label'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
