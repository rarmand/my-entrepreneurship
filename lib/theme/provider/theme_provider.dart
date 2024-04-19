import 'package:flutter/material.dart';

import '../app_theme/app_theme.dart';

// TODO: how to keep it saved in settings?
class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightMode;
  bool _isDarkMode = false; 
  
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = isDarkMode ? AppTheme.lightMode : AppTheme.darkMode;
    isDarkMode = !isDarkMode;
  }
}