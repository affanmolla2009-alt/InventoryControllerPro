import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/inventory.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance =
      NotificationService._();

  final FlutterLocalNotificationsPlugin
      _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings
        androidInitializationSettings =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const InitializationSettings
        initializationSettings =
        InitializationSettings(
      android:
          androidInitializationSettings,
    );

    await _notifications.initialize(
      initializationSettings,
    );
  }

  Future<void> showLowStockNotification({
    required Inventory inventory,
    required int threshold,
  }) async {
    if (inventory.quantity > threshold) {
      return;
    }

    const AndroidNotificationDetails
        androidDetails =
        AndroidNotificationDetails(
      'low_stock_channel',
      'Low Stock Alerts',
      channelDescription:
          'Notification for low inventory stock',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails details =
        NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(
      inventory.id ?? 0,
      'Low Stock Alert',
      '${inventory.sku} has only ${inventory.quantity} pcs remaining.',
      details,
    );
  }

  Future<void> showSuccessNotification({
    required String title,
    required String message,
  }) async {
    const AndroidNotificationDetails
        androidDetails =
        AndroidNotificationDetails(
      'success_channel',
      'Success',
      channelDescription:
          'Success notifications',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    const NotificationDetails details =
        NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(
      DateTime.now()
          .millisecondsSinceEpoch,
      title,
      message,
      details,
    );
  }

  Future<void> showErrorNotification({
    required String message,
  }) async {
    const AndroidNotificationDetails
        androidDetails =
        AndroidNotificationDetails(
      'error_channel',
      'Errors',
      channelDescription:
          'Application errors',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details =
        NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(
      DateTime.now()
          .millisecondsSinceEpoch,
      'Error',
      message,
      details,
    );
  }

  Future<void> showBackupCompleted() async {
    await showSuccessNotification(
      title: 'Backup Completed',
      message:
          'Inventory backup created successfully.',
    );
  }

  Future<void> showExportCompleted({
    required String fileName,
  }) async {
    await showSuccessNotification(
      title: 'Export Completed',
      message:
          '$fileName exported successfully.',
    );
  }

  Future<void> cancelNotification(
    int id,
  ) async {
    await _notifications.cancel(id);
  }

  Future<void> cancelAll() async {
    await _notifications.cancelAll();
  }
}