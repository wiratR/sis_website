import 'package:flutter/material.dart';

class CookieConsentPopup extends StatelessWidget {
  final Function onAccept;
  final Function onDecline;

  const CookieConsentPopup(
      {super.key, required this.onAccept, required this.onDecline});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Wrap the content tightly
        children: [
          Text(
            'Cookie Consent',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor), // Use primaryColor for the text
          ),
          const SizedBox(height: 10),
          Text(
            'We use cookies to improve your experience. Do you accept?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: primaryColor), // Use primaryColor for the text
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  onDecline();
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70, // Decline button in grey
                ),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  onAccept();
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70, // Decline button in grey
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
