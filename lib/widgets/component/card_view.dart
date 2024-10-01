import 'package:flutter/material.dart';
import 'dart:convert'; // Import to decode base64

class CardView extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String imageData; // Add a base64 image data parameter

  const CardView({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.imageData, // Add base64 image data to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items at the start
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(8.0), // Rounded corners for the image
              child: Image.memory(
                base64Decode(imageData), // Use base64Decode for image data
                width: 100, // Increased width
                height: 100, // Increased height
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              // Use Expanded to allow text to fill the space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Icon(icon,
                      size: 20, color: Colors.blue), // Position the icon here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
