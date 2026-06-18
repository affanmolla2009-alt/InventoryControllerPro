import 'dart:io';

import 'package:path/path.dart' as path;

import 'storage_service.dart';

class BackupService {
  BackupService._();

  static final BackupService instance =
      BackupService._();

  final StorageService _storageService =
      StorageService.instance;

  /// Backup SQLite database
  Future<File> backupDatabase({
    required File databaseFile,
  }) async {
    final Directory backupDirectory =
        await _storageService
            .getDatabaseBackupDirectory();

    final String fileName =
        "inventory_backup_${DateTime.now().millisecondsSinceEpoch}.db";

    final File backupFile = File(
      path.join(
        backupDirectory.path,
        fileName,
      ),
    );

    await databaseFile.copy(
      backupFile.path,
    );

    return backupFile;
  }

  /// Restore SQLite database
  Future<void> restoreDatabase({
    required File backupFile,
    required File databaseFile,
  }) async {
    if (!await backupFile.exists()) {
      throw Exception(
        "Backup file not found.",
      );
    }

    await backupFile.copy(
      databaseFile.path,
    );
  }

  /// Backup settings JSON
  Future<File> backupSettings({
    required String json,
  }) async {
    final Directory backupDirectory =
        await _storageService
            .getSettingsBackupDirectory();

    final String fileName =
        "settings_backup_${DateTime.now().millisecondsSinceEpoch}.json";

    final File file = File(
      path.join(
        backupDirectory.path,
        fileName,
      ),
    );

    await file.writeAsString(
      json,
    );

    return file;
  }

  /// Restore settings JSON
  Future<String> restoreSettings({
    required File jsonFile,
  }) async {
    if (!await jsonFile.exists()) {
      throw Exception(
        "Settings backup not found.",
      );
    }

    return await jsonFile.readAsString();
  }

  /// Delete old backups
  Future<void> cleanOldBackups({
    int keepLatest = 10,
  }) async {
    final Directory directory =
        await _storageService
            .getBackupRootDirectory();

    final List<FileSystemEntity> files =
        directory.listSync();

    files.sort(
      (a, b) =>
          b.statSync().modified.compareTo(
                a.statSync().modified,
              ),
    );

    if (files.length <= keepLatest) {
      return;
    }

    for (
      int i = keepLatest;
      i < files.length;
      i++
    ) {
      await files[i].delete(
        recursive: true,
      );
    }
  }

  /// Check backup availability
  Future<bool> hasBackups() async {
    final Directory directory =
        await _storageService
            .getBackupRootDirectory();

    return directory.listSync().isNotEmpty;
  }

  /// Total backup files
  Future<int> totalBackups() async {
    final Directory directory =
        await _storageService
            .getBackupRootDirectory();

    return directory.listSync().length;
  }

  /// Delete every backup
  Future<void> deleteAllBackups() async {
    final Directory directory =
        await _storageService
            .getBackupRootDirectory();

    final files =
        directory.listSync();

    for (final file in files) {
      await file.delete(
        recursive: true,
      );
    }
  }
}