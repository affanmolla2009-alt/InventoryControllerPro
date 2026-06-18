Database Documentation

Database Engine

SQLite

---

Tables

inventory

Field| Type
id| INTEGER
sku| TEXT
name| TEXT
barcode| TEXT
quantity| INTEGER
created_at| TEXT

---

brand

Field| Type
id| INTEGER
business_name| TEXT
phone| TEXT
email| TEXT
address| TEXT
gst| TEXT

---

settings

Field| Type
id| INTEGER
theme| TEXT
language| TEXT
currency| TEXT
notification| INTEGER

---

Migration

Database version upgrades are managed through:

database/migrations.dart

---

Backup

Supports complete database export and restore.

---

Indexing

Recommended indexes:

- SKU

- Barcode

- Product Name