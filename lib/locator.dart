import 'package:get_it/get_it.dart';
import 'package:vetrine_pet/controller/cart_controller.dart';
import 'package:vetrine_pet/controller/favorite_controller.dart';

import 'controller/home_page_controller.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<HomePageController>(() => HomePageController());
  locator.registerSingleton<CartController>(CartController());
  locator.registerLazySingleton<FavoriteController>(() => FavoriteController());
}
