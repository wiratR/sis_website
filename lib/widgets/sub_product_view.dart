import 'package:flutter/material.dart';
import '../widgets/component/product_card_view.dart';
import '../models/product_data.dart';

class SubProductView extends StatelessWidget {
  final List<ProductData> productDatas = [
    ProductData(
      name: 'MI1002',
      description:
          'Intel® Core™ Ultra Processors\nSeries 1 (Meteor Lake-PS Platform)\nMini-ITX Motherboard',
      imageUrl:
          'https://via.placeholder.com/150', // Replace with actual image link
    ),
    ProductData(
      name: 'MI1001',
      description:
          '14th/13th/12th Gen Intel® Core™\nDT Processors (RPL-S Refresh)\nwith Intel® Q670E PCH..',
      imageUrl:
          'https://via.placeholder.com/150', // Replace with actual image link
    ),
    ProductData(
      name: 'MI1000',
      description:
          '14th/13th/12th Gen Intel® Core™\nDT Processors (RPL-S Refresh)\nwith Intel® R680E PCH..',
      imageUrl:
          'https://via.placeholder.com/150', // Replace with actual image link
    ),
    ProductData(
      name: 'MI997',
      description:
          '12th Gen Intel® Core™ and\nCeleron® socketed SoC processors\nMini-ITX Motherboard..',
      imageUrl:
          'https://via.placeholder.com/150', // Replace with actual image link
    ),
  ];

  SubProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2.0,
        ),
        itemCount: productDatas.length,
        itemBuilder: (context, index) {
          final productData = productDatas[index];
          return ProductCardView(productData: productData);
        },
      ),
    );
  }
}
