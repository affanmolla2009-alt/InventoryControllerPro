import 'package:flutter/material.dart';

extension StringExtension on String {
  String get capitalize {
    if (trim().isEmpty) {
      return this;
    }

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get titleCase {
    return split(" ")
        .map(
          (word) => word.isEmpty
              ? word
              : "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}",
        )
        .join(" ");
  }

  bool get isEmail {
    final regex = RegExp(
      r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$',
    );

    return regex.hasMatch(trim());
  }

  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  bool get isNotBlank {
    return trim().isNotEmpty;
  }

  String get removeSpaces {
    return replaceAll(" ", "");
  }

  String get reversed {
    return split("").reversed.join();
  }
}

extension NumExtension on num {
  String get currency {
    return "₹${toStringAsFixed(2)}";
  }

  String get percentage {
    return "${toStringAsFixed(2)}%";
  }
}

extension DateTimeExtension on DateTime {
  String get shortDate {
    return "${day.toString().padLeft(2, "0")}/"
        "${month.toString().padLeft(2, "0")}/"
        "$year";
  }

  String get fileDate {
    return "${year}"
        "${month.toString().padLeft(2, "0")}"
        "${day.toString().padLeft(2, "0")}";
  }

  bool get isToday {
    final now = DateTime.now();

    return year == now.year &&
        month == now.month &&
        day == now.day;
  }
}

extension BuildContextExtension on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  ThemeData get theme {
    return Theme.of(this);
  }
}

extension ListExtension<T> on List<T> {
  bool get isNotNullOrEmpty {
    return isNotEmpty;
  }

  T? get firstOrNull {
    if (isEmpty) {
      return null;
    }

    return first;
  }

  T? get lastOrNull {
    if (isEmpty) {
      return null;
    }

    return last;
  }
}