import 'package:flutter/material.dart';
import '../../../widgets/sub_product_view.dart';
import '../../../widgets/component/header.dart';
import '../../../widgets/component/footer.dart';

// Accessories
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
                  SubProductView(), // Replace the placeholder text with ProductView
            ),
          ),

          // Footer
          const Footer(),
        ],
      ),
    );
  }
}
