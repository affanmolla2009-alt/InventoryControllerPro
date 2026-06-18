import 'package:flutter/material.dart';

import 'import_summary.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() =>
      _ValidationScreenState();
}

class _ValidationScreenState
    extends State<ValidationScreen> {

  bool skipInvalidRows = true;

  final List<Map<String, dynamic>> validationResults = [

    {
      "row": 2,
      "status": true,
      "message": "Valid"
    },

    {
      "row": 3,
      "status": false,
      "message": "SKU already exists"
    },

    {
      "row": 4,
      "status": false,
      "message": "Quantity is missing"
    },

    {
      "row": 5,
      "status": true,
      "message": "Valid"
    },

    {
      "row": 6,
      "status": false,
      "message": "Brand not found"
    },

  ];

  int get validCount =>
      validationResults
          .where(
              (e) => e["status"] == true)
          .length;

  int get invalidCount =>
      validationResults
          .where(
              (e) => e["status"] == false)
          .length;

  Future<void> continueImport() async {

    /*
      excel_import_service.dart

      if(skipInvalidRows){

         import only valid rows

      }

      else{

         stop import

      }

    */

    if (!mounted) return;

    Navigator.pushReplacement(

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
          "Validation Result",
        ),

      ),

      body: Column(

        children: [

          Container(

            width: double.infinity,

            padding:
                const EdgeInsets.all(16),

            color:
                Colors.blue.shade50,

            child: Column(

              children: [

                const Text(

                  "Excel Validation",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight:
                        FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 10),

                Text(
                    "Valid Rows : $validCount"),

                Text(
                    "Invalid Rows : $invalidCount"),

              ],

            ),

          ),

          SwitchListTile(

            value: skipInvalidRows,

            title: const Text(
              "Skip Invalid Rows",
            ),

            subtitle: const Text(
              "Import only valid records",
            ),

            onChanged: (value) {

              setState(() {

                skipInvalidRows =
                    value;

              });

            },

          ),

          const Divider(),

          Expanded(

            child: ListView.builder(

              itemCount:
                  validationResults.length,

              itemBuilder:
                  (context, index) {

                final row =
                    validationResults[index];

                return Card(

                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  child: ListTile(

                    leading: Icon(

                      row["status"]
                          ? Icons
                              .check_circle
                          : Icons.error,

                      color:
                          row["status"]
                              ? Colors.green
                              : Colors.red,

                    ),

                    title: Text(
                      "Row ${row["row"]}",
                    ),

                    subtitle:
                        Text(row["message"]),

                    trailing: row["status"]

                        ? const Text(
                            "Valid",
                          )

                        : const Text(
                            "Invalid",
                          ),

                  ),

                );

              },

            ),

          ),

          Padding(

            padding:
                const EdgeInsets.all(16),

            child: SizedBox(

              width: double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: const Icon(
                  Icons.check,
                ),

                label: const Text(
                  "Continue Import",
                ),

                onPressed:
                    continueImport,

              ),

            ),

          ),

        ],

      ),

    );

  }

}