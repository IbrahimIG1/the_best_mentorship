import 'package:dartz/dartz.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import '../data/product_details_model.dart';

 class ProductDetailsRepo {
  final ApiServices apiServices;
  ProductDetailsRepo(this.apiServices);
  Future<Either<String, ProductDetailsModel>> getProductById(String id) async {
    // TODO: Implement API call
    // Dummy data for UI
    final product = ProductDetailsModel(
      id: id,
      name: 'Nike Club Fleece',
      description:
          'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with...',
      imageUrl:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/8e7e2e2e-2e2e-4e2e-8e2e-2e2e2e2e2e2e/nike-sportswear-club-fleece.jpg',
      price: 120,
      gallery: [
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/8e7e2e2e-2e2e-4e2e-8e2e-2e2e2e2e2e2e/nike-sportswear-club-fleece.jpg',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/8e7e2e2e-2e2e-4e2e-8e2e-2e2e2e2e2e2e/nike-windrunner.jpg',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/8e7e2e2e-2e2e-4e2e-8e2e-2e2e2e2e2e2e/nike-sportswear-club-fleece.jpg',
      ],
      sizes: ['S', 'M', 'L', 'XL', '2XL'],
      rating: 4.8,
      reviewsCount: 1,
      reviews: [
        ReviewModel(
          userName: 'Ronald Richards',
          userImage: 'https://randomuser.me/api/portraits/men/1.jpg',
          date: '13 Sep, 2020',
          rating: 4.8,
          comment:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
        ),
      ],
    );
    return Right(product);
  }
}

