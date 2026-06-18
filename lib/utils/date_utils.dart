import 'package:intl/intl.dart';

class AppDateUtils {
  AppDateUtils._();

  static String formatDate(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat("hh:mm a").format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat(
      "dd/MM/yyyy hh:mm a",
    ).format(date);
  }

  static String formatMonthYear(
    DateTime date,
  ) {
    return DateFormat(
      "MMMM yyyy",
    ).format(date);
  }

  static String formatShortDate(
    DateTime date,
  ) {
    return DateFormat(
      "dd MMM yyyy",
    ).format(date);
  }

  static String formatIsoDate(
    DateTime date,
  ) {
    return DateFormat(
      "yyyy-MM-dd",
    ).format(date);
  }

  static String formatFileName(
    DateTime date,
  ) {
    return DateFormat(
      "yyyyMMdd_HHmmss",
    ).format(date);
  }

  static String formatExportDate(
    DateTime date,
  ) {
    return DateFormat(
      "dd-MM-yyyy_HH-mm-ss",
    ).format(date);
  }

  static String relativeDate(
    DateTime date,
  ) {
    final now = DateTime.now();

    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final target = DateTime(
      date.year,
      date.month,
      date.day,
    );

    final difference =
        today.difference(target).inDays;

    if (difference == 0) {
      return "Today";
    }

    if (difference == 1) {
      return "Yesterday";
    }

    if (difference < 7) {
      return "$difference days ago";
    }

    return formatShortDate(date);
  }

  static bool isToday(
    DateTime date,
  ) {
    final now = DateTime.now();

    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  static bool isYesterday(
    DateTime date,
  ) {
    final yesterday =
        DateTime.now().subtract(
      const Duration(days: 1),
    );

    return yesterday.year == date.year &&
        yesterday.month == date.month &&
        yesterday.day == date.day;
  }

  static String greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    }

    if (hour < 17) {
      return "Good Afternoon";
    }

    if (hour < 21) {
      return "Good Evening";
    }

    return "Good Night";
  }

  static int daysBetween(
    DateTime start,
    DateTime end,
  ) {
    return end
        .difference(start)
        .inDays;
  }

  static String currentTimestamp() {
    return DateFormat(
      "yyyy-MM-dd HH:mm:ss",
    ).format(
      DateTime.now(),
    );
  }
}