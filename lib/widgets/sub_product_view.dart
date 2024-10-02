import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/component/product_card_view.dart';
import '../models/product_data.dart';
import 'package:logger/logger.dart';

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

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  // Future<void> fetchJsonData() async {
  //   productDetails = await readProductDeailsJson('assets/json/mock_data.json');
  //   setState(() {});
  // }

  Future<void> fetchJsonData() async {
    try {
      productDetails = await readProductDetailsJsonByParameter(
        'assets/json/mock_data.json',
        'Ibase', // Replace with your actual brand value if needed
        widget.title, // Use widget.title instead of tittle
        widget.categoryItem, // Use widget.categoryItem instead of categoryIyem
      );
      logger.i(
          "Data fetched successfully: ${productDetails?.length} products loaded.");
    } catch (e) {
      logger.e("Error loading products: $e.");
    }
    setState(() {}); // Refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: productDetails == null
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator when data is null
          : productDetails!.isEmpty // Check if the list is empty
              ? const Center(
                  child: Text(
                      "No products available")) // Show message when the list is empty
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: productDetails!
                      .length, // Safely accessing length after null check
                  itemBuilder: (context, index) {
                    final productData = productDetails![
                        index]; // Safely access individual product
                    return ProductCardView(productData: productData);
                  },
                ),
    );
  }
}

// class SubProductView extends StatelessWidget {
//   final List<ProductData> productDatas = [
//     ProductData(
//       name: 'MI1002',
//       description:
//           'Intel® Core™ Ultra Processors\nSeries 1 (Meteor Lake-PS Platform)\nMini-ITX Motherboard',
//       imageUrl:
//           'https://via.placeholder.com/150', // Replace with actual image link
//     ),
//     ProductData(
//       name: 'MI1001',
//       description:
//           '14th/13th/12th Gen Intel® Core™\nDT Processors (RPL-S Refresh)\nwith Intel® Q670E PCH..',
//       imageUrl:
//           'https://via.placeholder.com/150', // Replace with actual image link
//     ),
//     ProductData(
//       name: 'MI1000',
//       description:
//           '14th/13th/12th Gen Intel® Core™\nDT Processors (RPL-S Refresh)\nwith Intel® R680E PCH..',
//       imageUrl:
//           'https://via.placeholder.com/150', // Replace with actual image link
//     ),
//     ProductData(
//       name: 'MI997',
//       description:
//           '12th Gen Intel® Core™ and\nCeleron® socketed SoC processors\nMini-ITX Motherboard..',
//       imageUrl:
//           'https://via.placeholder.com/150', // Replace with actual image link
//     ),
//   ];

//   SubProductView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.0,
//           mainAxisSpacing: 10.0,
//           childAspectRatio: 2.0,
//         ),
//         itemCount: productDatas.length,
//         itemBuilder: (context, index) {
//           final productData = productDatas[index];
//           return ProductCardView(productData: productData);
//         },
//       ),
//     );
//   }
// }
