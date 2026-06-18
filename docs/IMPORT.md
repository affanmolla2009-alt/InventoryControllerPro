Excel Import Guide

Supported Formats

- .xlsx

Required Columns

Column| Required
SKU| Yes
Product Name| Yes
Quantity| Yes
Brand| Optional
Barcode| Optional

---

Import Process

1. Select Excel file.

2. Validate headers.

3. Validate row values.

4. Display validation summary.

5. Import valid rows.

6. Skip invalid rows.

---

Validation Rules

- SKU cannot be empty.

- Quantity must be numeric.

- Duplicate SKU detection.

- Empty rows ignored.

---

Error Report

Invalid records should display:

- Row number

- Error message

- Suggested correction

---

Best Practice

Use the provided template from:

assets/templates/inventory_template.xlsx