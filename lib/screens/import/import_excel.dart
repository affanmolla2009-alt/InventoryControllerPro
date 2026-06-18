import 'package:flutter/material.dart';

import 'import_summary.dart';

class ImportExcel extends StatefulWidget {
  const ImportExcel({super.key});

  @override
  State<ImportExcel> createState() =>
      _ImportExcelState();
}

class _ImportExcelState extends State<ImportExcel> {

  String? _selectedFile;

  bool _templateValid = false;

  bool _isLoading = false;

  Future<void> _pickExcelFile() async {

    /*
      excel_import_service.dart

      Supported:

      .xlsx

      Templates:

      assets/templates/
      inventory_template.xlsx

      blank_template.xlsx

      File Picker

    */

    setState(() {

      _selectedFile =
          "inventory_template.xlsx";

      _templateValid = true;

    });

  }

  Future<void> _startImport() async {

    if (!_templateValid) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content: Text(
            "Please select a valid Excel file.",
          ),

        ),

      );

      return;

    }

    setState(() {

      _isLoading = true;

    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    setState(() {

      _isLoading = false;

    });

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) =>
            const ImportSummary(),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Import Excel",
        ),

      ),

      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Image.asset(

              "assets/illustrations/onboarding2.png",

              height: 180,

            ),

            const SizedBox(height: 20),

            const Text(

              "Import Inventory",

              style: TextStyle(

                fontSize: 24,

                fontWeight:
                    FontWeight.bold,

              ),

            ),

            const SizedBox(height: 8),

            const Text(

              "Import inventory records from a compatible Excel (.xlsx) template.",

            ),

            const SizedBox(height: 25),

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.file_open,
                ),

                title: Text(

                  _selectedFile ??
                      "No file selected",

                ),

                subtitle: const Text(

                  "Supported format: .xlsx",

                ),

                trailing: ElevatedButton(

                  onPressed:
                      _pickExcelFile,

                  child: const Text(
                    "Browse",
                  ),

                ),

              ),

            ),

            const SizedBox(height: 20),

            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(
                  16,
                ),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    const Text(

                      "Expected Columns",

                      style: TextStyle(

                        fontWeight:
                            FontWeight.bold,

                        fontSize: 18,

                      ),

                    ),

                    const SizedBox(height: 10),

                    Wrap(

                      spacing: 8,

                      runSpacing: 8,

                      children: const [

                        Chip(
                          label:
                              Text("SKU"),
                        ),

                        Chip(
                          label:
                              Text("Brand"),
                        ),

                        Chip(
                          label:
                              Text("Category"),
                        ),

                        Chip(
                          label:
                              Text("Product"),
                        ),

                        Chip(
                          label:
                              Text("Color"),
                        ),

                        Chip(
                          label:
                              Text("Size"),
                        ),

                        Chip(
                          label:
                              Text("Quantity"),
                        ),

                        Chip(
                          label:
                              Text("Price"),
                        ),

                      ],

                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 20),

            ListTile(

              leading: Icon(

                _templateValid
                    ? Icons.check_circle
                    : Icons.cancel,

                color: _templateValid
                    ? Colors.green
                    : Colors.red,

              ),

              title: Text(

                _templateValid
                    ? "Template validation successful"
                    : "Template not validated",

              ),

            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: _isLoading

                    ? const SizedBox(

                        width: 20,

                        height: 20,

                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2,
                        ),

                      )

                    : const Icon(
                        Icons.upload_file,
                      ),

                label: Text(

                  _isLoading
                      ? "Importing..."
                      : "Start Import",

                ),

                onPressed:
                    _isLoading
                        ? null
                        : _startImport,

              ),

            ),

            const SizedBox(height: 30),

            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(
                  16,
                ),

                child: Column(

                  children: const [

                    Icon(
                      Icons.info_outline,
                      size: 40,
                    ),

                    SizedBox(height: 10),

                    Text(

                      "For best results, use the provided inventory template. Invalid or missing columns may prevent successful import.",

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