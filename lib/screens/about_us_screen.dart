import 'package:flutter/material.dart';
import '../widgets/about_us_view.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          Header(),

          // Main content (About Us View)
          Expanded(
            child: AboutUsView(), // Integrate the AboutUsView here
          ),

          // Footer
          Footer(),
        ],
      ),
    );
  }
}
