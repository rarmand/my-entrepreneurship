import 'package:flutter/material.dart';

class ColorConstants {
  static Color black = const Color.fromARGB(255, 25, 36, 40);
  static Color lightBlack = const Color.fromARGB(255, 42, 46, 48);

  static Color darkBlue = const Color.fromARGB(255, 34, 51, 59);
  static Color blue = const Color.fromARGB(255, 12, 52, 61);
  static Color lightBlue = const Color.fromARGB(255, 212, 237, 244);

  static Color beige = const Color.fromARGB(255, 219, 210, 202);
  static Color cream = const Color.fromARGB(255, 245, 235, 213);
  static Color white = const Color.fromARGB(255, 232, 230, 230);
}

class AppTheme {
  static ThemeData get lightMode {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        background: ColorConstants.white,
        primary: ColorConstants.blue,
        secondary: ColorConstants.lightBlue,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>( 
            ColorConstants.black
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0)
          ),
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: ColorConstants.black,
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
        ),
        border: const UnderlineInputBorder(),
        hintStyle: const TextStyle(
          height: 2.0
        ),
        filled: true,
        fillColor: ColorConstants.white,
      ),
    );
  }

  static ThemeData get darkMode {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        background: ColorConstants.lightBlack,
        primary: ColorConstants.white,
        secondary: ColorConstants.cream,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>( 
            ColorConstants.beige
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0)
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: ColorConstants.white,
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
        ),
        border: const UnderlineInputBorder(),
        hintStyle: const TextStyle(
          height: 2.0
        ),
        filled: true,
        fillColor: ColorConstants.lightBlack,
      ),
    );
  }
}