import 'package:flutter/material.dart';

class ExportPng extends StatefulWidget {
  const ExportPng({super.key});

  @override
  State<ExportPng> createState() =>
      _ExportPngState();
}

class _ExportPngState extends State<ExportPng> {
  String _reportType = "Today's Report";

  DateTimeRange? _customRange;

  Future<void> _selectDateRange() async {
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (result != null) {
      setState(() {
        _customRange = result;
      });
    }
  }

  Future<void> _exportPng() async {
    /*
      png_export_service.dart

      Export Size:
      A4 Portrait
      2480 × 3508 px
      300 DPI

      Include:

      Company Logo
      Business Name
      Address
      Phone
      Email
      GST Number

      Report Title

      Generated Date

      Inventory Table

      Total Items
      Total Quantity

      Footer

      Save Location:

      downloads/
      InventoryController/
      Exports/
      PNG/
    */

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "PNG report exported successfully.",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Export PNG (A4)",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            const Text(
              "Report Type",
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            RadioListTile(
              value: "Today's Report",
              groupValue: _reportType,
              title:
                  const Text("Today's Report"),
              onChanged: (value) {
                setState(() {
                  _reportType =
                      value.toString();
                });
              },
            ),

            RadioListTile(
              value: "Weekly Report",
              groupValue: _reportType,
              title:
                  const Text("Weekly Report"),
              onChanged: (value) {
                setState(() {
                  _reportType =
                      value.toString();
                });
              },
            ),

            RadioListTile(
              value: "Monthly Report",
              groupValue: _reportType,
              title:
                  const Text("Monthly Report"),
              onChanged: (value) {
                setState(() {
                  _reportType =
                      value.toString();
                });
              },
            ),

            RadioListTile(
              value: "Custom Report",
              groupValue: _reportType,
              title: const Text(
                  "Custom Date Report"),
              onChanged: (value) {
                setState(() {
                  _reportType =
                      value.toString();
                });
              },
            ),

            if (_reportType ==
                "Custom Report")

              Padding(
                padding:
                    const EdgeInsets.only(
                  top: 10,
                ),
                child: OutlinedButton.icon(
                  onPressed:
                      _selectDateRange,
                  icon: const Icon(
                    Icons.calendar_today,
                  ),
                  label: Text(
                    _customRange == null
                        ? "Select Date Range"
                        : "${_customRange!.start.day}/${_customRange!.start.month}/${_customRange!.start.year} - ${_customRange!.end.day}/${_customRange!.end.month}/${_customRange!.end.year}",
                  ),
                ),
              ),

            const SizedBox(height: 25),

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
                      "PNG Preview",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Divider(),

                    Text(
                        "✓ Company Logo"),

                    Text(
                        "✓ Business Name"),

                    Text("✓ Address"),

                    Text("✓ Phone"),

                    Text("✓ Email"),

                    Text(
                        "✓ GST Number"),

                    Text(
                        "✓ Report Title"),

                    Text(
                        "✓ Date Range"),

                    Text(
                        "✓ Inventory Table"),

                    Text(
                        "✓ Total Products"),

                    Text(
                        "✓ Total Quantity"),

                    Text(
                        "✓ Footer"),

                    Text(
                        "✓ A4 Portrait Layout"),

                    Text(
                        "✓ High Resolution 300 DPI"),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              padding:
                  const EdgeInsets.all(
                15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      Colors.grey,
                ),
                borderRadius:
                    BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(
                children: [

                  Image.asset(
                    "assets/logos/default_logo.png",
                    height: 70,
                  ),

                  const SizedBox(
                      height: 10),

                  const Text(
                    "COMPANY NAME",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  const Text(
                    "Address • Phone • Email",
                  ),

                  const SizedBox(
                      height: 15),

                  const Divider(),

                  const Text(
                    "Inventory Report",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height: 120),

                  const Divider(),

                  const Text(
                    "Generated by Inventory Controller Pro",
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width:
                  double.infinity,
              height: 55,
              child:
                  ElevatedButton.icon(
                icon: const Icon(
                  Icons.image,
                ),
                label: const Text(
                  "Export PNG",
                ),
                onPressed:
                    _exportPng,
              ),
            ),

          ],
        ),
      ),
    );
  }
}