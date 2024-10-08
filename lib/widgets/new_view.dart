import 'package:flutter/material.dart';
import '../widgets/component/label_header.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of news items
    final newsItems = [
      'Comming Soon...',
      'Comming Soon...',
    ];

    return SingleChildScrollView(
      // Wrap with SingleChildScrollView
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add LabelHeader here
          const LabelHeader(
            imageUrl:
                'assets/images/label/new.jpg', // Update with your asset path
            text: 'News And Activity', // Use the widget title
          ),
          const SizedBox(height: 10),
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
