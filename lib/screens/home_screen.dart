import 'package:flutter/material.dart';
import '../widgets/contact_view.dart';
import '../widgets/product_view.dart';
import '../widgets/component/header.dart';
import '../widgets/component/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        // Ensure this wraps the entire Column
        child: Column(
          children: [
            // Header (Includes navigation bar)
            Header(),

            // ProductView
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ProductView(), // Display ProductView
            ),

            // Divider (Optional, to separate sections visually)
            Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),

            // ContactView
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ContactView(), // Display ContactView
            ),

            // Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
