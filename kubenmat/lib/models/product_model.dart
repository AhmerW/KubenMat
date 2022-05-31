class ProductGroup {
  final int groupId;
  final String groupName;

  ProductGroup(
    this.groupId,
    this.groupName,
  );
}

class Product {
  final int productId;
  final int price;
  int quantity;

  final String name;
  final String? description;
  final String? asset;

  bool get hasAsset => asset != null;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["product_id"],
      name: json["name"],
      price: json["price"],
    );
  }

  Product(
    this.productId, {
    this.asset,
    this.description,
    this.quantity = 1,
    required this.name,
    required this.price,
  });
}
