import 'package:flutter/material.dart';

class ExportExcel extends StatefulWidget {
  const ExportExcel({super.key});

  @override
  State<ExportExcel> createState() =>
      _ExportExcelState();
}

class _ExportExcelState
    extends State<ExportExcel> {

  String _selectedReport =
      "Today's Report";

  DateTimeRange? _customRange;

  Future<void> _pickDateRange() async {

    final result =
        await showDateRangePicker(

      context: context,

      firstDate:
          DateTime(2020),

      lastDate:
          DateTime(2100),

    );

    if (result != null) {

      setState(() {

        _customRange = result;

      });

    }

  }

  Future<void> _exportExcel() async {

    /*
      excel_export_service.dart

      Include:

      Company Logo
      Business Name
      Address
      Phone
      Email
      GST

      Report Title

      Generated Date

      Inventory Table

      Footer

      Save to:

      downloads/
      InventoryController/
      Exports/
      Excel/

    */

    if (!mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content: Text(
          "Excel exported successfully.",
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Export Excel",
        ),

      ),

      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "Select Report Type",

              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),

            ),

            const SizedBox(
              height: 20,
            ),

            RadioListTile(

              value:
                  "Today's Report",

              groupValue:
                  _selectedReport,

              title: const Text(
                "Today's Report",
              ),

              onChanged: (value) {

                setState(() {

                  _selectedReport =
                      value!;

                });

              },

            ),

            RadioListTile(

              value:
                  "Weekly Report",

              groupValue:
                  _selectedReport,

              title: const Text(
                "Weekly Report",
              ),

              onChanged: (value) {

                setState(() {

                  _selectedReport =
                      value!;

                });

              },

            ),

            RadioListTile(

              value:
                  "Monthly Report",

              groupValue:
                  _selectedReport,

              title: const Text(
                "Monthly Report",
              ),

              onChanged: (value) {

                setState(() {

                  _selectedReport =
                      value!;

                });

              },

            ),

            RadioListTile(

              value:
                  "Custom Report",

              groupValue:
                  _selectedReport,

              title: const Text(
                "Custom Date Report",
              ),

              onChanged: (value) {

                setState(() {

                  _selectedReport =
                      value!;

                });

              },

            ),

            if (_selectedReport ==
                "Custom Report")

              Padding(

                padding:
                    const EdgeInsets.only(
                  top: 10,
                ),

                child: SizedBox(

                  width:
                      double.infinity,

                  child:
                      OutlinedButton.icon(

                    icon: const Icon(
                      Icons.date_range,
                    ),

                    label: Text(

                      _customRange ==
                              null

                          ? "Select Date Range"

                          : "${_customRange!.start.day}/${_customRange!.start.month}/${_customRange!.start.year}"
                            "  →  "
                            "${_customRange!.end.day}/${_customRange!.end.month}/${_customRange!.end.year}",

                    ),

                    onPressed:
                        _pickDateRange,

                  ),

                ),

              ),

            const SizedBox(
              height: 30,
            ),

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

                  children: const [

                    Text(
                      "Excel will include:",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "• Company Logo",
                    ),

                    Text(
                      "• Business Name",
                    ),

                    Text(
                      "• Address",
                    ),

                    Text(
                      "• Phone",
                    ),

                    Text(
                      "• Email",
                    ),

                    Text(
                      "• GST Number",
                    ),

                    Text(
                      "• Report Title",
                    ),

                    Text(
                      "• Generated Date",
                    ),

                    Text(
                      "• Inventory Data",
                    ),

                    Text(
                      "• Total Stock",
                    ),

                    Text(
                      "• Footer Text",
                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(
              height: 30,
            ),

            SizedBox(

              width:
                  double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: const Icon(
                  Icons.table_chart,
                ),

                label: const Text(
                  "Export Excel",
                ),

                onPressed:
                    _exportExcel,

              ),

            ),

          ],

        ),

      ),

    );

  }

}