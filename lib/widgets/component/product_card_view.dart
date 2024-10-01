import 'package:flutter/material.dart';
import '../../models/product_data.dart';

class ProductCardView extends StatelessWidget {
  final ProductData productData;

  const ProductCardView({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              productData.imageUrl,
              height: 100.0,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            productData.name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            productData.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14.0),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.attach_money),
                onPressed: () {
                  // Handle inquiry button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.compare_arrows),
                onPressed: () {
                  // Handle compare button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.description),
                onPressed: () {
                  // Handle datasheet button press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
