import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../database/brand_table.dart';
import '../models/brand.dart';

class BrandRepository {
  BrandRepository._();

  static final BrandRepository instance =
      BrandRepository._();

  final DatabaseHelper _databaseHelper =
      DatabaseHelper.instance;

  Future<int> insert(
    Brand brand,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.insert(
      BrandTable.tableName,
      brand.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace,
    );
  }

  Future<List<Brand>> getAll() async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      BrandTable.tableName,
      orderBy:
          '${BrandTable.businessName} ASC',
    );

    return result
        .map(
          (e) => Brand.fromMap(e),
        )
        .toList();
  }

  Future<Brand?> getById(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      BrandTable.tableName,
      where:
          '${BrandTable.id} = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Brand.fromMap(
      result.first,
    );
  }

  Future<Brand?> getDefaultBrand() async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      BrandTable.tableName,
      where:
          '${BrandTable.isDefault} = ?',
      whereArgs: [1],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Brand.fromMap(
      result.first,
    );
  }

  Future<int> update(
    Brand brand,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      BrandTable.tableName,
      brand.toMap(),
      where:
          '${BrandTable.id} = ?',
      whereArgs: [
        brand.id,
      ],
    );
  }

  Future<void> setDefaultBrand(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    await db.transaction(
      (txn) async {
        await txn.update(
          BrandTable.tableName,
          {
            BrandTable.isDefault: 0,
          },
        );

        await txn.update(
          BrandTable.tableName,
          {
            BrandTable.isDefault: 1,
          },
          where:
              '${BrandTable.id} = ?',
          whereArgs: [id],
        );
      },
    );
  }

  Future<List<Brand>> search(
    String keyword,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      BrandTable.tableName,
      where:
          '${BrandTable.businessName} LIKE ? OR '
          '${BrandTable.ownerName} LIKE ? OR '
          '${BrandTable.phone} LIKE ? OR '
          '${BrandTable.email} LIKE ?',
      whereArgs: [
        '%$keyword%',
        '%$keyword%',
        '%$keyword%',
        '%$keyword%',
      ],
    );

    return result
        .map(
          (e) => Brand.fromMap(e),
        )
        .toList();
  }

  Future<int> delete(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.delete(
      BrandTable.tableName,
      where:
          '${BrandTable.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final Database db =
        await _databaseHelper.database;

    await db.delete(
      BrandTable.tableName,
    );
  }

  Future<int> totalBrands() async {
    final Database db =
        await _databaseHelper.database;

    final result =
        await db.rawQuery(
      '''
SELECT COUNT(*)
FROM ${BrandTable.tableName}
''',
    );

    return Sqflite.firstIntValue(
          result,
        ) ??
        0;
  }

  Future<bool> hasAnyBrand() async {
    final count =
        await totalBrands();

    return count > 0;
  }
}