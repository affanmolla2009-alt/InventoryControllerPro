import 'package:sqflite/sqflite.dart';

class DatabaseMigrations {
  const DatabaseMigrations._();

  /// Create indexes for faster searching and sorting.
  static Future<void> createIndexes(
    Database db,
  ) async {
    // Inventory

    await db.execute('''
CREATE INDEX IF NOT EXISTS
idx_inventory_sku

ON inventory(sku)
''');

    await db.execute('''
CREATE INDEX IF NOT EXISTS
idx_inventory_brand

ON inventory(brand_id)
''');

    await db.execute('''
CREATE INDEX IF NOT EXISTS
idx_inventory_quantity

ON inventory(quantity)
''');

    // Brands

    await db.execute('''
CREATE INDEX IF NOT EXISTS
idx_brand_name

ON brands(business_name)
''');

    // Settings

    await db.execute('''
CREATE INDEX IF NOT EXISTS
idx_settings_default_brand

ON settings(default_brand_id)
''');
  }

  /// Runs automatically when the database version changes.
  static Future<void> onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    await db.transaction((txn) async {
      if (oldVersion < 2) {
        // Future Version 2 migration

        /*
        Example:

        await txn.execute(
          '''
          ALTER TABLE inventory
          ADD COLUMN barcode TEXT;
          '''
        );

        await txn.execute(
          '''
          ALTER TABLE inventory
          ADD COLUMN qr_code TEXT;
          '''
        );
        */
      }

      if (oldVersion < 3) {
        // Future Version 3 migration

        /*
        Example:

        CREATE TABLE suppliers (...)

        */
      }

      if (oldVersion < 4) {
        // Future Version 4 migration
      }

      if (oldVersion < 5) {
        // Future Version 5 migration
      }

      // Always recreate indexes after upgrades

      await createIndexes(db);
    });
  }
}