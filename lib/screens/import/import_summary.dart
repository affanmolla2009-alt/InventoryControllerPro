import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';

class ImportSummary extends StatelessWidget {
  const ImportSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // Later replace these with actual values
    // from excel_import_service.dart

    const int totalRows = 150;
    const int importedRows = 143;
    const int duplicateRows = 4;
    const int skippedRows = 2;
    const int errorRows = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Import Summary",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Image.asset(
              "assets/animations/success.json",
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.check_circle,
                  size: 120,
                  color: Colors.green,
                );
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Import Completed",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Your Excel file has been processed successfully.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(Icons.table_chart),
                title: const Text("Total Rows"),
                trailing: const Text(
                  "$totalRows",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                title: const Text(
                  "Successfully Imported",
                ),
                trailing: const Text(
                  "$importedRows",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.copy,
                  color: Colors.orange,
                ),
                title: const Text(
                  "Duplicate Records",
                ),
                trailing: const Text(
                  "$duplicateRows",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.skip_next,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Skipped Rows",
                ),
                trailing: const Text(
                  "$skippedRows",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                title: const Text(
                  "Validation Errors",
                ),
                trailing: const Text(
                  "$errorRows",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: const [

                    Text(
                      "Import Notes",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "• Duplicate SKUs were ignored.",
                    ),

                    SizedBox(height: 5),

                    Text(
                      "• Invalid rows were skipped.",
                    ),

                    SizedBox(height: 5),

                    Text(
                      "• Imported records have been added to the local database.",
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(

                icon: const Icon(
                  Icons.dashboard,
                ),

                label: const Text(
                  "Go to Dashboard",
                ),

                onPressed: () {

                  Navigator.pushAndRemoveUntil(

                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          const DashboardScreen(),
                    ),

                    (route) => false,

                  );

                },

              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: OutlinedButton.icon(

                icon: const Icon(
                  Icons.upload_file,
                ),

                label: const Text(
                  "Import Another File",
                ),

                onPressed: () {

                  Navigator.pop(context);

                },

              ),
            ),

            const SizedBox(height: 25),

          ],
        ),
      ),
    );
  }
}