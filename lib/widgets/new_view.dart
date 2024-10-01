import 'package:flutter/material.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    // Sample list of news items
    final newsItems = [
      'Comming Soon...',
      'Comming Soon...',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            // Center the text
            child: Text(
              'News And Activity',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newsItems.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    newsItems[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
