import 'package:flutter/material.dart';
import '../../widgets/accessories_view.dart';
import '../../widgets/component/header.dart';
import '../../widgets/component/footer.dart';

// Accessories
class SubProduct3Screen extends StatelessWidget {
  const SubProduct3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          Header(),

          // Main content (About Us View)
          Expanded(
            child: AccessoriesView(), // Integrate the AboutUsView here
          ),

          // Footer
          Footer(),
        ],
      ),
    );
  }
}
