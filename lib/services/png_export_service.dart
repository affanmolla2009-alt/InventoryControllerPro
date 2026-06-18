import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:screenshot/screenshot.dart';

import '../models/brand.dart';
import '../models/inventory.dart';

class PngExportService {
  PngExportService._();

  static final PngExportService instance =
      PngExportService._();

  final ScreenshotController
      _screenshotController =
      ScreenshotController();

  Future<File> exportInventoryReport({
    required BuildContext context,
    required Brand brand,
    required List<Inventory> inventoryList,
    required Directory exportDirectory,
    required String reportTitle,
  }) async {
    final Uint8List? image =
        await _screenshotController.captureFromWidget(
      Material(
        child: _ReportWidget(
          brand: brand,
          inventoryList: inventoryList,
          reportTitle: reportTitle,
        ),
      ),
      pixelRatio: 3.0,
    );

    if (image == null) {
      throw Exception(
        "Unable to generate PNG report.",
      );
    }

    final String fileName =
        "${DateTime.now().millisecondsSinceEpoch}.png";

    final File file = File(
      path.join(
        exportDirectory.path,
        fileName,
      ),
    );

    await file.writeAsBytes(image);

    return file;
  }
}

class _ReportWidget extends StatelessWidget {
  final Brand brand;

  final List<Inventory> inventoryList;

  final String reportTitle;

  const _ReportWidget({
    required this.brand,
    required this.inventoryList,
    required this.reportTitle,
  });

  @override
  Widget build(BuildContext context) {
    int totalQuantity = 0;

    for (final item in inventoryList) {
      totalQuantity += item.quantity;
    }

    return Container(
      width: 794,
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              brand.businessName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 6),

          Center(
            child: Text(
              brand.address,
            ),
          ),

          Center(
            child: Text(
              brand.phone,
            ),
          ),

          Center(
            child: Text(
              brand.email,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            reportTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const Divider(),

          DataTable(
            columns: const [
              DataColumn(
                label: Text("SKU"),
              ),
              DataColumn(
                label: Text("Fabric"),
              ),
              DataColumn(
                label: Text("Color"),
              ),
              DataColumn(
                label: Text("Qty"),
              ),
            ],
            rows: inventoryList
                .map(
                  (item) => DataRow(
                    cells: [
                      DataCell(
                        Text(item.sku),
                      ),
                      DataCell(
                        Text(item.fabric),
                      ),
                      DataCell(
                        Text(item.color),
                      ),
                      DataCell(
                        Text(
                          item.quantity
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 24),

          Text(
            "Total Products : ${inventoryList.length}",
          ),

          Text(
            "Total Quantity : $totalQuantity",
          ),

          const SizedBox(height: 20),

          Center(
            child: Text(
              brand.footer,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}