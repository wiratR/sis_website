class ProductImage {
  final String brand;
  final String imageData;

  ProductImage({required this.brand, required this.imageData});

  // Factory constructor to create an instance from JSON
  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      brand: json['brand'],
      imageData: json['image_data'],
    );
  }
}
