import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/report.dart';

class ReportRepository {
  ReportRepository._();

  static final ReportRepository instance =
      ReportRepository._();

  final DatabaseHelper _databaseHelper =
      DatabaseHelper.instance;

  static const String tableName = 'reports';

  Future<int> insert(
    Report report,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.insert(
      tableName,
      report.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace,
    );
  }

  Future<List<Report>> getAll() async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      tableName,
      orderBy: 'generated_at DESC',
    );

    return result
        .map(
          (e) => Report.fromMap(e),
        )
        .toList();
  }

  Future<Report?> getById(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return Report.fromMap(
      result.first,
    );
  }

  Future<List<Report>> getByBrand(
    int brandId,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      tableName,
      where: 'brand_id = ?',
      whereArgs: [brandId],
      orderBy: 'generated_at DESC',
    );

    return result
        .map(
          (e) => Report.fromMap(e),
        )
        .toList();
  }

  Future<List<Report>> getByType(
    String reportType,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      tableName,
      where: 'report_type = ?',
      whereArgs: [reportType],
      orderBy: 'generated_at DESC',
    );

    return result
        .map(
          (e) => Report.fromMap(e),
        )
        .toList();
  }

  Future<List<Report>> getSharedReports()
      async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      tableName,
      where: 'is_shared = ?',
      whereArgs: [1],
      orderBy: 'generated_at DESC',
    );

    return result
        .map(
          (e) => Report.fromMap(e),
        )
        .toList();
  }

  Future<int> update(
    Report report,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      tableName,
      report.toMap(),
      where: 'id = ?',
      whereArgs: [report.id],
    );
  }

  Future<int> markAsShared(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.update(
      tableName,
      {
        'is_shared': 1,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(
    int id,
  ) async {
    final Database db =
        await _databaseHelper.database;

    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final Database db =
        await _databaseHelper.database;

    await db.delete(
      tableName,
    );
  }

  Future<int> totalReports() async {
    final Database db =
        await _databaseHelper.database;

    final result =
        await db.rawQuery(
      '''
SELECT COUNT(*)

FROM reports
''',
    );

    return Sqflite.firstIntValue(
          result,
        ) ??
        0;
  }

  Future<List<Report>> getBetweenDates(
    DateTime start,
    DateTime end,
  ) async {
    final Database db =
        await _databaseHelper.database;

    final result = await db.query(
      tableName,
      where:
          'generated_at >= ? AND generated_at <= ?',
      whereArgs: [
        start.toIso8601String(),
        end.toIso8601String(),
      ],
      orderBy: 'generated_at DESC',
    );

    return result
        .map(
          (e) => Report.fromMap(e),
        )
        .toList();
  }
}