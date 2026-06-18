import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/inventory_provider.dart';
import 'add_inventory_screen.dart';
import 'inventory_details.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<InventoryProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inventory",
        ),
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddInventoryScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),

      body: Column(
        children: [

          Padding(
            padding:
                const EdgeInsets.all(16),
            child: TextField(
              decoration:
                  InputDecoration(
                hintText:
                    "Search SKU, Fabric or Color",
                prefixIcon:
                    const Icon(
                  Icons.search,
                ),
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),
              ),
              onChanged:
                  provider.setSearchQuery,
            ),
          ),

          Expanded(
            child: provider.isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator(),
                  )
                : provider
                        .filteredInventory
                        .isEmpty
                    ? Center(
                        child: Image.asset(
                          "assets/placeholders/no_data.png",
                          width: 220,
                        ),
                      )
                    : ListView.builder(
                        itemCount: provider
                            .filteredInventory
                            .length,
                        itemBuilder:
                            (
                          context,
                          index,
                        ) {
                          final item =
                              provider
                                      .filteredInventory[
                                  index];

                          final lowStock =
                              item.quantity <=
                                  provider
                                      .lowStockThreshold;

                          return Card(
                            margin:
                                const EdgeInsets.symmetric(
                              horizontal:
                                  12,
                              vertical:
                                  6,
                            ),

                            child: ListTile(

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        InventoryDetails(
                                      inventory:
                                          item,
                                    ),
                                  ),
                                );
                              },

                              leading:
                                  CircleAvatar(
                                child: Text(
                                  item.quantity
                                      .toString(),
                                ),
                              ),

                              title: Text(
                                item.sku,
                              ),

                              subtitle:
                                  Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [

                                  Text(
                                    item.fabric,
                                  ),

                                  Text(
                                    item.color,
                                  ),

                                  if (lowStock)

                                    const Padding(
                                      padding:
                                          EdgeInsets.only(
                                        top:
                                            4,
                                      ),
                                      child:
                                          Text(
                                        "Low Stock",
                                        style:
                                            TextStyle(
                                          color:
                                              Colors.red,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                ],
                              ),

                              trailing:
                                  SizedBox(
                                width:
                                    120,
                                child:
                                    Row(
                                  children: [

                                    IconButton(
                                      onPressed:
                                          () {

                                        provider.decreaseQuantity(
                                          item,
                                        );

                                      },
                                      icon:
                                          const Icon(
                                        Icons.remove_circle,
                                      ),
                                    ),

                                    Text(
                                      item.quantity
                                          .toString(),
                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed:
                                          () {

                                        provider.increaseQuantity(
                                          item,
                                        );

                                      },
                                      icon:
                                          const Icon(
                                        Icons.add_circle,
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ),
                          );
                        },
                      ),
          ),

        ],
      ),
    );
  }
}