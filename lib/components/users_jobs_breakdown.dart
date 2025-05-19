import 'package:flutter/material.dart';

import '../constants.dart';
import 'chart.dart';

class UsersJobsBreakdown extends StatelessWidget {
  const UsersJobsBreakdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            "Users/Jobs Breakdown",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          SizedBox(height: defaultPadding),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3361FF).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "475",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                      Text(
                        "Registered Workers",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3361FF).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "12 456",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                      Text(
                        "Registered Jobs",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3361FF).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "120",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                      Text(
                        "Active Workers",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3361FF).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "42",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                      Text(
                        "Active Jobs",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
