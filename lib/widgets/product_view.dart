import 'package:flutter/material.dart';
import 'dart:async';
import '../services/get_image.dart'; // Import the getImageProduct function
import '../models/product_image.dart'; // Import the ProductImage model
import '../widgets/component/card_view.dart'; // Import the CardView widget

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<ProductImage> _products = [];
  bool _loading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initFetchProducts(); // Fetch product data on init
  }

  void _initFetchProducts() {
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      List<ProductImage> products = [];
      for (int i = 1; i <= 3; i++) {
        // Fetch the ProductImage object
        ProductImage productImage = await getImageProduct(i);
        products.add(productImage);
      }
      setState(() {
        _products = products;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _errorMessage = 'Failed to load products: $e';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
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
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    ProductImage product = _products[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        CardView(
                          title: product.brand,
                          description: 'No description available',
                          icon: Icons.request_quote_rounded,
                          imageData: product
                              .imageData, // Pass base64 image data to CardView
                        ),
                      ],
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_products.length, (index) {
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
