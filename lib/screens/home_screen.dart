import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/contact_view.dart';
import '../widgets/solution_view.dart';
import '../widgets/about_us_view.dart';
import '../widgets/component/cookie_consent_popup.dart';
import '../widgets/component/header.dart';
import '../widgets/component/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool cookiesAccepted = false;

  @override
  void initState() {
    super.initState();
    _loadCookiePreference(); // Load the cookie preference when the widget initializes
  }

  Future<void> _loadCookiePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cookiesAccepted =
          prefs.getBool('cookiesAccepted') ?? false; // Load the preference
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!cookiesAccepted) {
        _showCookieConsent(); // Show the popup when the screen loads
      }
    });
  }

  void _showCookieConsent() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CookieConsentPopup(
          onAccept: () async {
            setState(() {
              cookiesAccepted = true; // Handle cookie acceptance
            });
            // Save the acceptance in preferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('cookiesAccepted', true); // Store acceptance
          },
          onDecline: () async {
            setState(() {
              cookiesAccepted = false; // Handle cookie decline
            });
            // Save the decline in preferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('cookiesAccepted', false); // Store decline
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header (Includes navigation bar)
            Header(),

            // SolutionView
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: SolutionView(), // Display ProductView
            ),

            // Divider (Optional, to separate sections visually)
            Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),

            // SolutionView
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: AboutUsView(), // Display ProductView
            ),

            // Divider (Optional, to separate sections visually)
            Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),

            // ContactView
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ContactView(), // Display ContactView
            ),

            // Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
