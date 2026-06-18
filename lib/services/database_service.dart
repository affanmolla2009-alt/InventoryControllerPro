import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._();

  static final DatabaseService instance =
      DatabaseService._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath =
        await getDatabasesPath();

    final path = join(
      databasePath,
      "inventory_controller.db",
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {

    await db.execute('''
CREATE TABLE brands(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
description TEXT,
logo TEXT,
created_at TEXT
)
''');

    await db.execute('''
CREATE TABLE inventory(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
sku TEXT UNIQUE,
barcode TEXT,
brand_id INTEGER,
quantity INTEGER DEFAULT 0,
price REAL DEFAULT 0,
cost REAL DEFAULT 0,
description TEXT,
image TEXT,
created_at TEXT,
updated_at TEXT
)
''');

    await db.execute('''
CREATE TABLE categories(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
description TEXT
)
''');

    await db.execute('''
CREATE TABLE suppliers(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
phone TEXT,
email TEXT,
address TEXT
)
''');

    await db.execute('''
CREATE TABLE customers(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
phone TEXT,
email TEXT,
address TEXT
)
''');

    await db.execute('''
CREATE TABLE reports(
id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT,
created_at TEXT,
file_path TEXT
)
''');

    await db.execute('''
CREATE TABLE settings(
id INTEGER PRIMARY KEY AUTOINCREMENT,
theme TEXT,
currency TEXT,
low_stock_limit INTEGER
)
''');

    await db.execute('''
CREATE TABLE backups(
id INTEGER PRIMARY KEY AUTOINCREMENT,
file_name TEXT,
file_path TEXT,
created_at TEXT
)
''');
  }

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {

    if (oldVersion < 2) {

      // Future migration code

    }
  }

  Future<void> close() async {
    final db = await database;

    await db.close();

    _database = null;
  }

  Future<void> deleteDatabaseFile() async {
    final databasePath =
        await getDatabasesPath();

    final path = join(
      databasePath,
      "inventory_controller.db",
    );

    await deleteDatabase(path);

    _database = null;
  }
}