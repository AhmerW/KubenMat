import 'package:flutter/cupertino.dart';
import 'package:kubenmat/models/order_model.dart';
import 'package:kubenmat/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _products = [];

  int get total => products.isEmpty
      ? 0
      : products
          .map((product) => product.price * product.quantity)
          .reduce((f, s) => f + s);

  List<Product> get products => _products;
  void get update => notifyListeners();
  void clear() {
    _products.clear();
    notifyListeners();
  }

  Order asOrder() => Order(
        0,
        timestamp: 0,
        locationDescription: "",
        products: _products,
      );

  addProduct(Product product) {
    bool _exists = false;
    for (var p in _products) {
      if (p.productId == product.productId) {
        p.quantity += 1;
        _exists = true;
      }
    }
    if (!_exists) _products.add(product);

    notifyListeners();
  }

  removeProduct(Product product) {
    _products.removeWhere((p) => product.productId == p.productId);
    notifyListeners();
  }
}
