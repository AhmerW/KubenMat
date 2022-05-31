import 'package:get_it/get_it.dart';
import 'package:kubenmat/services/admin_service.dart';
import 'package:kubenmat/services/auth_service.dart';
import 'package:kubenmat/services/price_service.dart';

registerServices() {
  GetIt.I.registerLazySingleton<AuthService>(() => AuthService());
  GetIt.I.registerLazySingleton<AdminService>(() => AdminService());
  GetIt.I.registerLazySingleton<PriceService>(() => PriceService());
}
