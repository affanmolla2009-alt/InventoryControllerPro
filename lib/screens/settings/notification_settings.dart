import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() =>
      _NotificationSettingsState();
}

class _NotificationSettingsState
    extends State<NotificationSettings> {

  bool _enableNotifications = true;

  bool _lowStockAlert = true;

  bool _dailyReminder = false;

  bool _weeklyReportReminder = false;

  bool _exportNotification = true;

  bool _soundEnabled = true;

  bool _vibrationEnabled = true;

  int _lowStockLimit = 10;

  Future<void> _saveSettings() async {

    /*
      notification_service.dart

      Save:

      enableNotifications
      lowStockAlert
      dailyReminder
      weeklyReportReminder
      exportNotification
      soundEnabled
      vibrationEnabled
      lowStockLimit

      settings_provider.dart

    */

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Notification settings saved successfully.",
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Notification Settings",
        ),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "General",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 10),

            SwitchListTile(

              value: _enableNotifications,

              title: const Text(
                "Enable Notifications",
              ),

              subtitle: const Text(
                "Receive inventory notifications",
              ),

              secondary: const Icon(
                Icons.notifications_active,
              ),

              onChanged: (value) {

                setState(() {

                  _enableNotifications = value;

                });

              },

            ),

            SwitchListTile(

              value: _lowStockAlert,

              title: const Text(
                "Low Stock Alerts",
              ),

              subtitle: const Text(
                "Notify when stock reaches the minimum level",
              ),

              secondary: const Icon(
                Icons.warning_amber,
              ),

              onChanged: (value) {

                setState(() {

                  _lowStockAlert = value;

                });

              },

            ),

            const Divider(),

            const Text(

              "Reminder Notifications",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 10),

            SwitchListTile(

              value: _dailyReminder,

              title: const Text(
                "Daily Reminder",
              ),

              subtitle: const Text(
                "Daily inventory review reminder",
              ),

              secondary: const Icon(
                Icons.today,
              ),

              onChanged: (value) {

                setState(() {

                  _dailyReminder = value;

                });

              },

            ),

            SwitchListTile(

              value: _weeklyReportReminder,

              title: const Text(
                "Weekly Report Reminder",
              ),

              subtitle: const Text(
                "Reminder to export weekly reports",
              ),

              secondary: const Icon(
                Icons.calendar_month,
              ),

              onChanged: (value) {

                setState(() {

                  _weeklyReportReminder = value;

                });

              },

            ),

            SwitchListTile(

              value: _exportNotification,

              title: const Text(
                "Export Completion Notification",
              ),

              subtitle: const Text(
                "Notify when exports finish",
              ),

              secondary: const Icon(
                Icons.file_download_done,
              ),

              onChanged: (value) {

                setState(() {

                  _exportNotification = value;

                });

              },

            ),

            const Divider(),

            const Text(

              "Sound & Vibration",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 10),

            SwitchListTile(

              value: _soundEnabled,

              title: const Text(
                "Sound",
              ),

              subtitle: const Text(
                "Use notification sounds",
              ),

              secondary: const Icon(
                Icons.volume_up,
              ),

              onChanged: (value) {

                setState(() {

                  _soundEnabled = value;

                });

              },

            ),

            SwitchListTile(

              value: _vibrationEnabled,

              title: const Text(
                "Vibration",
              ),

              subtitle: const Text(
                "Vibrate on notifications",
              ),

              secondary: const Icon(
                Icons.vibration,
              ),

              onChanged: (value) {

                setState(() {

                  _vibrationEnabled = value;

                });

              },

            ),

            const Divider(),

            const SizedBox(height: 10),

            Text(

              "Low Stock Threshold : $_lowStockLimit",

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),

            ),

            Slider(

              value: _lowStockLimit.toDouble(),

              min: 1,

              max: 100,

              divisions: 99,

              label:
                  _lowStockLimit.toString(),

              onChanged: (value) {

                setState(() {

                  _lowStockLimit =
                      value.round();

                });

              },

            ),

            const SizedBox(height: 25),

            SizedBox(

              width: double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: const Icon(
                  Icons.save,
                ),

                label: const Text(
                  "Save Settings",
                ),

                onPressed:
                    _saveSettings,

              ),

            ),

            const SizedBox(height: 25),

            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(16),

                child: Column(

                  children: const [

                    Icon(
                      Icons.info,
                      size: 40,
                    ),

                    SizedBox(height: 10),

                    Text(

                      "Notification permissions are required for alerts and reminders. You can change permissions anytime from your device settings.",

                      textAlign:
                          TextAlign.center,

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}