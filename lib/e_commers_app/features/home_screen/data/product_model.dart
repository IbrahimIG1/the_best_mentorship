class ProductModel {
  final String id;
  final String productCode;
  final String name;
  final String description;
  final String arabicName;
  final String arabicDescription;
  final String coverPictureUrl;
  final List<String> productPictures;
  final double price;
  final int stock;
  final double weight;
  final String color;
  final double rating;
  final int reviewsCount;
  final double discountPercentage;
  final String sellerId;
  final List<String> categories;

  ProductModel({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.sellerId,
    required this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      productCode: json['productCode'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      arabicName: json['arabicName'] ?? '',
      arabicDescription: json['arabicDescription'] ?? '',
      coverPictureUrl: json['coverPictureUrl'] ?? '',
      productPictures: List<String>.from(json['productPictures'] ?? []),
      price: (json['price'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      weight: (json['weight'] ?? 0).toDouble(),
      color: json['color'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewsCount: json['reviewsCount'] ?? 0,
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      sellerId: json['sellerId'] ?? '',
      categories: List<String>.from(json['categories'] ?? []),
    );
  }
}
