class CartItemModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  final double tax;

  CartItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.tax,
  });
}

class CartModel {
  final List<CartItemModel> items;
  final String address;
  final String paymentMethod;
  final double subtotal;
  final double shippingCost;
  final double total;

  CartModel({
    required this.items,
    required this.address,
    required this.paymentMethod,
    required this.subtotal,
    required this.shippingCost,
    required this.total,
  });
}
