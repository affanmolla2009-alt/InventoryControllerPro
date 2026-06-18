import 'dart:io';

import 'package:excel/excel.dart';

import '../models/inventory.dart';
import '../services/sku_generator.dart';

class ExcelImportService {
  ExcelImportService._();

  static final ExcelImportService instance =
      ExcelImportService._();

  Future<List<Inventory>> importExcel(
    File file,
  ) async {
    final bytes =
        await file.readAsBytes();

    final excel =
        Excel.decodeBytes(bytes);

    final List<Inventory> inventory =
        [];

    for (final sheetName
        in excel.tables.keys) {
      final sheet =
          excel.tables[sheetName];

      if (sheet == null) {
        continue;
      }

      for (int row = 1;
          row < sheet.maxRows;
          row++) {
        final rows = sheet.rows[row];

        if (rows.isEmpty) {
          continue;
        }

        final sku =
            rows.length > 0 &&
                    rows[0]?.value !=
                        null
                ? rows[0]!
                    .value
                    .toString()
                : "";

        final fabric =
            rows.length > 1 &&
                    rows[1]?.value !=
                        null
                ? rows[1]!
                    .value
                    .toString()
                : "";

        final color =
            rows.length > 2 &&
                    rows[2]?.value !=
                        null
                ? rows[2]!
                    .value
                    .toString()
                : "";

        final quantity =
            rows.length > 3 &&
                    rows[3]?.value !=
                        null
                ? int.tryParse(
                      rows[3]!
                          .value
                          .toString(),
                    ) ??
                    0
                : 0;

        if (fabric.trim().isEmpty &&
            color.trim().isEmpty) {
          continue;
        }

        inventory.add(
          Inventory(
            id: null,
            sku: sku.isEmpty
                ? SkuGenerator.generate()
                : sku,
            fabric: fabric,
            color: color,
            quantity: quantity,
            notes: "",
            brandId: null,
            createdAt:
                DateTime.now(),
            updatedAt:
                DateTime.now(),
          ),
        );
      }
    }

    return inventory;
  }

  Future<List<String>>
      validateExcel(
    File file,
  ) async {
    final List<String> errors = [];

    final bytes =
        await file.readAsBytes();

    final excel =
        Excel.decodeBytes(bytes);

    if (excel.tables.isEmpty) {
      errors.add(
        "No worksheet found.",
      );
      return errors;
    }

    final sheet =
        excel.tables.values.first;

    if (sheet == null) {
      errors.add(
        "Worksheet is invalid.",
      );
      return errors;
    }

    if (sheet.maxRows <= 1) {
      errors.add(
        "No inventory records found.",
      );
      return errors;
    }

    return errors;
  }

  Future<bool> isValidExcel(
    File file,
  ) async {
    final errors =
        await validateExcel(file);

    return errors.isEmpty;
  }
}