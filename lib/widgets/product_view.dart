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
    _initFetchImages(); // Fetch images on init
  }

  void _initFetchImages() {
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    try {
      List<Image> images = [];
      for (int i = 1; i <= 3; i++) {
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
    } catch (e) {
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
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Text(
          _errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    return SingleChildScrollView(
      // Wrap Column in SingleChildScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Wrap PageView with a Container and ensure it has a height
          Container(
            height: 400, // Set a specific height
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
        ],
      ),
    );
  }
}
