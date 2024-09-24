import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the primary color from the app's theme
    final primaryColor = Theme.of(context).primaryColor;

    return SingleChildScrollView(
      // Wrap with SingleChildScrollView
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'About Our Company',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor, // Use primary color here
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'We are dedicated to providing the best services to our customers. '
            'Our mission is to deliver high-quality products and exceptional service. '
            '\nTeam Specialist Expertise in AFC (Auto Fare Collection) for the Transportation in Thailand.\n'
            '\n • 5 Years experience for managing the Largest CCH (Central Clearing House) for Contact-less Stored Value Smart Card in Thailand\n'
            '\n • 12 Years experience in AFC (Auto Fare Collection) for BTS Skytrain, MRT, Airport Rail Link\n'
            '\n • 7 Years experience in Electronic Data Capture Machine Retailers & Retail Merchants (NFC Card)\n',
            style: TextStyle(
              fontSize: 16,
              color: primaryColor, // Use primary color here
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Our Values',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor, // Use primary color here
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '1. Integrity\n'
            '2. Innovation\n'
            '3. Customer Satisfaction\n'
            '4. Teamwork\n'
            '5. Community Engagement',
            style: TextStyle(
              fontSize: 16,
              color: primaryColor, // Use primary color here
            ),
          ),
        ],
      ),
    );
  }
}
