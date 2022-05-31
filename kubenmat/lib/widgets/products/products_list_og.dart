import 'package:flutter/material.dart';
import 'package:kubenmat/models/product_model.dart';
import 'package:kubenmat/providers/cart_provider.dart';
import 'package:kubenmat/providers/products_provider.dart';
import 'package:kubenmat/widgets/products/product_widget.dart';
import 'package:provider/provider.dart';

Widget productView(int group_id) {
  return Consumer<ProductsProvider>(
    builder: (context, provider, _) {
      return FutureBuilder(
        future: provider.getProducts(group_id),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text("Klarte ikke å finne produkter.."),
            );
          }
          List<Product> products =
              snapshot.data == null ? [] : (snapshot.data as List<Product>);

          if (products.isEmpty) {
            return const Center(
              child: Text("Ingen produkter funnet!"),
            );
          }

          if (products.isNotEmpty) {
            return GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                childAspectRatio: 1,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addProduct(
                            products[index],
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content:
                                  Text("Produktet er lagt til handlekurven!"),
                            ),
                          );
                        },
                        child: ProductWidget(products[index]),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlue,
            ),
          );
        },
      );
    },
  );
}
