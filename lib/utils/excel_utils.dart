import 'package:excel/excel.dart';

class ExcelUtils {
  ExcelUtils._();

  static List<String> getHeaders(
    Sheet sheet,
  ) {
    if (sheet.maxRows == 0) {
      return [];
    }

    return sheet
        .row(0)
        .map(
          (cell) => cell?.value
                  ?.toString() ??
              "",
        )
        .toList();
  }

  static List<List<dynamic>> getRows(
    Sheet sheet,
  ) {
    final List<List<dynamic>> rows = [];

    for (
      int i = 1;
      i < sheet.maxRows;
      i++
    ) {
      rows.add(
        sheet
            .row(i)
            .map(
              (cell) =>
                  cell?.value,
            )
            .toList(),
      );
    }

    return rows;
  }

  static List<Map<String, dynamic>>
      rowsToMap(
    Sheet sheet,
  ) {
    final headers =
        getHeaders(sheet);

    final List<Map<String, dynamic>>
        data = [];

    for (
      int i = 1;
      i < sheet.maxRows;
      i++
    ) {
      final row = sheet.row(i);

      final Map<String, dynamic>
          map = {};

      for (
        int j = 0;
        j < headers.length;
        j++
      ) {
        map[headers[j]] =
            j < row.length
                ? row[j]?.value
                : null;
      }

      data.add(map);
    }

    return data;
  }

  static bool validateHeaders(
    List<String> actual,
    List<String> expected,
  ) {
    if (actual.length <
        expected.length) {
      return false;
    }

    for (
      int i = 0;
      i < expected.length;
      i++
    ) {
      if (actual[i]
              .trim()
              .toLowerCase() !=
          expected[i]
              .trim()
              .toLowerCase()) {
        return false;
      }
    }

    return true;
  }

  static String cellToString(
    Data? cell,
  ) {
    return cell?.value
            ?.toString() ??
        "";
  }

  static int cellToInt(
    Data? cell,
  ) {
    return int.tryParse(
          cell?.value
                  ?.toString() ??
              "",
        ) ??
        0;
  }

  static double cellToDouble(
    Data? cell,
  ) {
    return double.tryParse(
          cell?.value
                  ?.toString() ??
              "",
        ) ??
        0.0;
  }

  static bool isSheetEmpty(
    Sheet sheet,
  ) {
    return sheet.maxRows == 0;
  }

  static List<String> getSheetNames(
    Excel excel,
  ) {
    return excel.tables.keys.toList();
  }

  static Sheet? getFirstSheet(
    Excel excel,
  ) {
    if (excel.tables.isEmpty) {
      return null;
    }

    return excel.tables.values.first;
  }

  static bool hasRequiredColumns(
    Sheet sheet,
    List<String> required,
  ) {
    final headers =
        getHeaders(sheet);

    for (final column
        in required) {
      if (!headers.any(
        (header) =>
            header
                .trim()
                .toLowerCase() ==
            column
                .trim()
                .toLowerCase(),
      )) {
        return false;
      }
    }

    return true;
  }
}