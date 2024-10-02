import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product_data.dart';

Future<List<dynamic>> readJson(String path) async {
  // Load the JSON file
  String jsonString = await rootBundle.loadString(path);

  // Parse and return JSON data
  return jsonDecode(jsonString);
}

Future<List<ProductDetail>> readProductDetailsJsonByParameter(
    String path, String brand, String title, String categoryItem) async {
  try {
    // Load the JSON file
    String jsonString = await rootBundle.loadString(path);

    // Parse the JSON
    List<dynamic> jsonData = jsonDecode(jsonString);

    // Extract product details (for brands with models)
    List<ProductDetail> productDetails = [];

    for (var product in jsonData) {
      // Check if the product's 'brand' matches the input
      if (product['brand'] == brand &&
          product.containsKey('tittle') &&
          product['tittle'] == title) {
        // Check if 'categorys' exists
        if (product.containsKey('categorys')) {
          for (var category in product['categorys']) {
            // Check if the category matches the category item
            if (category['item'] == categoryItem) {
              // Add all product details from 'data' in the matching category
              for (var item in category['data']) {
                productDetails.add(ProductDetail.fromJson(item));
              }
            }
          }
        }
      }
    }

    return productDetails;
  } catch (e) {
    throw Exception('Failed to read product details JSON by parameter: $e');
  }
}

Future<List<List<String>>> getCategoriesForAllBrands(
    String brand, String jsonPath) async {
  try {
    String jsonString = await rootBundle.loadString(jsonPath);
    List<dynamic> jsonData = json.decode(jsonString);

    List<List<String>> allCategories = [];

    // Iterate over the products
    for (var product in jsonData) {
      // Filter by brand
      if (product['brand'] == brand) {
        List<String> categoryItems = [];

        // Check if 'categorys' exists and is a list
        if (product['categorys'] != null && product['categorys'] is List) {
          for (var category in product['categorys']) {
            String item = category['item'] ?? 'Unknown Category';
            categoryItems.add(item); // Add the category 'item' to the list
          }
        }

        // Add the category list for the matching brand
        allCategories.add(categoryItems);
      }
    }

    return allCategories;
  } catch (error) {
    throw Exception('Failed to load and parse JSON: $error');
  }
}

Future<List<String>> getTitlesByBrand(String brand, String path) async {
  try {
    // Load the JSON file
    String jsonString = await rootBundle.loadString(path);

    List<dynamic> jsonData = json.decode(jsonString);

    List<String> titles = [];

    // Iterate over the products
    for (var product in jsonData) {
      // Check if the product's 'brand' matches the input and if 'tittle' exists
      if (product['brand'] == brand && product.containsKey('tittle')) {
        titles.add(product['tittle']); // Add the tittle to the list
      }
    }

    return titles;
  } catch (error) {
    throw Exception('Failed to load and parse JSON: $error');
  }
}
