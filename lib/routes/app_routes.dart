import 'package:flutter/material.dart';
import '../screens/product_screen.dart';
import '../screens/solution_screen.dart';
import '../screens/new_screen.dart';
import '../screens/about_us_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/products/sub_product1_screen.dart';
import '../screens/products/sub_product2_screen.dart';
import '../screens/products/sub_product3_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String product = '/product';
  static const String solution = '/solution';
  static const String news = '/new';
  static const String aboutUs = '/about_us';
  static const String contact = '/contact';
  static const String subProduct1 = '/product/subProduct1';
  static const String subProduct2 = '/product/subProduct2';
  static const String subProduct3 = '/product/subProduct3';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      product: (context) => const ProductScreen(),
      subProduct1: (context) => const SubProduct1Screen(),
      subProduct2: (context) => const SubProduct2Screen(),
      subProduct3: (context) => const SubProduct3Screen(),
      solution: (context) => const SolutionScreen(),
      news: (context) => const NewScreen(),
      aboutUs: (context) => const AboutUsScreen(),
      contact: (context) => const ContactScreen(),
    };
  }
}
