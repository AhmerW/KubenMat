import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kubenmat/models/product_model.dart';
import 'package:kubenmat/providers/cart_provider.dart';
import 'package:kubenmat/widgets/cart/cart_empty.dart';
import 'package:kubenmat/widgets/dialogs/info/product_info_dialog.dart';
import 'package:provider/provider.dart';

class CartProductsListWidget extends StatefulWidget {
  const CartProductsListWidget({Key? key}) : super(key: key);

  @override
  _CartProductsListWidgetState createState() => _CartProductsListWidgetState();
}

class _CartProductsListWidgetState extends State<CartProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return provider.products.isEmpty
            ? const EmptyCartWidget()
            : ListView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  Product product = provider.products[index];

                  return Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    constraints: const BoxConstraints(maxHeight: 150),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 2,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 150),
                              alignment: Alignment.centerLeft,
                              child: !product.hasAsset
                                  ? const Icon(Icons.error)
                                  : Image.network(product.asset!),
                            ),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () =>
                                            provider.removeProduct(product),
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return ProductInfoDialog(
                                                    product);
                                              });
                                        },
                                        icon: const Icon(Icons.info_outline,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    product.name,
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "${product.price * product.quantity}kr",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 50,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () => setState(() {
                                            if (product.quantity > 1) {
                                              product.quantity--;
                                              provider.update;
                                            }
                                          }),
                                          icon: const Icon(Icons.arrow_left),
                                        ),
                                        Text("${product.quantity}x"),
                                        IconButton(
                                          onPressed: () => setState(() {
                                            if (product.quantity < 100) {
                                              product.quantity++;
                                              provider.update;
                                            }
                                          }),
                                          icon: const Icon(Icons.arrow_right),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
