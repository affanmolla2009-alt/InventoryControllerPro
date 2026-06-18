import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  static final PermissionService instance =
      PermissionService._();

  /// Request notification permission
  Future<bool> requestNotificationPermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    final status =
        await Permission.notification.request();

    return status.isGranted;
  }

  /// Request camera permission
  Future<bool> requestCameraPermission() async {
    final status =
        await Permission.camera.request();

    return status.isGranted;
  }

  /// Request photos/media permission
  Future<bool> requestPhotosPermission() async {
    if (Platform.isAndroid) {
      final status =
          await Permission.photos.request();

      return status.isGranted;
    }

    return true;
  }

  /// Request storage permission (Android <=12)
  Future<bool> requestStoragePermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    final status =
        await Permission.storage.request();

    return status.isGranted;
  }

  /// Request manage external storage (if needed)
  Future<bool> requestManageStoragePermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    final status =
        await Permission.manageExternalStorage
            .request();

    return status.isGranted;
  }

  /// Request all permissions used by the app
  Future<bool> requestAllPermissions() async {
    final permissions = await [
      Permission.notification,
      Permission.camera,
      Permission.storage,
      Permission.photos,
    ].request();

    return permissions.values.every(
      (status) => status.isGranted,
    );
  }

  /// Check notification permission
  Future<bool> hasNotificationPermission() async {
    return await Permission.notification
        .isGranted;
  }

  /// Check camera permission
  Future<bool> hasCameraPermission() async {
    return await Permission.camera
        .isGranted;
  }

  /// Check storage permission
  Future<bool> hasStoragePermission() async {
    return await Permission.storage
        .isGranted;
  }

  /// Open app settings
  Future<void> openSettings() async {
    await openAppSettings();
  }
}