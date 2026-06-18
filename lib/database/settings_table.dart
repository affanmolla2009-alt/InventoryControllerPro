class SettingsTable {
  const SettingsTable._();

  static const String tableName = 'settings';

  // Columns

  static const String id = 'id';

  static const String themeMode = 'theme_mode';

  static const String followSystemTheme =
      'follow_system_theme';

  static const String defaultBrandId =
      'default_brand_id';

  static const String lowStockThreshold =
      'low_stock_threshold';

  static const String notificationsEnabled =
      'notifications_enabled';

  static const String notificationSoundEnabled =
      'notification_sound_enabled';

  static const String autoBackupEnabled =
      'auto_backup_enabled';

  static const String languageCode =
      'language_code';

  static const String defaultExportFormat =
      'default_export_format';

  static const String defaultReportType =
      'default_report_type';

  static const String soundEffectsEnabled =
      'sound_effects_enabled';

  static const String analyticsEnabled =
      'analytics_enabled';

  static const String barcodeEnabled =
      'barcode_enabled';

  static const String qrScannerEnabled =
      'qr_scanner_enabled';

  static const String aiFeaturesEnabled =
      'ai_features_enabled';

  static const String cloudSyncEnabled =
      'cloud_sync_enabled';

  static const String createdAt =
      'created_at';

  static const String updatedAt =
      'updated_at';

  // SQL

  static const String createTable = '''
CREATE TABLE settings (

id INTEGER PRIMARY KEY AUTOINCREMENT,

theme_mode TEXT NOT NULL DEFAULT 'dark',

follow_system_theme INTEGER NOT NULL DEFAULT 1,

default_brand_id INTEGER,

low_stock_threshold INTEGER NOT NULL DEFAULT 5,

notifications_enabled INTEGER NOT NULL DEFAULT 1,

notification_sound_enabled INTEGER NOT NULL DEFAULT 1,

auto_backup_enabled INTEGER NOT NULL DEFAULT 0,

language_code TEXT NOT NULL DEFAULT 'en',

default_export_format TEXT NOT NULL DEFAULT 'xlsx',

default_report_type TEXT NOT NULL DEFAULT 'monthly',

sound_effects_enabled INTEGER NOT NULL DEFAULT 1,

analytics_enabled INTEGER NOT NULL DEFAULT 1,

barcode_enabled INTEGER NOT NULL DEFAULT 0,

qr_scanner_enabled INTEGER NOT NULL DEFAULT 0,

ai_features_enabled INTEGER NOT NULL DEFAULT 0,

cloud_sync_enabled INTEGER NOT NULL DEFAULT 0,

created_at TEXT NOT NULL,

updated_at TEXT NOT NULL,

FOREIGN KEY (default_brand_id)

REFERENCES brands(id)

ON DELETE SET NULL

ON UPDATE CASCADE

)
''';

  static const List<String> columns = [
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
    createdAt,
    updatedAt,
  ];
}