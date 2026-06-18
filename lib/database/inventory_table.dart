class InventoryTable {
  const InventoryTable._();

  static const String tableName = 'inventory';

  // Columns

  static const String id = 'id';

  static const String sku = 'sku';

  static const String fabric = 'fabric';

  static const String color = 'color';

  static const String quantity = 'quantity';

  static const String notes = 'notes';

  static const String brandId = 'brand_id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  // SQL

  static const String createTable = '''
CREATE TABLE inventory (

id INTEGER PRIMARY KEY AUTOINCREMENT,

sku TEXT NOT NULL UNIQUE,

fabric TEXT NOT NULL,

color TEXT NOT NULL,

quantity INTEGER NOT NULL DEFAULT 0,

notes TEXT DEFAULT '',

brand_id INTEGER,

created_at TEXT NOT NULL,

updated_at TEXT NOT NULL,

FOREIGN KEY (brand_id)
REFERENCES brands(id)
ON DELETE SET NULL
ON UPDATE CASCADE

)
''';

  static const List<String> columns = [
    id,
    sku,
    fabric,
    color,
    quantity,
    notes,
    brandId,
    createdAt,
    updatedAt,
  ];
}