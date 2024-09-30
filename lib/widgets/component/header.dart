import 'package:flutter/material.dart';
import 'nav_item.dart';
import '../../routes/app_routes.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top contact info row
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.email, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'sale@sissolution.co.th',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.phone, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        '02-001-0518',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.5,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Image.asset(
                      'assets/images/sis_logo.jpg',
                      height: 80, // Adjust the size as needed
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Navigation bar
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end, // Spread evenly
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align items center
                      children: [
                        NavItem(title: 'Product', route: AppRoutes.product),
                        SizedBox(width: 32), // Added space between items
                        NavItem(title: 'Solution', route: AppRoutes.solution),
                        SizedBox(width: 32),
                        NavItem(title: 'News', route: AppRoutes.news),
                        SizedBox(width: 32),
                        NavItem(title: 'About Us', route: AppRoutes.aboutUs),
                        SizedBox(width: 32),
                        NavItem(title: 'Contact', route: AppRoutes.contact),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Footer divider or bottom bar
        Container(
          width: double.infinity,
          height: 33,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
