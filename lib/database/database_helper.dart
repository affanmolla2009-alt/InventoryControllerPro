import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'inventory_table.dart';
import 'brand_table.dart';
import 'settings_table.dart';
import 'migrations.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance =
      DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initializeDatabase();

    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    final databasePath =
        await getDatabasesPath();

    final path = join(
      databasePath,
      'inventory_controller_pro.db',
    );

    return await openDatabase(
      path,
      version: 1,

      onConfigure: (db) async {
        await db.execute(
          'PRAGMA foreign_keys = ON',
        );
      },

      onCreate: (db, version) async {
        await db.execute(
          InventoryTable.createTable,
        );

        await db.execute(
          BrandTable.createTable,
        );

        await db.execute(
          SettingsTable.createTable,
        );

        await DatabaseMigrations.createIndexes(
          db,
        );
      },

      onUpgrade:
          DatabaseMigrations.onUpgrade,
    );
  }

  Future<void> closeDatabase() async {
    final db = await database;

    await db.close();
  }

  Future<void> deleteDatabaseFile() async {
    final databasePath =
        await getDatabasesPath();

    final path = join(
      databasePath,
      'inventory_controller_pro.db',
    );

    await deleteDatabase(path);

    _database = null;
  }
}