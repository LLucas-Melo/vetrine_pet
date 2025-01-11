import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.indigo,
      primaryColorLight: const Color.fromARGB(255, 195, 94, 219),
      primaryColorDark: Colors.blue.shade700,
      primaryColor: const Color.fromARGB(255, 85, 207, 194),
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        surface: Colors.grey.shade200,
        primary: const Color.fromARGB(255, 195, 94, 219),
        secondary: const Color.fromARGB(255, 85, 207, 194),
        tertiary: const Color.fromARGB(255, 197, 224, 255),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 195, 94, 219),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
