import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final String title;
  final String route;

  const NavItem({super.key, required this.title, required this.route});

  @override
  // ignore: library_private_types_in_public_api
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, widget.route);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: _isHovered
                ? [const BoxShadow(color: Colors.white, blurRadius: 4.0)]
                : [],
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered ? Colors.white : Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
