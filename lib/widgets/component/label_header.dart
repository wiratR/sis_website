import 'package:flutter/material.dart';

class LabelHeader extends StatelessWidget {
  final String imageUrl;
  final String text;

  const LabelHeader({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image wrapped in ClipRect to prevent overflow
        ClipRect(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover, // Adjusts the image to cover the area
            width: double.infinity,
            height: 150, // Set a fixed height
          ),
        ),
        // Text overlay
        Positioned(
          bottom: 20, // Position from the bottom
          left: 0, // Align to the left edge of the Stack
          right: 0, // Align to the right edge of the Stack
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black54, // Semi-transparent background
            child: Center(
              // Center the text horizontally
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white, // White text color
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
