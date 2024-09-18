import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siam Infinity Solution',
      theme: ThemeData(
        primaryColor: const Color(0xFF344069), // Set primary color here
        // You can also define other colors here if needed
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF344069),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        ...AppRoutes.getRoutes(), // This adds all your custom routes
      },
    );
  }
}
