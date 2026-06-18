import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/inventory.dart';
import '../../providers/inventory_provider.dart';
import 'edit_inventory_screen.dart';

class InventoryDetails extends StatelessWidget {
  final Inventory inventory;

  const InventoryDetails({
    super.key,
    required this.inventory,
  });

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<InventoryProvider>();

    final current =
        provider.inventoryById(
              inventory.id!,
            ) ??
            inventory;

    final bool lowStock =
        current.quantity <=
            provider.lowStockThreshold;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inventory Details",
        ),
        actions: [

          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      EditInventoryScreen(
                    inventory: current,
                  ),
                ),
              );
            },
          ),

          IconButton(
            icon: const Icon(
              Icons.share,
            ),
            onPressed: () {
              // share_service.dart
            },
          ),

        ],
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),
        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Center(
              child: CircleAvatar(
                radius: 45,
                child: Text(
                  current.quantity
                      .toString(),
                  style:
                      const TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            _tile(
              "SKU",
              current.sku,
            ),

            _tile(
              "Fabric",
              current.fabric,
            ),

            _tile(
              "Color",
              current.color,
            ),

            _tile(
              "Quantity",
              "${current.quantity} pcs",
            ),

            _tile(
              "Notes",
              current.notes.isEmpty
                  ? "-"
                  : current.notes,
            ),

            _tile(
              "Created",
              current.createdAt
                  .toString(),
            ),

            _tile(
              "Updated",
              current.updatedAt
                  .toString(),
            ),

            const SizedBox(
              height: 20,
            ),

            if (lowStock)

              Container(

                width:
                    double.infinity,

                padding:
                    const EdgeInsets.all(
                  14,
                ),

                decoration:
                    BoxDecoration(

                  color: Colors.red
                      .withOpacity(
                    0.10,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    10,
                  ),

                ),

                child: const Text(

                  "⚠ Low Stock Alert\nRemaining quantity is below the configured threshold.",

                  style: TextStyle(
                    color: Colors.red,
                    fontWeight:
                        FontWeight.bold,
                  ),

                ),

              ),

            const SizedBox(
              height: 25,
            ),

            Row(

              children: [

                Expanded(

                  child:
                      ElevatedButton.icon(

                    icon: const Icon(
                      Icons.remove,
                    ),

                    label: const Text(
                      "-1",
                    ),

                    onPressed: () {

                      provider.decreaseQuantity(
                        current,
                      );

                    },

                  ),

                ),

                const SizedBox(
                  width: 15,
                ),

                Expanded(

                  child:
                      ElevatedButton.icon(

                    icon: const Icon(
                      Icons.add,
                    ),

                    label: const Text(
                      "+1",
                    ),

                    onPressed: () {

                      provider.increaseQuantity(
                        current,
                      );

                    },

                  ),

                ),

              ],

            ),

            const SizedBox(
              height: 20,
            ),

            SizedBox(

              width:
                  double.infinity,

              height: 55,

              child:
                  OutlinedButton.icon(

                icon: const Icon(
                  Icons.edit,
                ),

                label: const Text(
                  "Edit Inventory",
                ),

                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EditInventoryScreen(
                        inventory:
                            current,
                      ),
                    ),
                  );

                },

              ),

            ),

            const SizedBox(
              height: 12,
            ),

            SizedBox(

              width:
                  double.infinity,

              height: 55,

              child:
                  ElevatedButton.icon(

                icon: const Icon(
                  Icons.picture_as_pdf,
                ),

                label: const Text(
                  "Export Report",
                ),

                onPressed: () {

                  // png_export_service.dart
                  // excel_export_service.dart

                },

              ),

            ),

          ],

        ),
      ),
    );
  }

  Widget _tile(
    String title,
    String value,
  ) {
    return Card(
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}