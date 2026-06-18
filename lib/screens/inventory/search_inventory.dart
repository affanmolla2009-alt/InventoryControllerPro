import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/inventory.dart';
import '../../providers/inventory_provider.dart';
import 'inventory_details.dart';

class SearchInventory extends StatefulWidget {
  const SearchInventory({
    super.key,
  });

  @override
  State<SearchInventory> createState() =>
      _SearchInventoryState();
}

class _SearchInventoryState
    extends State<SearchInventory> {

  final TextEditingController
      _searchController =
      TextEditingController();

  bool lowStockOnly = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<InventoryProvider>();

    List<Inventory> items =
        provider.inventoryList;

    final keyword =
        _searchController.text
            .trim()
            .toLowerCase();

    if (keyword.isNotEmpty) {

      items = items.where((item) {

        return item.sku
                .toLowerCase()
                .contains(keyword) ||

            item.fabric
                .toLowerCase()
                .contains(keyword) ||

            item.color
                .toLowerCase()
                .contains(keyword);

      }).toList();

    }

    if (lowStockOnly) {

      items = items.where((item) {

        return item.quantity <=
            provider.lowStockThreshold;

      }).toList();

    }

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Search Inventory",
        ),

      ),

      body: Column(

        children: [

          Padding(

            padding:
                const EdgeInsets.all(16),

            child: TextField(

              controller:
                  _searchController,

              decoration:
                  InputDecoration(

                hintText:
                    "Search SKU, Fabric or Color",

                prefixIcon:
                    const Icon(
                  Icons.search,
                ),

                suffixIcon:
                    IconButton(

                  icon: const Icon(
                    Icons.clear,
                  ),

                  onPressed: () {

                    _searchController.clear();

                    setState(() {});

                  },

                ),

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),

                ),

              ),

              onChanged: (_) {

                setState(() {});

              },

            ),

          ),

          Padding(

            padding:
                const EdgeInsets.symmetric(
              horizontal: 16,
            ),

            child: SwitchListTile(

              value: lowStockOnly,

              title: const Text(
                "Show only low stock items",
              ),

              onChanged: (value) {

                setState(() {

                  lowStockOnly = value;

                });

              },

            ),

          ),

          Expanded(

            child: items.isEmpty

                ? Center(

                    child: Column(

                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        Image.asset(
                          "assets/placeholders/no_data.png",
                          width: 180,
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        const Text(
                          "No inventory found",
                        ),

                      ],

                    ),

                  )

                : ListView.builder(

                    itemCount: items.length,

                    itemBuilder:
                        (context, index) {

                      final item =
                          items[index];

                      final low =
                          item.quantity <=
                              provider
                                  .lowStockThreshold;

                      return Card(

                        margin:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),

                        child: ListTile(

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

                          subtitle: Column(

                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                item.fabric,
                              ),

                              Text(
                                item.color,
                              ),

                              if (low)

                                const Text(

                                  "Low Stock",

                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),

                                ),

                            ],

                          ),

                          trailing:
                              const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    InventoryDetails(
                                  inventory: item,
                                ),

                              ),

                            );

                          },

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