import 'package:flutter/material.dart';

import 'export_excel.dart';
import 'export_png.dart';
import 'preview_report.dart';
import 'share_report.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reports",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            _reportCard(
              context,
              icon: Icons.today,
              title: "Today's Report",
              subtitle:
                  "Generate inventory report for today.",
            ),

            _reportCard(
              context,
              icon: Icons.date_range,
              title: "Weekly Report",
              subtitle:
                  "Generate last 7 days report.",
            ),

            _reportCard(
              context,
              icon: Icons.calendar_month,
              title: "Monthly Report",
              subtitle:
                  "Generate current month report.",
            ),

            _reportCard(
              context,
              icon: Icons.event,
              title: "Custom Date Report",
              subtitle:
                  "Select any date range.",
            ),

            const SizedBox(
              height: 25,
            ),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.visibility,
                ),
                label: const Text(
                  "Preview Report",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const PreviewReport(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.table_chart,
                ),
                label: const Text(
                  "Export Excel",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const ExportExcel(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.image,
                ),
                label: const Text(
                  "Export PNG (A4)",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const ExportPng(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 15,
            ),

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const ShareReport(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Card(
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.all(16),
                child: Column(
                  children: const [

                    Icon(
                      Icons.analytics,
                      size: 50,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "All exported reports automatically include:",
                      textAlign:
                          TextAlign.center,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "• Company Logo\n"
                      "• Business Name\n"
                      "• Address\n"
                      "• Phone\n"
                      "• Email\n"
                      "• GST Number\n"
                      "• Report Title\n"
                      "• Generated Date\n"
                      "• Inventory Table\n"
                      "• Footer Text",
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

  Widget _reportCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin:
          const EdgeInsets.only(
        bottom: 15,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 34,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}