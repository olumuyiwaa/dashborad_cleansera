import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // Branches filter data
  final Map<String, FilterItem> branches = {
    'London': FilterItem(label: 'London', count: 111, isSelected: true),
    'Liverpool': FilterItem(label: 'Liverpool', count: 12, isSelected: true),
    'Paris': FilterItem(label: 'Paris', count: 5, isSelected: true),
    'Leeds': FilterItem(label: 'Leeds', count: 3, isSelected: true),
    'Cardiff': FilterItem(label: 'Cardiff', count: 1, isSelected: false),
  };

  // Practice filter data
  final Map<String, FilterItem> practices = {
    'Interior Cleaning':
        FilterItem(label: 'Interior Cleaning', count: 43, isSelected: true),
    'General Cleaning':
        FilterItem(label: 'General Cleaning', count: 29, isSelected: true),
    'Exterior Cleaning':
        FilterItem(label: 'Exterior Cleaning', count: 12, isSelected: true),
    'Specialised Cleaning':
        FilterItem(label: 'Specialised Cleaning', count: 29, isSelected: true),
    'Support': FilterItem(label: 'Support', count: 2, isSelected: false),
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: 248,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Filter Title
            const Text(
              'Filter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Branches Section
            _buildFilterSection('Branches', branches),
            const SizedBox(height: 16),

            // Practice Section
            _buildFilterSection('Practice', practices),
            const SizedBox(height: 24),

            // Clear Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _clearAllFilters,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Colors.grey[400]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Clear',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, Map<String, FilterItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ...items.entries.map((entry) {
          return _buildCheckboxItem(
            entry.value,
            (bool? value) {
              setState(() {
                items[entry.key]!.isSelected = value ?? false;
              });
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildCheckboxItem(FilterItem item, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: item.isSelected,
              onChanged: onChanged,
              activeColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${item.label} (${item.count})',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clearAllFilters() {
    setState(() {
      for (var item in branches.values) {
        item.isSelected = false;
      }
      for (var item in practices.values) {
        item.isSelected = false;
      }
    });
  }
}

// Model to store filter item data
class FilterItem {
  final String label;
  final int count;
  bool isSelected;

  FilterItem({
    required this.label,
    required this.count,
    this.isSelected = false,
  });
}
