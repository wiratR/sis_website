import 'package:flutter/material.dart';
import '../widgets/product_view.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          Header(),
          // Main content (Empty for now)

          // Main content (ProductView)
          Expanded(
            child: ProductView(), // Include ProductView here
          ),

          // Footer
          Footer(),
        ],
      ),
    );
  }
}
