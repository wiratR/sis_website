import 'package:flutter/material.dart';
import '../widgets/new_view.dart';
import '../widgets/component/header.dart';
import '../widgets/component/footer.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          Header(),

          // Main content (About Us View)
          Expanded(
            child: NewView(), // Integrate the AboutUsView here
          ),

          // Footer
          Footer(),
        ],
      ),
    );
  }
}
