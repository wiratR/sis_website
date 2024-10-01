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
  // State to control dropdown visibility
  bool _isProductDropdownVisible = false;

  // To track hover state for each subProduct
  bool _isHoveredSubProduct1 = false;
  bool _isHoveredSubProduct2 = false;
  bool _isHoveredSubProduct3 = false;

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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end, // Spread evenly
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align items center
                      children: [
                        // Product button with dropdown toggle
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isProductDropdownVisible =
                                  !_isProductDropdownVisible;
                            });
                          },
                          child: Text(
                            'Product',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryColor, // Updated color
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                        const NavItem(
                            title: 'Solution', route: AppRoutes.solution),
                        const SizedBox(width: 32),
                        const NavItem(title: 'News', route: AppRoutes.news),
                        const SizedBox(width: 32),
                        const NavItem(
                            title: 'About Us', route: AppRoutes.aboutUs),
                        const SizedBox(width: 32),
                        const NavItem(
                            title: 'Contact', route: AppRoutes.contact),
                      ],
                    ),
                  ),
                ],
              ),
              // Dropdown list for SubProducts 1, 2, and 3
              Visibility(
                visible: _isProductDropdownVisible,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredSubProduct1 = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredSubProduct1 = false;
                      }),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.subProduct1);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: _isHoveredSubProduct1
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4.0),
                            boxShadow: _isHoveredSubProduct1
                                ? [
                                    const BoxShadow(
                                        color: Colors.white, blurRadius: 4.0)
                                  ]
                                : [],
                          ),
                          child: Text(
                            'AFC Equipment',
                            style: TextStyle(
                              color: _isHoveredSubProduct1
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredSubProduct2 = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredSubProduct2 = false;
                      }),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.subProduct2);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: _isHoveredSubProduct2
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4.0),
                            boxShadow: _isHoveredSubProduct2
                                ? [
                                    const BoxShadow(
                                        color: Colors.white, blurRadius: 4.0)
                                  ]
                                : [],
                          ),
                          child: Text(
                            'Embedded Computing',
                            style: TextStyle(
                              color: _isHoveredSubProduct2
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) => setState(() {
                        _isHoveredSubProduct3 = true;
                      }),
                      onExit: (_) => setState(() {
                        _isHoveredSubProduct3 = false;
                      }),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.subProduct3);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: _isHoveredSubProduct3
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4.0),
                            boxShadow: _isHoveredSubProduct3
                                ? [
                                    const BoxShadow(
                                        color: Colors.white, blurRadius: 4.0)
                                  ]
                                : [],
                          ),
                          child: Text(
                            'Accessories',
                            style: TextStyle(
                              color: _isHoveredSubProduct3
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
