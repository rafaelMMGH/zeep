import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class ZeepTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFAF8F8),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF04001A),
  );
}
