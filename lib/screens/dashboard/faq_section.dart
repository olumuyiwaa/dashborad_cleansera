import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../responsive.dart';

class FAQSection extends StatelessWidget {
  FAQSection({super.key});
  final List<Map<String, String>> faqList = [
    {
      'question': 'What is Cleansera?',
      'answer':
          'Cleansera is a cutting-edge software solution designed for cleaning businesses to streamline their operations. It provides tools for scheduling, invoicing, employee management, and customer communication, helping businesses save time and grow efficiently.',
    },
    {
      'question': 'How Cleansera improve my operations?',
      'answer':
          'Cleansera automates repetitive tasks like appointment scheduling, invoicing, and payroll management. It also offers real-time updates, customer feedback integration, and analytics to optimize your business processes and enhance client satisfaction.',
    },
    {
      'question': 'Suitability for small cleaning businesses?',
      'answer':
          'Absolutely! Cleansera is designed to be scalable, making it perfect for businesses of all sizes. Small cleaning businesses can benefit from its easy-to-use interface, cost-effective plans, and tools to manage clients and staff seamlessly.',
    },
    {
      'question': 'Is my data safe on Cleansera?',
      'answer':
          'Yes, Cleansera takes data security very seriously. We use state-of-the-art encryption and secure cloud servers to ensure that your business and customer data are protected at all times.',
    },
  ];

  // Helper method to launch URLs
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $urlString');
    }
  }

  Widget _buildFAQCard({
    required String question,
    required String answer,
  }) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset(
            "assets/icons/help.svg",
            color: Colors.white,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              answer,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ))
      ],
    );
  }

  // Contact section widget
  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Haven\'t got your answer? Contact our support now',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Call us',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    icon: Icons.phone,
                    text: '+1-940-394-2948',
                    onTap: () => _launchUrl('tel:+19403942948'),
                  ),
                  _buildContactItem(
                    icon: Icons.phone,
                    text: '+1-389-385-3807',
                    onTap: () => _launchUrl('tel:+13893853807'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email us',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    icon: Icons.email,
                    text: 'support@cleansera.io',
                    onTap: () => _launchUrl('mailto:support@cleansera.io'),
                  ),
                  _buildContactItem(
                    icon: Icons.email,
                    text: 'contact@cleansera.io',
                    onTap: () => _launchUrl('mailto:contact@cleansera.io'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Visit us',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        _buildContactItem(
          icon: Icons.location_on,
          text: '34 Madison Street, NY, USA 10005',
          onTap: () => _launchUrl(
              'https://maps.google.com/?q=34+Madison+Street,+NY,+USA+10005'),
        ),
      ],
    );
  }

  // Reusable contact item widget
  Widget _buildContactItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: faqList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isDesktop(context) ? 2 : 1,
              crossAxisSpacing: 64,
              mainAxisSpacing: 16,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              final faq = faqList[index];
              return _buildFAQCard(
                question: faq['question']!,
                answer: faq['answer']!,
              );
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildContactSection(),
          ),
        ],
      ),
    );
  }
}
