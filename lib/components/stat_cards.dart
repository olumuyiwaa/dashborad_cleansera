import 'package:flutter/material.dart';

import '../constants.dart';

class StatCards extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final ValueChanged<String> onTitleTapped;
  const StatCards(
      {super.key, required this.onItemTapped, required this.onTitleTapped});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: .89,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        StatCard(
          title: 'Workers',
          value: '475',
          color: Colors.green,
          onTap: () {
            onItemTapped(1);
            onTitleTapped("People");
          }, // implement action
        ),
        StatCard(
          title: 'Jobs',
          value: '12 456',
          color: Colors.deepPurple,
          onTap: () {
            onItemTapped(2);
            onTitleTapped("Task");
          },
        ),
        StatCard(
          title: 'Reoccurring Jobs',
          value: '21',
          color: Colors.deepOrange,
          onTap: () {
            onItemTapped(2);
            onTitleTapped("Task");
          },
        ),
        StatCard(
          title: 'Active Jobs',
          value: '42',
          color: Colors.lightBlue,
          onTap: () {
            onItemTapped(2);
            onTitleTapped("Task");
          },
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(value,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ))
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text("View All"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
