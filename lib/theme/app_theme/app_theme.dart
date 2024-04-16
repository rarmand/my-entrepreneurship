import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        background: Colors.grey.shade400,
        primary: Colors.green.shade700,
        secondary: Colors.blue.shade500,
      ),
    );
  }

  static ThemeData get darkMode {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.green.shade600,
        secondary: Colors.blue.shade700,
      ),
    );
  }
}