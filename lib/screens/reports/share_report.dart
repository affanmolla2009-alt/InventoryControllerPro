import 'package:flutter/material.dart';

class ShareReport extends StatefulWidget {
  const ShareReport({super.key});

  @override
  State<ShareReport> createState() =>
      _ShareReportState();
}

class _ShareReportState extends State<ShareReport> {

  String _selectedFormat = "PNG";

  String _selectedReport = "Today's Report";

  bool _includeLogo = true;
  bool _includeSummary = true;
  bool _includeFooter = true;

  Future<void> _shareReport() async {

    /*
      share_service.dart

      Share file from:

      downloads/
      InventoryController/
      Exports/

      Support:

      PNG
      Excel
      PDF (future)

      Android Share Sheet:

      WhatsApp
      Gmail
      Telegram
      Drive
      Bluetooth
      Nearby Share
      Instagram
      Messenger
      etc.

    */

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Opening share options...",
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Share Report",
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
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 15),

            RadioListTile(

              value: "Today's Report",

              groupValue: _selectedReport,

              title: const Text(
                "Today's Report",
              ),

              onChanged: (value) {

                setState(() {

                  _selectedReport =
                      value.toString();

                });

              },

            ),

            RadioListTile(

              value: "Weekly Report",

              groupValue: _selectedReport,

              title: const Text(
                "Weekly Report",
              ),

              onChanged: (value) {

                setState(() {

                  _selectedReport =
                      value.toString();

                });

              },

            ),

            RadioListTile(

              value: "Monthly Report",

              groupValue: _selectedReport,

              title: const Text(
                "Monthly Report",
              ),

              onChanged: (value) {

                setState(() {

                  _selectedReport =
                      value.toString();

                });

              },

            ),

            const SizedBox(height: 25),

            const Text(

              "File Format",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(

              value: _selectedFormat,

              decoration: const InputDecoration(

                border: OutlineInputBorder(),

              ),

              items: const [

                DropdownMenuItem(

                  value: "PNG",

                  child: Text(
                    "PNG (A4)",
                  ),

                ),

                DropdownMenuItem(

                  value: "Excel",

                  child: Text(
                    "Excel (.xlsx)",
                  ),

                ),

                DropdownMenuItem(

                  value: "PDF",

                  child: Text(
                    "PDF (Future)",
                  ),

                ),

              ],

              onChanged: (value) {

                setState(() {

                  _selectedFormat =
                      value!;

                });

              },

            ),

            const SizedBox(height: 25),

            const Text(

              "Include",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),

            CheckboxListTile(

              value: _includeLogo,

              title: const Text(
                "Company Logo",
              ),

              onChanged: (value) {

                setState(() {

                  _includeLogo =
                      value!;

                });

              },

            ),

            CheckboxListTile(

              value: _includeSummary,

              title: const Text(
                "Summary Section",
              ),

              onChanged: (value) {

                setState(() {

                  _includeSummary =
                      value!;

                });

              },

            ),

            CheckboxListTile(

              value: _includeFooter,

              title: const Text(
                "Footer",
              ),

              onChanged: (value) {

                setState(() {

                  _includeFooter =
                      value!;

                });

              },

            ),

            const SizedBox(height: 25),

            Card(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(

                      "Share Destinations",

                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),

                    ),

                    const SizedBox(height: 12),

                    Wrap(

                      spacing: 10,

                      runSpacing: 10,

                      children: const [

                        Chip(
                          label: Text(
                            "WhatsApp",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "Gmail",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "Telegram",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "Drive",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "Bluetooth",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "Nearby Share",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "Instagram",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "Messenger",
                          ),
                        ),

                        Chip(
                          label: Text(
                            "More...",
                          ),
                        ),

                      ],

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
                  Icons.share,
                ),

                label: const Text(
                  "Share Report",
                ),

                onPressed: _shareReport,

              ),

            ),

          ],

        ),

      ),

    );

  }

}