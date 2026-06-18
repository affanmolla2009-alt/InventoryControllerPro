import 'dart:io';

import 'package:path/path.dart' as path;

class FileUtils {
  FileUtils._();

  static String getFileName(
    String filePath,
  ) {
    return path.basename(filePath);
  }

  static String getFileNameWithoutExtension(
    String filePath,
  ) {
    return path.basenameWithoutExtension(
      filePath,
    );
  }

  static String getExtension(
    String filePath,
  ) {
    return path.extension(filePath);
  }

  static bool exists(
    String filePath,
  ) {
    return File(filePath).existsSync();
  }

  static Future<bool> delete(
    String filePath,
  ) async {
    final file = File(filePath);

    if (!await file.exists()) {
      return false;
    }

    await file.delete();

    return true;
  }

  static Future<Directory> createDirectory(
    String directoryPath,
  ) async {
    final directory =
        Directory(directoryPath);

    if (!await directory.exists()) {
      await directory.create(
        recursive: true,
      );
    }

    return directory;
  }

  static Future<int> fileSize(
    String filePath,
  ) async {
    final file = File(filePath);

    if (!await file.exists()) {
      return 0;
    }

    return await file.length();
  }

  static String formatFileSize(
    int bytes,
  ) {
    if (bytes < 1024) {
      return "$bytes B";
    }

    if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(2)} KB";
    }

    if (bytes <
        1024 * 1024 * 1024) {
      return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB";
    }

    return "${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB";
  }

  static String generateFileName(
    String prefix,
    String extension,
  ) {
    final now = DateTime.now();

    final timestamp =
        "${now.year}"
        "${now.month.toString().padLeft(2, "0")}"
        "${now.day.toString().padLeft(2, "0")}_"
        "${now.hour.toString().padLeft(2, "0")}"
        "${now.minute.toString().padLeft(2, "0")}"
        "${now.second.toString().padLeft(2, "0")}";

    return "${prefix}_$timestamp.$extension";
  }

  static bool isImage(
    String filePath,
  ) {
    final ext =
        getExtension(filePath)
            .toLowerCase();

    return [
      ".png",
      ".jpg",
      ".jpeg",
      ".webp",
      ".gif",
    ].contains(ext);
  }

  static bool isExcel(
    String filePath,
  ) {
    final ext =
        getExtension(filePath)
            .toLowerCase();

    return [
      ".xlsx",
      ".xls",
    ].contains(ext);
  }

  static bool isPdf(
    String filePath,
  ) {
    return getExtension(filePath)
            .toLowerCase() ==
        ".pdf";
  }

  static String joinPath(
    String part1,
    String part2,
  ) {
    return path.join(
      part1,
      part2,
    );
  }
}