import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../screens/products/sub_product/details_screen.dart';
import '../../utils/utils.dart';
import '../../widgets/component/footer.dart';
import '../../widgets/component/header.dart';
import '../../widgets/component/label_header.dart';

class SubProduct2Screen extends StatefulWidget {
  const SubProduct2Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SubProduct2ScreenState createState() => _SubProduct2ScreenState();
}

class _SubProduct2ScreenState extends State<SubProduct2Screen> {
  final Logger logger = Logger();

  List<List<String>> categoryItems = [];
  List<String> titles = [];

  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  Future<void> fetchJsonData() async {
    try {
      // Fetch categories for all brands
      categoryItems = await getCategoriesForAllBrands(
          'Ibase', 'assets/json/mock_data.json');
      logger.i(
          "Data fetched successfully: ${categoryItems.length} categories loaded.");
    } catch (e) {
      logger.e("Error loading categories: $e.");
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load categories.';
      });
      return; // Exit if categories fail to load
    }

    try {
      // Fetch titles for the specific brand "Ibase"
      titles = await getTitlesByBrand('Ibase', 'assets/json/mock_data.json');
      logger.i("Data fetched successfully: ${titles.length} titles loaded.");
    } catch (e) {
      logger.e("Error loading titles: $e.");
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load titles.';
      });
      return; // Exit if titles fail to load
    }

    setState(() {
      isLoading = false; // Data loaded successfully
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Scaffold(
        body: Center(child: Text(errorMessage)),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          const Header(),
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // Add LabelHeader here
                    const LabelHeader(
                      imageUrl:
                          'assets/images/label/embedded.jpg', // Update with your asset path
                      text: 'Embedded Computing', // Use the widget title
                    ),
                    // // Title header
                    // Text(
                    //   'Embedded Computing',
                    //   style: TextStyle(
                    //     fontSize: 28,
                    //     fontWeight: FontWeight.bold,
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    // Subtitle
                    const Text(
                      '3.5" Single Board Computer, Mini-ITX, ATX, COM Express, ETX CPU Module & CPU Card',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    // Categories Grid
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
                          itemCount:
                              titles.length, // Dynamic number of categories
                          itemBuilder: (context, index) {
                            // Ensure index is within bounds
                            if (index < titles.length &&
                                index < categoryItems.length) {
                              return _buildCategory(
                                  context, titles[index], categoryItems[index]);
                            } else {
                              return const SizedBox
                                  .shrink(); // Return empty widget if index is out of bounds
                            }
                          },
                        ),
                      ),
                    ),
                  ]),
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
                    // Handle when tap to navigate to DetailsScreen
                    logger.i(
                        "select category Items : ${items[index]} and tittle : $title");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(title, items[index]),
                      ),
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
