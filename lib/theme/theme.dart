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
      ).copyWith(
        surface: ColorConstants.lightBlack, // kolor tła pod elementami, AppBar
        onSurface: ColorConstants.cream, // wszystko co na głównym tle
        background: Colors.teal,  // kolor
        onBackground: Colors.black, // to co na backgroundzie
        // primary: Colors.green, // kolor czcionki
        error: Colors.purple,
      ),
      
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        // backgroundColor: ColorConstants.lightBlue,
        // selectedItemColor: ColorConstants.blue,
        // unselectedItemColor: ColorConstants.black,
        // selectedLabelStyle: const TextStyle(
        //   fontSize: 12,
        // ),
        // unselectedLabelStyle: const TextStyle(
        //   fontSize: 12,
        // ),
      // ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      // useMaterial3: true,
    );
  }
}