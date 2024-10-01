import 'package:flutter/material.dart';
import '../../widgets/component/header.dart';
import '../../widgets/component/footer.dart';

class SubProduct3Screen extends StatelessWidget {
  const SubProduct3Screen({super.key});

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
                child: Text('Sub Product1 Screen'),
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
