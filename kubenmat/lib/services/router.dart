import 'package:fluro/fluro.dart';
import 'package:kubenmat/views/admin/admin_view.dart';
import 'package:kubenmat/views/cart_view.dart';
import 'package:kubenmat/views/home.dart';

final router = FluroRouter();

var homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
  return const HomeView();
});

var cartHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
  return const CartView();
});

void defineRoutes() {
  router.define("/home", handler: homeHandler);
  router.define("/cart", handler: cartHandler);
}
