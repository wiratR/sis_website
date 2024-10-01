import 'package:flutter/material.dart';
import '../widgets/component/header.dart';
import '../widgets/component/footer.dart';
import '../widgets/product_view.dart'; // Import your ProductView

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          const Header(),

          // Main content (ProductView for displaying images)
          Expanded(
            child: Container(
              color: Colors.white,
              child:
                  const ProductView(), // Replace the placeholder text with ProductView
            ),
          ),

          // Footer
          const Footer(),
        ],
      ),
    );
  }
}
