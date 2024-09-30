import 'package:flutter/material.dart';
import '../widgets/component/header.dart';
import '../widgets/component/footer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          const Header(),

          // Main content (Empty for now)
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text('Product Scrren'),
              ),
            ),
          ),

          // Footer
          const Footer(),
        ],
      ),
    );
  }
}
