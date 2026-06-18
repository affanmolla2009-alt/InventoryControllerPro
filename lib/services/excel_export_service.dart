import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path/path.dart' as path;

import '../models/brand.dart';
import '../models/inventory.dart';

class ExcelExportService {
  ExcelExportService._();

  static final ExcelExportService instance =
      ExcelExportService._();

  Future<File> exportInventory({
    required List<Inventory> inventoryList,
    required Brand brand,
    required Directory exportDirectory,
    required String reportTitle,
  }) async {
    final excel = Excel.createExcel();

    final Sheet sheet = excel['Inventory Report'];

    // Company Information

    sheet
        .cell(CellIndex.indexByString("A1"))
        .value = TextCellValue(
      brand.businessName,
    );

    sheet
        .cell(CellIndex.indexByString("A2"))
        .value = TextCellValue(
      brand.address,
    );

    sheet
        .cell(CellIndex.indexByString("A3"))
        .value = TextCellValue(
      "Phone : ${brand.phone}",
    );

    sheet
        .cell(CellIndex.indexByString("A4"))
        .value = TextCellValue(
      "Email : ${brand.email}",
    );

    sheet
        .cell(CellIndex.indexByString("A5"))
        .value = TextCellValue(
      "GST : ${brand.gstNumber}",
    );

    sheet
        .cell(CellIndex.indexByString("A7"))
        .value = TextCellValue(
      reportTitle,
    );

    // Header

    sheet
        .cell(CellIndex.indexByString("A9"))
        .value = TextCellValue("SKU");

    sheet
        .cell(CellIndex.indexByString("B9"))
        .value = TextCellValue("Fabric");

    sheet
        .cell(CellIndex.indexByString("C9"))
        .value = TextCellValue("Color");

    sheet
        .cell(CellIndex.indexByString("D9"))
        .value = TextCellValue("Quantity");

    int row = 10;

    int totalQuantity = 0;

    for (final item in inventoryList) {
      sheet
          .cell(
            CellIndex.indexByColumnRow(
              columnIndex: 0,
              rowIndex: row - 1,
            ),
          )
          .value = TextCellValue(
        item.sku,
      );

      sheet
          .cell(
            CellIndex.indexByColumnRow(
              columnIndex: 1,
              rowIndex: row - 1,
            ),
          )
          .value = TextCellValue(
        item.fabric,
      );

      sheet
          .cell(
            CellIndex.indexByColumnRow(
              columnIndex: 2,
              rowIndex: row - 1,
            ),
          )
          .value = TextCellValue(
        item.color,
      );

      sheet
          .cell(
            CellIndex.indexByColumnRow(
              columnIndex: 3,
              rowIndex: row - 1,
            ),
          )
          .value = IntCellValue(
        item.quantity,
      );

      totalQuantity += item.quantity;

      row++;
    }

    row++;

    sheet
        .cell(
          CellIndex.indexByColumnRow(
            columnIndex: 0,
            rowIndex: row,
          ),
        )
        .value = TextCellValue(
      "Total Items",
    );

    sheet
        .cell(
          CellIndex.indexByColumnRow(
            columnIndex: 1,
            rowIndex: row,
          ),
        )
        .value = IntCellValue(
      inventoryList.length,
    );

    row++;

    sheet
        .cell(
          CellIndex.indexByColumnRow(
            columnIndex: 0,
            rowIndex: row,
          ),
        )
        .value = TextCellValue(
      "Total Quantity",
    );

    sheet
        .cell(
          CellIndex.indexByColumnRow(
            columnIndex: 1,
            rowIndex: row,
          ),
        )
        .value = IntCellValue(
      totalQuantity,
    );

    row += 2;

    sheet
        .cell(
          CellIndex.indexByColumnRow(
            columnIndex: 0,
            rowIndex: row,
          ),
        )
        .value = TextCellValue(
      brand.footer,
    );

    final fileName =
        "${DateTime.now().millisecondsSinceEpoch}.xlsx";

    final file = File(
      path.join(
        exportDirectory.path,
        fileName,
      ),
    );

    final bytes = excel.save();

    if (bytes == null) {
      throw Exception(
        "Unable to generate Excel file.",
      );
    }

    await file.writeAsBytes(bytes);

    return file;
  }
}