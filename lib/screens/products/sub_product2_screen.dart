import 'package:flutter/material.dart';
import '../../widgets/component/header.dart';
import '../../widgets/component/footer.dart';

class SubProduct2Screen extends StatelessWidget {
  const SubProduct2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min, // Ensure Column only takes needed space
        children: [
          // Header
          const Header(),

          // Main Content with padding on the left and right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Embedded Computing',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle
                  const Text(
                    '3.5" Single Board Computer, Mini-ITX, ATX, COM Express, ETX CPU Module & CPU Card',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  // Categories
                  Expanded(
                    child: ClipRect(
                      // ClipRect to prevent overflow
                      child: GridView.builder(
                        padding: EdgeInsets.zero, // Remove padding
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.0, // No horizontal spacing
                          mainAxisSpacing: 0.0, // No vertical spacing
                          childAspectRatio: 2.5, // Width to height ratio
                        ),
                        itemCount: 6, // Number of categories
                        itemBuilder: (context, index) {
                          List<List<String>> categoryItems = [
                            [
                              'Mini-ITX Motherboard',
                              'ATX Motherboard',
                              'Micro ATX Motherboard'
                            ],
                            [
                              'x86-based 3.5" Single Board Computer',
                              'x86-based 2.5" Single Board Computer',
                              'ARM-based 3.5" Single Board Computer',
                              'ARM-based 2.5" Single Board Computer'
                            ],
                            ['COM Express', 'Qseven', 'ETX'],
                            ['Full-Size CPU Card', 'Backplane'],
                            ['COM Express', 'Qseven', 'ETX'],
                            ['Mini PCI-E Card', 'Embedded Function Card'],
                          ];
                          List<String> titles = [
                            'Motherboard',
                            'Single Board Computer',
                            'CPU Module',
                            'CPU Card',
                            'Carrier Board',
                            'Accessories',
                          ];

                          return _buildCategory(
                              context, titles[index], categoryItems[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer
          const Footer(),
        ],
      ),
    );
  }

  Widget _buildCategory(
      BuildContext context, String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8.0), // Only add top padding for visual separation
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          // List of items
          Flexible(
            child: ListView.separated(
              padding: EdgeInsets.zero, // Remove padding in the ListView
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 4.0), // Vertical space between items
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle tap on each item
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${items[index]} tapped')),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0), // Only vertical spacing
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            items[index],
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
