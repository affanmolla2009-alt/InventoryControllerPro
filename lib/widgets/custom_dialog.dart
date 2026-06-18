import 'package:flutter/material.dart';

enum DialogType {
  delete,
  save,
  update,
  logout,
  backup,
  restore,
  custom,
}

class CustomDialog {

  static Future<bool?> show({

    required BuildContext context,

    required DialogType type,

    String? title,

    String? message,

    String confirmText = "Confirm",

    String cancelText = "Cancel",

    VoidCallback? onConfirm,

    VoidCallback? onCancel,

  }) {

    IconData icon;
    Color color;

    switch (type) {

      case DialogType.delete:
        icon = Icons.delete_forever;
        color = Colors.red;
        title ??= "Delete";
        message ??=
            "Are you sure you want to delete this item?";
        break;

      case DialogType.save:
        icon = Icons.save;
        color = Colors.green;
        title ??= "Save";
        message ??=
            "Do you want to save your changes?";
        break;

      case DialogType.update:
        icon = Icons.update;
        color = Colors.blue;
        title ??= "Update";
        message ??=
            "Do you want to update this record?";
        break;

      case DialogType.logout:
        icon = Icons.logout;
        color = Colors.orange;
        title ??= "Logout";
        message ??=
            "Are you sure you want to logout?";
        break;

      case DialogType.backup:
        icon = Icons.backup;
        color = Colors.indigo;
        title ??= "Create Backup";
        message ??=
            "Create a backup of your data?";
        break;

      case DialogType.restore:
        icon = Icons.restore;
        color = Colors.purple;
        title ??= "Restore Backup";
        message ??=
            "Restore data from backup?";
        break;

      case DialogType.custom:
        icon = Icons.info;
        color = Colors.teal;
        title ??= "Confirmation";
        message ??=
            "Do you want to continue?";
        break;

    }

    return showDialog<bool>(

      context: context,

      barrierDismissible: false,

      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(

            borderRadius:
                BorderRadius.circular(20),

          ),

          title: Row(

            children: [

              Icon(
                icon,
                color: color,
                size: 30,
              ),

              const SizedBox(width: 10),

              Expanded(

                child: Text(title!),

              ),

            ],

          ),

          content: Text(message!),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(
                  context,
                  false,
                );

                onCancel?.call();

              },

              child: Text(cancelText),

            ),

            ElevatedButton(

              style:
                  ElevatedButton.styleFrom(

                backgroundColor: color,

              ),

              onPressed: () {

                Navigator.pop(
                  context,
                  true,
                );

                onConfirm?.call();

              },

              child: Text(confirmText),

            ),

          ],

        );

      },

    );

  }

}