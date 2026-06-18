import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  ImageUtils._();

  static final ImagePicker _picker =
      ImagePicker();

  static Future<File?> pickFromGallery() async {
    final XFile? file =
        await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (file == null) {
      return null;
    }

    return File(file.path);
  }

  static Future<File?> pickFromCamera() async {
    final XFile? file =
        await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
    );

    if (file == null) {
      return null;
    }

    return File(file.path);
  }

  static Future<File?> compressImage(
    File file,
  ) async {
    final bytes =
        await file.readAsBytes();

    final image =
        img.decodeImage(bytes);

    if (image == null) {
      return null;
    }

    final compressed =
        img.encodeJpg(
      image,
      quality: 75,
    );

    await file.writeAsBytes(
      compressed,
    );

    return file;
  }

  static Future<File?> resizeImage(
    File file, {
    int width = 800,
  }) async {
    final bytes =
        await file.readAsBytes();

    final image =
        img.decodeImage(bytes);

    if (image == null) {
      return null;
    }

    final resized =
        img.copyResize(
      image,
      width: width,
    );

    await file.writeAsBytes(
      img.encodeJpg(resized),
    );

    return file;
  }

  static Future<String> fileToBase64(
    File file,
  ) async {
    final bytes =
        await file.readAsBytes();

    return base64Encode(bytes);
  }

  static Uint8List base64ToBytes(
    String base64,
  ) {
    return base64Decode(base64);
  }

  static bool isImage(
    String path,
  ) {
    final extension =
        path.toLowerCase();

    return extension.endsWith(".png") ||
        extension.endsWith(".jpg") ||
        extension.endsWith(".jpeg") ||
        extension.endsWith(".webp");
  }

  static String extension(
    String path,
  ) {
    return path
        .split(".")
        .last
        .toLowerCase();
  }

  static Future<int> imageSize(
    File file,
  ) async {
    return await file.length();
  }

  static String sizeText(
    int bytes,
  ) {
    if (bytes < 1024) {
      return "$bytes B";
    }

    if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(2)} KB";
    }

    return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB";
  }

  static Future<bool> exists(
    String path,
  ) async {
    return File(path).exists();
  }

  static Future<void> delete(
    String path,
  ) async {
    final file = File(path);

    if (await file.exists()) {
      await file.delete();
    }
  }
}