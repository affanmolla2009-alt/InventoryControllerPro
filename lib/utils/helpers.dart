import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Helpers {
  Helpers._();

  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }

  static Future<void> copyToClipboard(
    BuildContext context,
    String text,
  ) async {
    await Clipboard.setData(
      ClipboardData(text: text),
    );

    showSnackBar(
      context,
      message: "Copied to clipboard",
    );
  }

  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  false,
                );
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  true,
                );
              },
              child: const Text("OK"),
            ),

          ],
        );
      },
    );
  }

  static Future<void> showBottomSheetWidget({
    required BuildContext context,
    required Widget child,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => SafeArea(
        child: child,
      ),
    );
  }

  static String generateRandomId({
    int length = 12,
  }) {
    const chars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "abcdefghijklmnopqrstuvwxyz"
        "0123456789";

    final random = Random();

    return List.generate(
      length,
      (_) => chars[
          random.nextInt(chars.length)],
    ).join();
  }

  static String generateSku({
    String prefix = "SKU",
  }) {
    final now = DateTime.now();

    return "$prefix"
        "${now.year}"
        "${now.month.toString().padLeft(2, "0")}"
        "${now.day.toString().padLeft(2, "0")}"
        "${now.millisecond}";
  }

  static bool isNullOrEmpty(
    String? value,
  ) {
    return value == null ||
        value.trim().isEmpty;
  }

  static String orDash(
    String? value,
  ) {
    if (isNullOrEmpty(value)) {
      return "-";
    }

    return value!;
  }

  static Future<void> hideKeyboard(
    BuildContext context,
  ) async {
    FocusScope.of(context).unfocus();
  }

  static Future<void> delay({
    int milliseconds = 300,
  }) async {
    await Future.delayed(
      Duration(
        milliseconds: milliseconds,
      ),
    );
  }

  static List<T> removeDuplicates<T>(
    List<T> list,
  ) {
    return list.toSet().toList();
  }

  static String initials(
    String text,
  ) {
    final words = text
        .trim()
        .split(" ")
        .where(
          (e) => e.isNotEmpty,
        )
        .toList();

    if (words.isEmpty) {
      return "";
    }

    if (words.length == 1) {
      return words.first[0]
          .toUpperCase();
    }

    return "${words.first[0]}${words.last[0]}"
        .toUpperCase();
  }
}