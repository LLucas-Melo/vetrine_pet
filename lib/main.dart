import 'package:flutter/material.dart';
import 'package:vetrine_pet/controller/favorite_controller.dart';
import 'package:vetrine_pet/view/home_page.dart';
import 'package:vetrine_pet/theme/theme.dart';

import 'view/favorite_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.themeData,
      routes: {
        '/': (context) => const HomePage(),
        '/favorite': (context) => FavoritePage(
              controller: FavoriteController(),
            ),
      },
      //passando o argumento via rota
      onGenerateRoute: (settings) {
        if (settings.name == '/favorite') {
          return MaterialPageRoute(
            builder: (context) => FavoritePage(
              controller: settings.arguments as FavoriteController,
            ),
          );
        }
        return null;
      },
    );
  }
}
