import 'package:flutter/material.dart';
import 'package:kubenmat/models/product_model.dart';

class ProductInfoDialog extends StatelessWidget {
  final Product product;
  const ProductInfoDialog(this.product);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(product.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text(product.description ?? 'ingen info')],
      ),
    );
  }
}
