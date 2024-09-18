import 'package:flutter/material.dart';
import '../screens/product_screen.dart';
import '../screens/solution_screen.dart';
import '../screens/new_screen.dart';
import '../screens/about_us_screen.dart';
import '../screens/contact_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String product = '/product';
  static const String solution = '/solution';
  static const String news = '/new';
  static const String aboutUs = '/about_us';
  static const String contact = '/contact';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      product: (context) => const ProductScreen(),
      solution: (context) => const SolutionScreen(),
      news: (context) => const NewScreen(),
      aboutUs: (context) => const AboutUsScreen(),
      contact: (context) => const ContactScreen(),
    };
  }
}
