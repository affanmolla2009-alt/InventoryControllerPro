import 'dart:math';

class SkuGenerator {
  SkuGenerator._();

  static final Random _random =
      Random();

  static int _counter = 1;

  /// Example:
  /// SKU000001
  /// SKU000002
  /// SKU000003
  static String generate() {
    final String number =
        _counter
            .toString()
            .padLeft(6, '0');

    _counter++;

    return "SKU$number";
  }

  /// Example:
  /// FAB-COTTON-BLK-000001
  static String generateAdvanced({
    required String fabric,
    required String color,
  }) {
    final fabricCode =
        fabric.isEmpty
            ? "FAB"
            : fabric
                .replaceAll(" ", "")
                .toUpperCase()
                .substring(
                  0,
                  fabric.length >= 3
                      ? 3
                      : fabric.length,
                );

    final colorCode =
        color.isEmpty
            ? "CLR"
            : color
                .replaceAll(" ", "")
                .toUpperCase()
                .substring(
                  0,
                  color.length >= 3
                      ? 3
                      : color.length,
                );

    final serial =
        _counter
            .toString()
            .padLeft(6, '0');

    _counter++;

    return "$fabricCode-$colorCode-$serial";
  }

  /// Example:
  /// INV202506180001
  static String generateDateSku() {
    final now = DateTime.now();

    final date =
        "${now.year}"
        "${now.month.toString().padLeft(2, '0')}"
        "${now.day.toString().padLeft(2, '0')}";

    final serial =
        _counter
            .toString()
            .padLeft(4, '0');

    _counter++;

    return "INV$date$serial";
  }

  /// Example:
  /// INV-8F4X2A7B
  static String generateRandom() {
    const chars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    final buffer =
        StringBuffer();

    for (int i = 0; i < 8; i++) {
      buffer.write(
        chars[
            _random.nextInt(
              chars.length,
            )],
      );
    }

    return "INV-${buffer.toString()}";
  }

  /// Validate SKU format
  static bool isValid(
    String sku,
  ) {
    return sku
            .trim()
            .isNotEmpty &&
        sku.length >= 6;
  }

  /// Reset counter
  static void resetCounter() {
    _counter = 1;
  }

  /// Set custom starting value
  static void setCounter(
    int value,
  ) {
    if (value > 0) {
      _counter = value;
    }
  }

  /// Get current counter
  static int currentCounter() {
    return _counter;
  }
}