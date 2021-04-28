import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: commonTheme.primaryColor,
    accentColor: commonTheme.accentColor,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    appBarTheme: commonTheme.appBarTheme.copyWith(
      backgroundColor: Colors.white,
    ),
    inputDecorationTheme: commonTheme.inputDecorationTheme.copyWith(
      fillColor: Colors.amber[700].withOpacity(0.15),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: commonTheme.primaryColor,
    accentColor: commonTheme.accentColor,
    scaffoldBackgroundColor: const Color(0xFF242424),
    cardColor: const Color(0xFF303030),
    canvasColor: const Color(0xFF303030),
    appBarTheme: commonTheme.appBarTheme.copyWith(
      backgroundColor: const Color(0xFF2B2B2B),
    ),
    inputDecorationTheme: commonTheme.inputDecorationTheme.copyWith(
      fillColor: Colors.amber[700].withOpacity(0.15),
    ),
  );

  static ThemeData commonTheme = ThemeData(
    primaryColor: Colors.amber[700],
    accentColor: const Color(0xFF007460),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 3,
      iconTheme: IconThemeData(color: Colors.amber[700]),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      filled: true,
      // fillColor: Colors.amber[700].withOpacity(0.15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
