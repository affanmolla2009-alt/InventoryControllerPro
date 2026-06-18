import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../database/inventory_table.dart';
import '../models/inventory.dart';

class InventoryRepository {
  InventoryRepository._();

  static final InventoryRepository instance =
      InventoryRepository._();

  final DatabaseHelper _databaseHelper =
      DatabaseHelper.instance;

  Future<int> insert(
    Inventory inventory,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.insert(
      InventoryTable.tableName,
      inventory.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace,
    );
  }

  Future<List<Inventory>> getAll() async {
    final Database db =
        await _databaseHelper.database;

    final List<Map<String, dynamic>> result =
        await db.query(
      InventoryTable.tableName,
      orderBy:
          '${InventoryTable.updatedAt} DESC',
    );

    return result
        .map(
          (e) => Inventory.fromMap(e),
        )
        .toList();
  }

  Future<Inventory?> getById(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      InventoryTable.tableName,
      where: '${InventoryTable.id} = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Inventory.fromMap(
      result.first,
    );
  }

  Future<Inventory?> getBySku(
    String sku,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      InventoryTable.tableName,
      where: '${InventoryTable.sku} = ?',
      whereArgs: [sku],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Inventory.fromMap(
      result.first,
    );
  }

  Future<List<Inventory>> search(
    String keyword,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      InventoryTable.tableName,
      where:
          '${InventoryTable.sku} LIKE ? OR '
          '${InventoryTable.fabric} LIKE ? OR '
          '${InventoryTable.color} LIKE ?',
      whereArgs: [
        '%$keyword%',
        '%$keyword%',
        '%$keyword%',
      ],
    );

    return result
        .map(
          (e) => Inventory.fromMap(e),
        )
        .toList();
  }

  Future<int> update(
    Inventory inventory,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      InventoryTable.tableName,
      inventory.toMap(),
      where:
          '${InventoryTable.id} = ?',
      whereArgs: [
        inventory.id,
      ],
    );
  }

  Future<int> updateQuantity(
    int id,
    int quantity,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      InventoryTable.tableName,
      {
        InventoryTable.quantity:
            quantity,
        InventoryTable.updatedAt:
            DateTime.now()
                .toIso8601String(),
      },
      where:
          '${InventoryTable.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> increaseQuantity(
    int id,
  ) async {
    final item =
        await getById(id);

    if (item == null) {
      return 0;
    }

    return await updateQuantity(
      id,
      item.quantity + 1,
    );
  }

  Future<int> decreaseQuantity(
    int id,
  ) async {
    final item =
        await getById(id);

    if (item == null) {
      return 0;
    }

    int newQuantity =
        item.quantity - 1;

    if (newQuantity < 0) {
      newQuantity = 0;
    }

    return await updateQuantity(
      id,
      newQuantity,
    );
  }

  Future<List<Inventory>>
      getLowStock(
    int threshold,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      InventoryTable.tableName,
      where:
          '${InventoryTable.quantity} <= ?',
      whereArgs: [threshold],
      orderBy:
          '${InventoryTable.quantity} ASC',
    );

    return result
        .map(
          (e) => Inventory.fromMap(e),
        )
        .toList();
  }

  Future<int> delete(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.delete(
      InventoryTable.tableName,
      where:
          '${InventoryTable.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final Database db =
        await _databaseHelper.database;

    await db.delete(
      InventoryTable.tableName,
    );
  }

  Future<int> totalItems() async {
    final Database db =
        await _databaseHelper.database;

    final result =
        await db.rawQuery(
      '''
SELECT COUNT(*)
FROM ${InventoryTable.tableName}
''',
    );

    return Sqflite.firstIntValue(
          result,
        ) ??
        0;
  }

  Future<int> totalQuantity() async {
    final Database db =
        await _databaseHelper.database;

    final result =
        await db.rawQuery(
      '''
SELECT SUM(quantity)
FROM ${InventoryTable.tableName}
''',
    );

    return Sqflite.firstIntValue(
          result,
        ) ??
        0;
  }
}