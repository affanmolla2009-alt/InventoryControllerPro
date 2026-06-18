class BrandTable {
  const BrandTable._();

  static const String tableName = 'brands';

  // Columns

  static const String id = 'id';

  static const String businessName = 'business_name';

  static const String ownerName = 'owner_name';

  static const String logoPath = 'logo_path';

  static const String address = 'address';

  static const String phone = 'phone';

  static const String email = 'email';

  static const String gstNumber = 'gst_number';

  static const String footer = 'footer';

  static const String themeColor = 'theme_color';

  static const String isDefault = 'is_default';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  // SQL

  static const String createTable = '''
CREATE TABLE brands (

id INTEGER PRIMARY KEY AUTOINCREMENT,

business_name TEXT NOT NULL,

owner_name TEXT,

logo_path TEXT,

address TEXT,

phone TEXT,

email TEXT,

gst_number TEXT,

footer TEXT,

theme_color TEXT DEFAULT '#1565C0',

is_default INTEGER NOT NULL DEFAULT 0,

created_at TEXT NOT NULL,

updated_at TEXT NOT NULL

)
''';

  static const List<String> columns = [
    id,
    businessName,
    ownerName,
    logoPath,
    address,
    phone,
    email,
    gstNumber,
    footer,
    themeColor,
    isDefault,
    createdAt,
    updatedAt,
  ];
}