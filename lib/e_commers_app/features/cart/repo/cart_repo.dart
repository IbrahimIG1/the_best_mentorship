import 'package:dartz/dartz.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/network/api_services/api_services.dart';
import '../data/cart_model.dart';

 class CartRepo {
  final ApiServices apiServices;
  CartRepo(this.apiServices);
  Future<Either<String, CartModel>> getCart() async {
    // TODO: Implement API call
    // Dummy data for UI
    final cart = CartModel(
      items: [
        CartItemModel(
          id: '1',
          name: "Men's Tie-Dye T-Shirt Nike Sportswear",
          imageUrl:
              'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/blue-shirt.jpg',
          price: 45,
          quantity: 1,
          tax: 4,
        ),
        CartItemModel(
          id: '2',
          name: "Men's Tie-Dye T-Shirt Nike Sportswear",
          imageUrl:
              'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/red-shirt.jpg',
          price: 45,
          quantity: 1,
          tax: 4,
        ),
      ],
      address: 'Chhatak, Sunamgonj 12/8AB',
      paymentMethod: 'Visa Classic **** 7690',
      subtotal: 110,
      shippingCost: 10,
      total: 120,
    );
    return Right(cart);
  }
}
