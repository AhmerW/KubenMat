import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kubenmat/providers/cart_provider.dart';
import 'package:kubenmat/providers/orders_provider.dart';
import 'package:kubenmat/providers/products_provider.dart';
import 'package:kubenmat/services/router.dart';
import 'package:kubenmat/services/services.dart';
import 'package:kubenmat/views/home.dart';
import 'package:provider/provider.dart';

final locator = GetIt.instance;
void main() {
  defineRoutes();
  registerServices();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: const KubenMat(),
    ),
  );
}

class KubenMat extends StatelessWidget {
  const KubenMat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KubenMat',
        onGenerateRoute: router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // Home returns a futurebuilder
        home: const HomeView());
  }
}
