import 'package:flutter/material.dart';
import 'dart:convert'; // For base64 decoding
import 'dart:async';
import '../widgets/component/label_header.dart';
import '../services/get_image.dart'; // Import the getImage function

class SolutionView extends StatefulWidget {
  const SolutionView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SolutionViewState createState() => _SolutionViewState();
}

class _SolutionViewState extends State<SolutionView> {
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
        String imageBase64 = await getImageService(i);
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
      // Wrap with SingleChildScrollView
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add LabelHeader here
          const LabelHeader(
            imageUrl:
                'assets/images/label/solution.jpg', // Update with your asset path
            text: 'Solution', // Use the widget title
          ),
          const SizedBox(height: 10),

          // Wrap PageView with a Container and ensure it has a height
          SizedBox(
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
