import 'package:flutter/material.dart';
import '../widgets/contact_view.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          Header(),

          // Main Content (Contact View)
          Expanded(
            child: SingleChildScrollView(
              child: ContactView(),
            ),
          ),

          // Footer
          Footer(),
        ],
      ),
    );
  }
}
