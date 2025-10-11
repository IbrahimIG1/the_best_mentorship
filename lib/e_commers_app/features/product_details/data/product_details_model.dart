class ProductDetailsModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final List<String> gallery;
  final List<String> sizes;
  final double rating;
  final int reviewsCount;
  final List<ReviewModel> reviews;

  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.gallery,
    required this.sizes,
    required this.rating,
    required this.reviewsCount,
    required this.reviews,
  });
}

class ReviewModel {
  final String userName;
  final String userImage;
  final String date;
  final double rating;
  final String comment;

  ReviewModel({
    required this.userName,
    required this.userImage,
    required this.date,
    required this.rating,
    required this.comment,
  });
}
