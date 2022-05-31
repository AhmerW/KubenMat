import 'package:flutter/material.dart';
import 'package:kubenmat/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      shadowColor: Colors.green,
      elevation: 2,
      child: Column(
        children: [
          Flexible(
            flex: 13,
            child: product.hasAsset
                ? Image.network(
                    product.asset!,
                    fit: BoxFit.fill,
                  )
                : const Text("No image"),
          ),
          Flexible(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${product.price} kr",
                  style: const TextStyle(fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
