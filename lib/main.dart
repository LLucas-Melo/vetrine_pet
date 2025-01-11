import 'package:flutter/material.dart';

import 'package:vetrine_pet/controller/cart_controller.dart';
import 'package:vetrine_pet/controller/favorite_controller.dart';
import 'package:vetrine_pet/locator.dart';
import 'package:vetrine_pet/view/cart_page.dart';
import 'package:vetrine_pet/view/home_page.dart';
import 'package:vetrine_pet/theme/theme.dart';

import 'controller/home_page_controller.dart';
import 'view/favorite_page.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.themeData,

      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              favoriteController: locator<FavoriteController>(),
              controller: locator<HomePageController>(),
              cartController: locator<CartController>(),
            ),
        '/favorite': (context) => FavoritePage(
              favorite: locator<FavoriteController>(),
            ),
        '/cart': (context) => CartPage(
              cartController: locator<CartController>(),
            ),
      },
      //passando o argumento via rota
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/favorite') {
      //     return MaterialPageRoute(
      //       builder: (context) => FavoritePage(
      //         controller: getIt<FavoriteController>(),
      //       ),
      //     );
      //   }
      //   if (settings.name == '/cart') {
      //     return MaterialPageRoute(
      //       builder: (context) => CartPage(
      //         controller: getIt<CartController>(),
      //       ),
      //     );
      //   }
      //   return null;
      // },
    );
  }
}
