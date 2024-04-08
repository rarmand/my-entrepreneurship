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
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConstants.lightBlue,
      ),
      brightness: Brightness.light,
      useMaterial3: true,

      textTheme: const TextTheme(

      ),
      iconTheme: IconThemeData(
        color: ColorConstants.black,
        size: 24,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConstants.lightBlue,
        selectedItemColor: ColorConstants.blue,
        unselectedItemColor: ColorConstants.black,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,

      textTheme: const TextTheme(
        
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 232, 230, 230),
        size: 24,
      ),
    );
  }
}