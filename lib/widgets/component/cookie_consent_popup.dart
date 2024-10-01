import 'package:flutter/material.dart';

class CookieConsentPopup extends StatelessWidget {
  final Function onAccept;
  final Function onDecline;

  const CookieConsentPopup(
      {super.key, required this.onAccept, required this.onDecline});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Wrap the content tightly
        children: [
          const Text(
            'Cookie Consent',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'We use cookies to improve your experience. Do you accept?',
            textAlign: TextAlign.center,
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
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  onAccept();
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
