import 'package:flutter/material.dart';
import 'package:kubenmat/data/theme.dart';

import 'package:kubenmat/services/router.dart';
import 'package:kubenmat/views/orders_view.dart';

import 'package:kubenmat/widgets/dialogs/admin/admin_enter_dialog.dart';

import 'package:kubenmat/widgets/dialogs/info/how_dialog.dart';
import 'package:kubenmat/widgets/dialogs/info/tos_dialog.dart';
import 'package:kubenmat/widgets/products/products_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KubenMat"),
        centerTitle: true,
        actions: [
          const OrdersButtonWidget(),
          IconButton(
            onPressed: () => router.navigateTo(context, "/cart"),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: themeColor,
          child: ListView(
            children: [
              Image.asset("assets/logo/KubenMat.png"),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const HowDialog(),
                  ),
                  child: const Text("Hvordan fungerer det?"),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Kontakt oss",
                ),
              ),
              /* Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Consumer<PriceService>(builder: (context, aup, _) {
                  if (!aup.isLoggedIn) {
                    return ElevatedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AuthLoginDialog(),
                      ),
                      child: const Text("Logg inn"),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () => locator<AuthService>().signOut(),
                    child: const Text("Logg ut"),
                  );
                }),
              ), */
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const AdminEnterDialog(),
                ),
                child: const Text("Kontroll panel"),
              ),
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const TOSDialog(),
                ),
                child: const Text("Vilkår og betingelser"),
              )
            ],
          ),
        ),
      ),
      body: const ProductsList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class OrdersButtonWidget extends StatelessWidget {
  const OrdersButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const OrdersView(),
        );
      },
      icon: const Icon(Icons.shopping_bag),
    );
  }
}
