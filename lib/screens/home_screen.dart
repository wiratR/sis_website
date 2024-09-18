import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                child: Text('Main Content Goes Here'),
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
