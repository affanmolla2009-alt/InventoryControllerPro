import 'package:flutter/foundation.dart';

import '../models/settings.dart';
import '../repositories/settings_repository.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider({
    required SettingsRepository repository,
  }) : _repository = repository;

  final SettingsRepository _repository;

  Settings? _settings;

  bool _isLoading = false;

  Settings? get settings => _settings;

  bool get isLoading => _isLoading;

  Future<void> loadSettings() async {
    _isLoading = true;

    notifyListeners();

    _settings =
        await _repository.getSettings();

    _isLoading = false;

    notifyListeners();
  }

  Future<void> saveSettings(
    Settings settings,
  ) async {
    _isLoading = true;

    notifyListeners();

    await _repository.saveSettings(
      settings,
    );

    _settings = settings;

    _isLoading = false;

    notifyListeners();
  }

  Future<void> updateThemeMode(
    String themeMode,
  ) async {
    if (_settings == null) {
      return;
    }

    final updated =
        _settings!.copyWith(
      themeMode: themeMode,
    );

    await saveSettings(
      updated,
    );
  }

  Future<void> updateNotificationThreshold(
    int threshold,
  ) async {
    if (_settings == null) {
      return;
    }

    final updated =
        _settings!.copyWith(
      notificationThreshold:
          threshold,
    );

    await saveSettings(
      updated,
    );
  }

  Future<void> updateDefaultBrand(
    int brandId,
  ) async {
    if (_settings == null) {
      return;
    }

    final updated =
        _settings!.copyWith(
      defaultBrand: brandId,
    );

    await saveSettings(
      updated,
    );
  }

  Future<void> updateAutoBackup(
    bool enabled,
  ) async {
    if (_settings == null) {
      return;
    }

    final updated =
        _settings!.copyWith(
      autoBackup: enabled,
    );

    await saveSettings(
      updated,
    );
  }

  Future<void> updateLanguage(
    String language,
  ) async {
    if (_settings == null) {
      return;
    }

    final updated =
        _settings!.copyWith(
      language: language,
    );

    await saveSettings(
      updated,
    );
  }

  Future<void> resetToDefault() async {
    final defaultSettings =
        Settings(
      id: 1,
      themeMode: "system",
      notificationThreshold: 5,
      defaultBrand: 1,
      autoBackup: true,
      language: "en",
    );

    await saveSettings(
      defaultSettings,
    );
  }

  Future<void> refresh() async {
    await loadSettings();
  }
}