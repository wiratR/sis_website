import 'package:flutter/material.dart';
import '../widgets/inquiry_form.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get screen size using MediaQuery
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // Calculate image size dynamically based on screen size
          final imageWidth = screenWidth * 0.4; // 50% of screen width
          final imageHeight = screenHeight * 0.5; // 50% of screen height

          // Check if the screen is small (mobile)
          final isMobile = screenWidth < 600;

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header (Includes navigation bar)
                const Header(),
                const SizedBox(height: 20),

                // Company Information
                const SizedBox(
                  width: 480,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Siam Infinity Solution CO., Ltd (SIS)\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF344069),
                        fontSize: 26,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Layout switches to Column for small screens (mobile)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image (Map) with dynamic size based on screen size
                            SizedBox(
                              width: imageWidth,
                              height: imageHeight,
                              child: Image.asset(
                                'assets/images/sis_map.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Inquiry Form
                            const InquiryForm(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image (Map) with dynamic size based on screen size
                            SizedBox(
                              width: imageWidth,
                              height: imageHeight,
                              child: Image.asset(
                                'assets/images/sis_map.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            // Inquiry Form
                            const Expanded(
                              child: InquiryForm(),
                            ),
                          ],
                        ),
                ),

                // Footer
                const Footer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
