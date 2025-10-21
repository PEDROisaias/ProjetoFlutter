import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(64, 211, 182, 1.0);
  static const Color lightGrayColor = Color.fromRGBO(217, 217, 217, 1.0);
  static const Color lightColor = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color lightTextColor = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color darkTextColor = Color.fromRGBO(18, 18, 18, 0.8);
  static const Color blueColor = Color.fromRGBO(28, 180, 242, 1.0);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightColor,
    fontFamily: 'Quicksand',

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightGrayColor,
      hintStyle: const TextStyle(color: lightTextColor, fontSize: 16),
      labelStyle: const TextStyle(color: lightTextColor, fontSize: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: primaryColor, width: 2.0),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: lightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: darkTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Quicksand',
      ),

      headlineLarge: TextStyle(
        color: blueColor,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        letterSpacing: 1.2,
        fontFamily: 'Quicksand',
      ),

      bodyMedium: TextStyle(
        color: darkTextColor,
        fontSize: 16,
        height: 1.5,
        fontFamily: 'Quicksand',
      ),

      titleLarge: TextStyle(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Quicksand',
      ),

      titleSmall: TextStyle(
        color: lightTextColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: 'Quicksand',
      ),
    ),
  );
}
