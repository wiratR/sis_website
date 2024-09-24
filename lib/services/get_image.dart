import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config_service.dart'; // Import your config service

Future<String> getImage(int product) async {
  // Ensure the config is loaded before using it
  if (ConfigService.baseUrl.isEmpty) {
    await ConfigService.loadConfig();
  }

  // Construct the API URL with query parameters
  final Uri apiUrl = Uri.parse(ConfigService.baseUrl).replace(
    path: '/image',
    queryParameters: {
      'product': product.toString(),
    },
  );

  // Log API URL for debugging
  // debugPrint('Fetching image from: $apiUrl');

  try {
    final response = await http.get(apiUrl).timeout(
      const Duration(seconds: 10), // Set a timeout for the request
      onTimeout: () {
        throw Exception('Request timed out');
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // debugPrint('Response data: $data'); // Log response for debugging

      if (data.containsKey('image')) {
        return data['image']; // Return the base64 image string
      } else {
        throw Exception('image key not found in response');
      }
    } else {
      throw Exception(
          'Failed to load image. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } catch (e) {
    debugPrint('Error fetching image: $e');
    throw Exception('Error fetching image: $e');
  }
}
