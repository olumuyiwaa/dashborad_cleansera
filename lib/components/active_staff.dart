import 'package:flutter/material.dart';

class ActivePeopleWidget extends StatelessWidget {
  const ActivePeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          _buildPracticesTable(),
          const SizedBox(height: 12),
          _buildTotals(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'List of active people',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              // Export to Excel functionality would go here
            },
            icon: const Icon(Icons.download, color: Colors.blue),
            label: const Text(
              'Export to Excel',
              style: TextStyle(color: Colors.blue),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticesTable() {
    // Practice headers
    final practices = [
      'General Cleaning',
      'Interior Cleaning',
      'Exterior Cleaning',
      'Specialised Cleaning',
      'Support'
    ];

    // Practice counts
    final counts = [233, 11, 1, 8, 8];

    return Column(
      children: [
        // Table Header - Practices
        Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  'Practices:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              ...List.generate(
                practices.length,
                (index) => Expanded(
                  child: Text(
                    practices[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Table Values - Counts
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          color: Colors.grey[100],
          child: Row(
            children: [
              const SizedBox(width: 120),
              ...List.generate(
                counts.length,
                (index) => Expanded(
                  child: Text(
                    counts[index].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTotals() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Staff',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '581',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 24),
          const Text(
            'Non-Staff',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '8',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 24),
          const Text(
            'Total:',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '589',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
