import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../database/settings_table.dart';
import '../models/settings.dart';

class SettingsRepository {
  SettingsRepository._();

  static final SettingsRepository instance =
      SettingsRepository._();

  final DatabaseHelper _databaseHelper =
      DatabaseHelper.instance;

  Future<int> insert(
    Settings settings,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.insert(
      SettingsTable.tableName,
      settings.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace,
    );
  }

  Future<Settings?> getSettings() async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      SettingsTable.tableName,
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Settings.fromMap(
      result.first,
    );
  }

  Future<int> update(
    Settings settings,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      settings.toMap(),
      where:
          '${SettingsTable.id} = ?',
      whereArgs: [
        settings.id,
      ],
    );
  }

  Future<int> updateThemeMode(
    String themeMode,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      {
        SettingsTable.themeMode:
            themeMode,
        SettingsTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
    );
  }

  Future<int> updateLowStockThreshold(
    int threshold,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      {
        SettingsTable.lowStockThreshold:
            threshold,
        SettingsTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
    );
  }

  Future<int> updateDefaultBrand(
    int? brandId,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      {
        SettingsTable.defaultBrandId:
            brandId,
        SettingsTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
    );
  }

  Future<int> updateNotificationStatus(
    bool enabled,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      {
        SettingsTable.notificationsEnabled:
            enabled ? 1 : 0,
        SettingsTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
    );
  }

  Future<int> updateAutoBackup(
    bool enabled,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      {
        SettingsTable.autoBackupEnabled:
            enabled ? 1 : 0,
        SettingsTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
    );
  }

  Future<int> updateLanguage(
    String languageCode,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      {
        SettingsTable.languageCode:
            languageCode,
        SettingsTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
    );
  }

  Future<int> updateExportFormat(
    String format,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      SettingsTable.tableName,
      {
        SettingsTable.defaultExportFormat:
            format,
        SettingsTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
    );
  }

  Future<int> resetToDefaults(
    Settings settings,
  ) async {
    final Database db =
        await _databaseHelper.database;

    await db.delete(
      SettingsTable.tableName,
    );

    return await db.insert(
      SettingsTable.tableName,
      settings.toMap(),
    );
  }

  Future<void> deleteAll() async {
    final Database db =
        await _databaseHelper.database;

    await db.delete(
      SettingsTable.tableName,
    );
  }

  Future<bool> exists() async {
    final Database db =
        await _databaseHelper.database;

    final result =
        await db.rawQuery(
      '''
SELECT COUNT(*)

FROM ${SettingsTable.tableName}
''',
    );

    return (Sqflite.firstIntValue(result) ?? 0) >
        0;
  }
}