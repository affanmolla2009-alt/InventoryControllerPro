Inventory Controller Pro API Documentation

Overview

Inventory Controller Pro uses a repository-service architecture.

UI
 ↓
Provider
 ↓
Repository
 ↓
Database

InventoryRepository

getAll()

Returns all inventory items.

getById(int id)

Returns a single inventory item.

insert(Inventory inventory)

Creates a new inventory record.

update(Inventory inventory)

Updates an existing record.

delete(int id)

Deletes an inventory record.

---

BrandRepository

- getBrand()
- saveBrand()
- updateBrand()

---

ReportRepository

- generateInventoryReport()
- generateSummary()
- generateStatistics()

---

Export Services

ExcelExportService

Exports inventory into XLSX format.

PngExportService

Exports inventory report into PNG format.

---

Import Services

ExcelImportService

Imports inventory from Excel templates.

---

NotificationService

Schedules:

- Low stock alerts
- Daily reminders
- Backup reminders

---

BackupService

Creates backups of:

- Database
- Settings
- Brand information

Supports restore operations.

---

ShareService

Shares:

- Excel reports
- PNG reports
- Backup files

---

StorageService

Provides application storage paths and directory management.