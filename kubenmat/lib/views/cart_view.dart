import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kubenmat/models/product_model.dart';
import 'package:kubenmat/providers/cart_provider.dart';
import 'package:kubenmat/services/price_service.dart';
import 'package:kubenmat/widgets/cart/cart_products_list.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Handlekurv"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              Provider.of<CartProvider>(context, listen: false).clear();
            }),
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: Column(
        children: [
          const Flexible(
            flex: 7,
            fit: FlexFit.tight,
            child: CartProductsListWidget(),
          ),
          Provider.of<CartProvider>(context).products.isEmpty
              ? const SizedBox.shrink()
              : Flexible(
                  flex: 3,
                  child: Selector<CartProvider, int>(
                    selector: (_, provider) => provider.total,
                    builder: (
                      context,
                      value,
                      _,
                    ) {
                      PriceService priceService =
                          GetIt.instance<PriceService>();
                      int deliveryCost = priceService.getDeliveryCost(value);
                      return PhysicalModel(
                        color: Colors.white,
                        elevation: 20,
                        child: ListView(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "Rabattkode",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.local_offer,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            SumValueWidget("Produkter pris", "$value kr"),
                            SumValueWidget(
                                "Leverings kostnader", "$deliveryCost kr"),
                            const Divider(),
                            SumValueWidget(
                                "Total", "${value + deliveryCost} kr"),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 100,
                              ),
                              height: 100,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text("Fortsett til utsjekking"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class SumValueWidget extends StatelessWidget {
  final String text, value;
  const SumValueWidget(this.text, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          child: Text(text),
          padding: const EdgeInsets.only(left: 20),
        ),
        Padding(
          child: Text(value),
          padding: const EdgeInsets.only(right: 20),
        ),
      ],
    );
  }
}
