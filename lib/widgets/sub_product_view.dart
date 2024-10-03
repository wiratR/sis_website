import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../widgets/component/label_header.dart';
import '../utils/utils.dart';
import '../widgets/component/product_card_view.dart';
import '../models/product_data.dart';

class SubProductView extends StatefulWidget {
  final String title;
  final String categoryItem;

  const SubProductView(this.title, this.categoryItem, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SubProductViewState createState() => _SubProductViewState();
}

class _SubProductViewState extends State<SubProductView> {
  final Logger logger = Logger();
  List<ProductDetail>? productDetails;

  List<String> categoryItems = [];
  List<String> titles = [];
  String? selectedCategory;
  String? selectedTitle;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  Future<void> fetchJsonData() async {
    try {
      // Fetch categories based on title and brand
      categoryItems = await getCategoriesByTitleAndBrands(
        'assets/json/mock_data.json',
        'Ibase',
        widget.title, // Use the title from the widget
      );
      logger.i(
          "Data fetched successfully: ${categoryItems.length} categories loaded.");

      // Add "ALL" to the category items
      categoryItems.insert(0, 'ALL');

      // Set selectedCategory from widget.categoryItem if it exists in categoryItems
      if (categoryItems.contains(widget.categoryItem)) {
        selectedCategory = widget.categoryItem;
      } else {
        selectedCategory = categoryItems.first; // Default to "ALL"
      }
    } catch (e) {
      logger.e("Error loading categories: $e.");
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load categories.';
      });
      return;
    }

    try {
      // Fetch titles for the specific brand "Ibase"
      titles = await getTitlesByBrand('Ibase', 'assets/json/mock_data.json');
      logger.i("Data fetched successfully: ${titles.length} titles loaded.");
      if (titles.isNotEmpty) {
        setState(() {
          selectedTitle = titles.first;
        });
      }
    } catch (e) {
      logger.e("Error loading titles: $e.");
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load titles.';
      });
      return;
    }

    setState(() {
      isLoading = false;
    });

    fetchProductDetails(); // Fetch products after loading categories and titles
  }

  Future<void> fetchProductDetails() async {
    if (selectedTitle == null) return;

    // Check if "ALL" is selected, and fetch all products for the selected title
    if (selectedCategory == 'ALL') {
      try {
        productDetails = await readProductDetailsJsonByParameter(
          'assets/json/mock_data.json',
          'Ibase',
          selectedTitle!,
          null, // No category specified for "ALL"
        );
        logger.i(
            "Data fetched successfully: ${productDetails?.length} products loaded for title: $selectedTitle.");
      } catch (e) {
        logger.e("Error loading all products: $e.");
        setState(() {
          errorMessage = 'Failed to load products for the selected title.';
        });
      }
    } else {
      // Fetch products based on the selected category
      try {
        productDetails = await readProductDetailsJsonByParameter(
          'assets/json/mock_data.json',
          'Ibase',
          selectedTitle!,
          selectedCategory!, // Ensure selectedCategory is not null
        );
        logger.i(
            "Data fetched successfully: ${productDetails?.length} products loaded for title: $selectedTitle and category: $selectedCategory.");
      } catch (e) {
        logger.e("Error loading products: $e.");
        setState(() {
          errorMessage = 'Failed to load products.';
        });
      }
    }

    setState(() {});
  }

  Future<void> fetchCategoriesByTitle(String title) async {
    try {
      // Fetch categories based on the newly selected title
      categoryItems = await getCategoriesByTitleAndBrands(
        'assets/json/mock_data.json',
        'Ibase',
        title,
      );

      // Add "ALL" to the category items
      categoryItems.insert(0, 'ALL');
      logger.i(
          "Data fetched successfully: ${categoryItems.length} categories loaded.");

      // Automatically select the first category if categories are available
      if (categoryItems.isNotEmpty) {
        setState(() {
          selectedCategory = categoryItems.first;
        });
      } else {
        setState(() {
          selectedCategory = null; // Reset if no categories are found
        });
      }
    } catch (e) {
      logger.e("Error loading categories for title: $e.");
      setState(() {
        errorMessage = 'Failed to load categories for the selected title.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Add LabelHeader here
          const LabelHeader(
            imageUrl:
                'assets/images/label/embedded-computing.jpg', // Update with your asset path
            text: 'Embedded Computing', // Use the widget title
          ),
          const SizedBox(height: 10),
          if (isLoading)
            const CircularProgressIndicator()
          else if (errorMessage.isNotEmpty)
            Text(errorMessage)
          else ...[
            buildDropdownRow(),
            const SizedBox(height: 10),
            buildProductGrid(),
          ],
        ],
      ),
    );
  }

  Widget buildDropdownRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              getTitleBasedOnTitle(selectedTitle),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 20),
            buildDropdown<String>(
              selectedTitle,
              titles,
              (newValue) {
                setState(() {
                  selectedTitle = newValue;
                  fetchCategoriesByTitle(selectedTitle!);
                  fetchProductDetails();
                });
              },
              "Select Title",
            ),
            const SizedBox(width: 20),
            buildDropdown<String>(
              selectedCategory,
              categoryItems,
              (newValue) {
                setState(() {
                  selectedCategory = newValue;
                  fetchProductDetails();
                });
              },
              "Select Category",
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              getCategoryBaseOnCategory(selectedCategory),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDropdown<T>(
    T? selectedValue,
    List<T> items,
    ValueChanged<T?> onChanged,
    String hintText,
  ) {
    return Expanded(
      child: SizedBox(
        child: DropdownButtonFormField<T>(
          value: selectedValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
              borderSide: const BorderSide(color: Colors.grey), // Border color
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            filled: true,
            fillColor: Colors.white, // Background color
          ),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: double.infinity, // Make dropdown width flexible
                ),
                child: Text(
                  item.toString(),
                  overflow:
                      TextOverflow.ellipsis, // Handle overflow with ellipsis
                  maxLines: 1, // Limit text to a single line
                  softWrap: false, // Prevent wrapping
                ),
              ),
            );
          }).toList(),
          hint: Text(hintText),
          onChanged: onChanged,
          isExpanded: true, // Makes the dropdown full width
        ),
      ),
    );
  }

  Widget buildProductGrid() {
    return Expanded(
      child: productDetails == null
          ? const Center(child: CircularProgressIndicator())
          : productDetails!.isEmpty
              ? const Center(child: Text("No products available"))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: productDetails!.length,
                  itemBuilder: (context, index) {
                    final productData = productDetails![index];
                    return ProductCardView(productData: productData);
                  },
                ),
    );
  }

  String getTitleBasedOnTitle(String? title) {
    if (title == null) {
      return widget.title; // Default title if no category matches
    } else {
      return title;
    }
  }

  String getCategoryBaseOnCategory(String? category) {
    if (category == null) {
      return widget.categoryItem; // Default title if no category matches
    } else {
      return category;
    }
  }
}
