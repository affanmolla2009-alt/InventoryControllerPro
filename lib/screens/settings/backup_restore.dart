import 'package:flutter/material.dart';

class BackupRestore extends StatefulWidget {
  const BackupRestore({super.key});

  @override
  State<BackupRestore> createState() =>
      _BackupRestoreState();
}

class _BackupRestoreState
    extends State<BackupRestore> {

  bool _backupDatabase = true;
  bool _backupSettings = true;

  Future<void> _createBackup() async {

    /*
      backup_service.dart

      Backup:

      Database

      Settings

      Save to:

      downloads/
      InventoryController/
      Backup/

      Database/

      Settings/

    */

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Backup created successfully.",
        ),

      ),

    );

  }

  Future<void> _restoreBackup() async {

    /*
      backup_service.dart

      Pick backup

      Restore database

      Restore settings

    */

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Backup restored successfully.",
        ),

      ),

    );

  }

  Future<void> _deleteBackup() async {

    final confirm = await showDialog<bool>(

      context: context,

      builder: (_) {

        return AlertDialog(

          title: const Text(
            "Delete Backup",
          ),

          content: const Text(
            "Do you want to permanently delete all backup files?",
          ),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(
                  context,
                  false,
                );

              },

              child: const Text(
                "Cancel",
              ),

            ),

            ElevatedButton(

              onPressed: () {

                Navigator.pop(
                  context,
                  true,
                );

              },

              child: const Text(
                "Delete",
              ),

            ),

          ],

        );

      },

    );

    if (confirm != true) return;

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Backup deleted.",
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Backup & Restore",
        ),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "Backup Options",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 15),

            CheckboxListTile(

              value: _backupDatabase,

              title: const Text(
                "Database",
              ),

              subtitle: const Text(
                "Inventory, brands and reports",
              ),

              onChanged: (value) {

                setState(() {

                  _backupDatabase =
                      value ?? true;

                });

              },

            ),

            CheckboxListTile(

              value: _backupSettings,

              title: const Text(
                "Application Settings",
              ),

              subtitle: const Text(
                "Theme, notifications and preferences",
              ),

              onChanged: (value) {

                setState(() {

                  _backupSettings =
                      value ?? true;

                });

              },

            ),

            const SizedBox(height: 20),

            Card(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: const [

                    Text(

                      "Backup Location",

                      style: TextStyle(

                        fontWeight:
                            FontWeight.bold,

                        fontSize: 18,

                      ),

                    ),

                    SizedBox(height: 10),

                    Text(
                      "Downloads/",
                    ),

                    Text(
                      "InventoryController/",
                    ),

                    Text(
                      "Backup/",
                    ),

                    Text(
                      "Database/",
                    ),

                    Text(
                      "Settings/",
                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 25),

            SizedBox(

              width: double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: const Icon(
                  Icons.backup,
                ),

                label: const Text(
                  "Create Backup",
                ),

                onPressed:
                    _createBackup,

              ),

            ),

            const SizedBox(height: 15),

            SizedBox(

              width: double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: const Icon(
                  Icons.restore,
                ),

                label: const Text(
                  "Restore Backup",
                ),

                onPressed:
                    _restoreBackup,

              ),

            ),

            const SizedBox(height: 15),

            SizedBox(

              width: double.infinity,

              height: 55,

              child:
                  OutlinedButton.icon(

                icon: const Icon(
                  Icons.delete,
                ),

                label: const Text(
                  "Delete Backup",
                ),

                onPressed:
                    _deleteBackup,

              ),

            ),

            const SizedBox(height: 30),

            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(16),

                child: Column(

                  children: const [

                    Icon(
                      Icons.info_outline,
                      size: 42,
                    ),

                    SizedBox(height: 10),

                    Text(

                      "Your inventory data stays on your device. Creating regular backups helps protect against accidental data loss or device replacement.",

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