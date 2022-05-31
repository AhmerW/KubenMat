import 'package:kubenmat/models/product_model.dart';

class Order {
  final int orderId;
  final int timestamp;
  final String locationDescription;
  final String? orderDescription;

  final List<Product> products;

  int get price =>
      products.map((product) => product.price).reduce((f, s) => f + s);

  Order(
    this.orderId, {
    required this.timestamp,
    required this.locationDescription,
    required this.products,
    this.orderDescription,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      0,
      timestamp: 0,
      locationDescription: "",
      products: [],
    );
  }
}
