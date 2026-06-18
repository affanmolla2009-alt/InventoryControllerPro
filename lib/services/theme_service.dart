import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

class ThemeService {
  ThemeService._();

  static final ThemeService instance =
      ThemeService._();

  static const String _themeKey =
      "theme_mode";

  /// Save theme mode
  Future<void> saveTheme(
    AppThemeMode mode,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      _themeKey,
      mode.name,
    );
  }

  /// Load saved theme mode
  Future<AppThemeMode> loadTheme()
      async {
    final prefs =
        await SharedPreferences.getInstance();

    final value =
        prefs.getString(_themeKey);

    switch (value) {
      case "light":
        return AppThemeMode.light;

      case "dark":
        return AppThemeMode.dark;

      default:
        return AppThemeMode.system;
    }
  }

  /// Convert to Flutter ThemeMode
  Future<ThemeMode> getThemeMode()
      async {
    final mode =
        await loadTheme();

    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;

      case AppThemeMode.dark:
        return ThemeMode.dark;

      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  /// Check if dark mode
  Future<bool> isDarkMode()
      async {
    final mode =
        await loadTheme();

    return mode ==
        AppThemeMode.dark;
  }

  /// Toggle light/dark
  Future<AppThemeMode> toggleTheme()
      async {
    final current =
        await loadTheme();

    if (current ==
        AppThemeMode.light) {
      await saveTheme(
        AppThemeMode.dark,
      );

      return AppThemeMode.dark;
    }

    await saveTheme(
      AppThemeMode.light,
    );

    return AppThemeMode.light;
  }

  /// Reset to system theme
  Future<void> resetTheme()
      async {
    await saveTheme(
      AppThemeMode.system,
    );
  }
}