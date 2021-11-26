import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  return ThemeData.light().copyWith(
    primaryColor: const Color(0xFF9C6D2C),
    scaffoldBackgroundColor: const Color(0xFFB2D98A),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const StadiumBorder(
              side: BorderSide(
                width: 0.5,
                style: BorderStyle.solid,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 24,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF9C6D2C),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      floatingLabelStyle: const TextStyle(color: Color(0xFF9C6D2C)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    ),
  );
}
