import 'package:flutter/foundation.dart';

@immutable
class Settings {
  const Settings({
    this.id,
    required this.themeMode,
    required this.followSystemTheme,
    required this.lowStockThreshold,
    required this.defaultBrandId,
    required this.notificationsEnabled,
    required this.notificationSoundEnabled,
    required this.autoBackupEnabled,
    required this.languageCode,
    required this.defaultExportFormat,
    required this.defaultReportType,
    required this.soundEffectsEnabled,
    required this.analyticsEnabled,
    required this.barcodeEnabled,
    required this.qrScannerEnabled,
    required this.aiFeaturesEnabled,
    required this.cloudSyncEnabled,
  });

  final int? id;

  final String themeMode;

  final bool followSystemTheme;

  final int? defaultBrandId;

  final int lowStockThreshold;

  final bool notificationsEnabled;

  final bool notificationSoundEnabled;

  final bool autoBackupEnabled;

  final String languageCode;

  final String defaultExportFormat;

  final String defaultReportType;

  final bool soundEffectsEnabled;

  final bool analyticsEnabled;

  final bool barcodeEnabled;

  final bool qrScannerEnabled;

  final bool aiFeaturesEnabled;

  final bool cloudSyncEnabled;

  Settings copyWith({
    int? id,
    String? themeMode,
    bool? followSystemTheme,
    int? defaultBrandId,
    int? lowStockThreshold,
    bool? notificationsEnabled,
    bool? notificationSoundEnabled,
    bool? autoBackupEnabled,
    String? languageCode,
    String? defaultExportFormat,
    String? defaultReportType,
    bool? soundEffectsEnabled,
    bool? analyticsEnabled,
    bool? barcodeEnabled,
    bool? qrScannerEnabled,
    bool? aiFeaturesEnabled,
    bool? cloudSyncEnabled,
  }) {
    return Settings(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      followSystemTheme:
          followSystemTheme ?? this.followSystemTheme,
      defaultBrandId:
          defaultBrandId ?? this.defaultBrandId,
      lowStockThreshold:
          lowStockThreshold ?? this.lowStockThreshold,
      notificationsEnabled:
          notificationsEnabled ?? this.notificationsEnabled,
      notificationSoundEnabled:
          notificationSoundEnabled ??
              this.notificationSoundEnabled,
      autoBackupEnabled:
          autoBackupEnabled ?? this.autoBackupEnabled,
      languageCode:
          languageCode ?? this.languageCode,
      defaultExportFormat:
          defaultExportFormat ??
              this.defaultExportFormat,
      defaultReportType:
          defaultReportType ??
              this.defaultReportType,
      soundEffectsEnabled:
          soundEffectsEnabled ??
              this.soundEffectsEnabled,
      analyticsEnabled:
          analyticsEnabled ??
              this.analyticsEnabled,
      barcodeEnabled:
          barcodeEnabled ?? this.barcodeEnabled,
      qrScannerEnabled:
          qrScannerEnabled ??
              this.qrScannerEnabled,
      aiFeaturesEnabled:
          aiFeaturesEnabled ??
              this.aiFeaturesEnabled,
      cloudSyncEnabled:
          cloudSyncEnabled ??
              this.cloudSyncEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'theme_mode': themeMode,
      'follow_system_theme':
          followSystemTheme ? 1 : 0,
      'default_brand_id': defaultBrandId,
      'low_stock_threshold':
          lowStockThreshold,
      'notifications_enabled':
          notificationsEnabled ? 1 : 0,
      'notification_sound_enabled':
          notificationSoundEnabled ? 1 : 0,
      'auto_backup_enabled':
          autoBackupEnabled ? 1 : 0,
      'language_code': languageCode,
      'default_export_format':
          defaultExportFormat,
      'default_report_type':
          defaultReportType,
      'sound_effects_enabled':
          soundEffectsEnabled ? 1 : 0,
      'analytics_enabled':
          analyticsEnabled ? 1 : 0,
      'barcode_enabled':
          barcodeEnabled ? 1 : 0,
      'qr_scanner_enabled':
          qrScannerEnabled ? 1 : 0,
      'ai_features_enabled':
          aiFeaturesEnabled ? 1 : 0,
      'cloud_sync_enabled':
          cloudSyncEnabled ? 1 : 0,
    };
  }

  factory Settings.fromMap(
    Map<String, dynamic> map,
  ) {
    return Settings(
      id: map['id'] as int?,
      themeMode:
          map['theme_mode'] as String? ?? 'dark',
      followSystemTheme:
          (map['follow_system_theme'] ?? 1) == 1,
      defaultBrandId:
          map['default_brand_id'] as int?,
      lowStockThreshold:
          map['low_stock_threshold'] as int? ?? 5,
      notificationsEnabled:
          (map['notifications_enabled'] ?? 1) == 1,
      notificationSoundEnabled:
          (map['notification_sound_enabled'] ?? 1) ==
              1,
      autoBackupEnabled:
          (map['auto_backup_enabled'] ?? 0) == 1,
      languageCode:
          map['language_code'] as String? ?? 'en',
      defaultExportFormat:
          map['default_export_format']
                  as String? ??
              'xlsx',
      defaultReportType:
          map['default_report_type']
                  as String? ??
              'monthly',
      soundEffectsEnabled:
          (map['sound_effects_enabled'] ?? 1) == 1,
      analyticsEnabled:
          (map['analytics_enabled'] ?? 1) == 1,
      barcodeEnabled:
          (map['barcode_enabled'] ?? 0) == 1,
      qrScannerEnabled:
          (map['qr_scanner_enabled'] ?? 0) == 1,
      aiFeaturesEnabled:
          (map['ai_features_enabled'] ?? 0) == 1,
      cloudSyncEnabled:
          (map['cloud_sync_enabled'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory Settings.fromJson(
    Map<String, dynamic> json,
  ) {
    return Settings.fromMap(json);
  }

  @override
  String toString() {
    return 'Settings(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return other is Settings &&
        other.id == id &&
        other.themeMode == themeMode &&
        other.followSystemTheme ==
            followSystemTheme &&
        other.defaultBrandId ==
            defaultBrandId &&
        other.lowStockThreshold ==
            lowStockThreshold &&
        other.notificationsEnabled ==
            notificationsEnabled &&
        other.notificationSoundEnabled ==
            notificationSoundEnabled &&
        other.autoBackupEnabled ==
            autoBackupEnabled &&
        other.languageCode ==
            languageCode &&
        other.defaultExportFormat ==
            defaultExportFormat &&
        other.defaultReportType ==
            defaultReportType &&
        other.soundEffectsEnabled ==
            soundEffectsEnabled &&
        other.analyticsEnabled ==
            analyticsEnabled &&
        other.barcodeEnabled ==
            barcodeEnabled &&
        other.qrScannerEnabled ==
            qrScannerEnabled &&
        other.aiFeaturesEnabled ==
            aiFeaturesEnabled &&
        other.cloudSyncEnabled ==
            cloudSyncEnabled;
  }

  @override
  int get hashCode => Object.hash(
        id,
        themeMode,
        followSystemTheme,
        defaultBrandId,
        lowStockThreshold,
        notificationsEnabled,
        notificationSoundEnabled,
        autoBackupEnabled,
        languageCode,
        defaultExportFormat,
        defaultReportType,
        soundEffectsEnabled,
        analyticsEnabled,
        barcodeEnabled,
        qrScannerEnabled,
        aiFeaturesEnabled,
        cloudSyncEnabled,
      );
}