import 'package:flutter/cupertino.dart';
import 'package:kubenmat/models/product_model.dart';

Map<int, ProductGroup> _productGroups = {
  0: ProductGroup(0, 'Mat'),
  1: ProductGroup(1, 'Drikker'),
};
// Group : List[products]
Map<int, List<Product>> _products = {
  0: [
    Product(0,
        name: "Hveteboller",
        price: 9,
        asset: "https://bilder.ngdata.no/2496/meny/medium.jpg"),
    Product(2,
        name: "Kanelboller",
        price: 25,
        asset:
            "https://bilder.kolonial.no/produkter/5797d26d-d7f0-4b8b-a47e-aa37fa0c8107.jpeg?fit=max&w=500&s=d7e04738ec0d24692ec73edfe7a4efff"),
  ],
  1: [
    Product(
      1,
      name: "Monster",
      price: 25,
      asset:
          "https://res.cloudinary.com/norgesgruppen/image/upload/c_pad,b_white,f_auto,h_840,w_840,q_auto:eco/v1588896641/Product/5060166693732.jpg",
    ),
    Product(3,
        name: "Monster",
        price: 25,
        asset:
            "https://res.cloudinary.com/norgesgruppen/image/upload/c_pad,b_white,f_auto,h_840,w_840,q_auto:eco/v1588810279/Product/5060517889937.jpg"),
  ],
};

class ProductsProvider extends ChangeNotifier {
  Future<List<Product>> getProducts(int groupId) async {
    if (!_products.containsKey(groupId)) {
      return [];
    }

    return _products[groupId]!;
  }

  addProduct(Product product, int groupId) async {
    _products[groupId]!.add(product);
    notifyListeners();
  }
}
