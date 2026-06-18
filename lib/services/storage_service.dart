import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class StorageService {
  StorageService._();

  static final StorageService instance =
      StorageService._();

  /// Root Folder
  Future<Directory> getRootDirectory() async {
    final Directory appDir =
        await getApplicationDocumentsDirectory();

    final Directory root = Directory(
      path.join(
        appDir.path,
        "InventoryController",
      ),
    );

    if (!await root.exists()) {
      await root.create(
        recursive: true,
      );
    }

    return root;
  }

  /// Exports

  Future<Directory> getExportsDirectory() async {
    final root = await getRootDirectory();

    final dir = Directory(
      path.join(
        root.path,
        "Exports",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  Future<Directory> getExcelDirectory() async {
    final exports =
        await getExportsDirectory();

    final dir = Directory(
      path.join(
        exports.path,
        "Excel",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  Future<Directory> getPngDirectory() async {
    final exports =
        await getExportsDirectory();

    final dir = Directory(
      path.join(
        exports.path,
        "PNG",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  /// Reports

  Future<Directory> getReportsDirectory() async {
    final root =
        await getRootDirectory();

    final dir = Directory(
      path.join(
        root.path,
        "Reports",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  /// Templates

  Future<Directory> getTemplatesDirectory() async {
    final root =
        await getRootDirectory();

    final dir = Directory(
      path.join(
        root.path,
        "Templates",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  /// Shared

  Future<Directory> getSharedDirectory() async {
    final root =
        await getRootDirectory();

    final dir = Directory(
      path.join(
        root.path,
        "Shared",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  /// Brands

  Future<Directory> getBrandsDirectory() async {
    final root =
        await getRootDirectory();

    final dir = Directory(
      path.join(
        root.path,
        "Brands",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  Future<Directory> getLogosDirectory() async {
    final brands =
        await getBrandsDirectory();

    final dir = Directory(
      path.join(
        brands.path,
        "Logos",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  /// Backup

  Future<Directory> getBackupRootDirectory() async {
    final root =
        await getRootDirectory();

    final dir = Directory(
      path.join(
        root.path,
        "Backup",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  Future<Directory>
      getDatabaseBackupDirectory() async {
    final backup =
        await getBackupRootDirectory();

    final dir = Directory(
      path.join(
        backup.path,
        "Database",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  Future<Directory>
      getSettingsBackupDirectory() async {
    final backup =
        await getBackupRootDirectory();

    final dir = Directory(
      path.join(
        backup.path,
        "Settings",
      ),
    );

    if (!await dir.exists()) {
      await dir.create(
        recursive: true,
      );
    }

    return dir;
  }

  /// Create every folder

  Future<void> initializeStorage()
      async {
    await getExcelDirectory();

    await getPngDirectory();

    await getReportsDirectory();

    await getTemplatesDirectory();

    await getSharedDirectory();

    await getLogosDirectory();

    await getDatabaseBackupDirectory();

    await getSettingsBackupDirectory();
  }

  /// Calculate total storage used

  Future<int> totalStorageUsed()
      async {
    final root =
        await getRootDirectory();

    int total = 0;

    await for (final entity
        in root.list(
      recursive: true,
    )) {
      if (entity is File) {
        total += await entity.length();
      }
    }

    return total;
  }

  /// Delete cache folders

  Future<void> clearExports()
      async {
    final exports =
        await getExportsDirectory();

    if (await exports.exists()) {
      await exports.delete(
        recursive: true,
      );

      await exports.create(
        recursive: true,
      );
    }
  }
}