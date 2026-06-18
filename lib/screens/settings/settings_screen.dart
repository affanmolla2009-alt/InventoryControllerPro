import 'package:flutter/material.dart';

import 'backup_restore.dart';
import 'notification_settings.dart';
import 'theme_settings.dart';
import 'about.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  bool _autoBackup = true;

  bool _lowStockNotification = true;

  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),

      body: ListView(

        children: [

          const SizedBox(height: 10),

          const ListTile(

            leading: CircleAvatar(
              child: Icon(Icons.inventory),
            ),

            title: Text(
              "Inventory Controller Pro",
            ),

            subtitle: Text(
              "Manage application preferences",
            ),

          ),

          const Divider(),

          ListTile(

            leading: const Icon(
              Icons.backup,
            ),

            title: const Text(
              "Backup & Restore",
            ),

            subtitle: const Text(
              "Backup database and settings",
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),

            onTap: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      const BackupRestore(),

                ),

              );

            },

          ),

          ListTile(

            leading: const Icon(
              Icons.notifications,
            ),

            title: const Text(
              "Notification Settings",
            ),

            subtitle: const Text(
              "Low stock alerts and reminders",
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),

            onTap: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      const NotificationSettings(),

                ),

              );

            },

          ),

          ListTile(

            leading: const Icon(
              Icons.palette,
            ),

            title: const Text(
              "Theme",
            ),

            subtitle: const Text(
              "Light / Dark mode",
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),

            onTap: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      const ThemeSettings(),

                ),

              );

            },

          ),

          ListTile(

            leading: const Icon(
              Icons.info_outline,
            ),

            title: const Text(
              "About",
            ),

            subtitle: const Text(
              "Application information",
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),

            onTap: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      const AboutScreen(),

                ),

              );

            },

          ),

          const Divider(),

          SwitchListTile(

            value: _autoBackup,

            title: const Text(
              "Automatic Backup",
            ),

            subtitle: const Text(
              "Create scheduled backups",
            ),

            secondary: const Icon(
              Icons.cloud_upload,
            ),

            onChanged: (value) {

              setState(() {

                _autoBackup = value;

              });

            },

          ),

          SwitchListTile(

            value:
                _lowStockNotification,

            title: const Text(
              "Low Stock Notification",
            ),

            subtitle: const Text(
              "Notify when quantity is low",
            ),

            secondary: const Icon(
              Icons.warning_amber,
            ),

            onChanged: (value) {

              setState(() {

                _lowStockNotification =
                    value;

              });

            },

          ),

          SwitchListTile(

            value: _darkMode,

            title: const Text(
              "Dark Mode",
            ),

            subtitle: const Text(
              "Use dark appearance",
            ),

            secondary: const Icon(
              Icons.dark_mode,
            ),

            onChanged: (value) {

              setState(() {

                _darkMode = value;

              });

            },

          ),

          const Divider(),

          const ListTile(

            leading: Icon(
              Icons.folder,
            ),

            title: Text(
              "Export Location",
            ),

            subtitle: Text(
              "Downloads/InventoryController/",
            ),

          ),

          const ListTile(

            leading: Icon(
              Icons.storage,
            ),

            title: Text(
              "Database",
            ),

            subtitle: Text(
              "SQLite Local Storage",
            ),

          ),

          const ListTile(

            leading: Icon(
              Icons.language,
            ),

            title: Text(
              "Language",
            ),

            subtitle: Text(
              "English",
            ),

          ),

          const SizedBox(height: 30),

          Center(

            child: Text(

              "Version 1.0.0",

              style: TextStyle(

                color: Colors.grey.shade700,

              ),

            ),

          ),

          const SizedBox(height: 25),

        ],

      ),

    );

  }

}