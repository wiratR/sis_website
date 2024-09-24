import 'package:flutter/material.dart';
import 'dart:convert'; // For base64 decoding
import 'dart:async';
import '../services/get_image.dart'; // Import the getImage function

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Image> _images = [];
  bool _loading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // debugPrint("initState");
    _initFetchImages(); // Moved the async call to a new method
  }

  // Separate method to handle async call in initState
  void _initFetchImages() {
    _fetchImages(); // Call async method here
  }

  Future<void> _fetchImages() async {
    try {
      // debugPrint("_fetchImages");
      List<Image> images = [];
      for (int i = 1; i <= 3; i++) {
        // debugPrint("Fetching image $i");
        String imageBase64 = await getImage(i);
        if (imageBase64.isNotEmpty) {
          images.add(Image.memory(base64Decode(imageBase64)));
        } else {
          throw Exception('Image $i is empty');
        }
      }
      setState(() {
        _images = images;
        _loading = false;
      });
    } catch (e, stacktrace) {
      debugPrint('Error fetching images: $e');
      debugPrint('Stacktrace: $stacktrace');
      setState(() {
        _loading = false;
        _errorMessage = 'Failed to load images: $e';
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      ); // Show loading indicator
    }

    if (_errorMessage != null) {
      return Center(
        child: Text(
          _errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ); // Show error message if failed to load images
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Slideshow',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Wrapping PageView with Expanded to avoid layout errors
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return _images[index]; // Display the decoded base64 image
                },
              ),

              // Dots Indicator
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_images.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Description of the products can go here.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
