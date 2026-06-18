import 'package:flutter/material.dart';

import '../services/theme_service.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider();

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDark =>
      _themeMode == ThemeMode.dark;

  bool get isLight =>
      _themeMode == ThemeMode.light;

  bool get isSystem =>
      _themeMode == ThemeMode.system;

  Future<void> loadTheme() async {
    _themeMode =
        await ThemeService.instance.getThemeMode();

    notifyListeners();
  }

  Future<void> setSystemTheme() async {
    await ThemeService.instance.saveTheme(
      AppThemeMode.system,
    );

    _themeMode = ThemeMode.system;

    notifyListeners();
  }

  Future<void> setLightTheme() async {
    await ThemeService.instance.saveTheme(
      AppThemeMode.light,
    );

    _themeMode = ThemeMode.light;

    notifyListeners();
  }

  Future<void> setDarkTheme() async {
    await ThemeService.instance.saveTheme(
      AppThemeMode.dark,
    );

    _themeMode = ThemeMode.dark;

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      await setLightTheme();
    } else {
      await setDarkTheme();
    }
  }

  Future<void> reset() async {
    await setSystemTheme();
  }
}