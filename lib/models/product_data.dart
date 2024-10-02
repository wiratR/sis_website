class ProductData {
  final String name;
  final String description;
  final String imageUrl;

  ProductData({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class Product {
  String brand;
  String tittle;
  List<ProductCategorys> categorys;

  Product({
    required this.brand,
    required this.tittle,
    required this.categorys,
  });

  // Factory constructor to create a Product from a map (JSON)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json['brand'],
      tittle: json['tittle'],
      categorys: json['categorys'],
    );
  }
}

class ProductCategorys {
  String item;
  List<ProductDetail> data;

  ProductCategorys({
    required this.item,
    required this.data,
  });

  // Factory constructor to create a Product from a map (JSON)
  factory ProductCategorys.fromJson(Map<String, dynamic> json) {
    return ProductCategorys(
      item: json['item'],
      data: json['data'],
    );
  }
}

class ProductDetail {
  final String name;
  final String description;
  final String imagePath;

  ProductDetail({
    required this.name,
    required this.description,
    required this.imagePath,
  });
  // Factory constructor to create a ProductDetail from a map (JSON)
  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      name: json['name'],
      description: json['description'],
      imagePath: json['image_path'],
    );
  }
}
