import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/brand_provider.dart';
import '../../providers/inventory_provider.dart';
import '../../providers/theme_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inventoryProvider =
        context.watch<InventoryProvider>();

    final brandProvider =
        context.watch<BrandProvider>();

    final themeProvider =
        context.watch<ThemeProvider>();

    final isDark =
        themeProvider.isDark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inventory Controller Pro",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await inventoryProvider.loadInventory();
          await brandProvider.loadBrands();
        },
        child: ListView(
          padding:
              const EdgeInsets.all(16),
          children: [

            /// Brand Card
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(
                    Icons.business,
                  ),
                ),
                title: Text(
                  brandProvider
                          .selectedBrand
                          ?.businessName ??
                      "No Brand Selected",
                ),
                subtitle: Text(
                  brandProvider
                          .selectedBrand
                          ?.ownerName ??
                      "",
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            /// Total Products

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.inventory_2,
                ),
                title: const Text(
                  "Total Products",
                ),
                trailing: Text(
                  inventoryProvider
                      .totalProducts
                      .toString(),
                  style:
                      const TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// Total Quantity

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.numbers,
                ),
                title: const Text(
                  "Total Quantity",
                ),
                trailing: Text(
                  inventoryProvider
                      .totalQuantity
                      .toString(),
                  style:
                      const TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// Low Stock

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.warning,
                ),
                title: const Text(
                  "Low Stock Items",
                ),
                trailing: Text(
                  inventoryProvider
                      .lowStockItems
                      .length
                      .toString(),
                  style:
                      const TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [

                _actionCard(
                  icon:
                      Icons.add_box_outlined,
                  title:
                      "Add Inventory",
                  onTap: () {},
                ),

                _actionCard(
                  icon:
                      Icons.inventory,
                  title:
                      "Inventory",
                  onTap: () {},
                ),

                _actionCard(
                  icon:
                      Icons.business,
                  title:
                      "Brands",
                  onTap: () {},
                ),

                _actionCard(
                  icon:
                      Icons.file_download,
                  title:
                      "Export",
                  onTap: () {},
                ),

                _actionCard(
                  icon:
                      Icons.upload_file,
                  title:
                      "Import",
                  onTap: () {},
                ),

                _actionCard(
                  icon:
                      Icons.bar_chart,
                  title:
                      "Reports",
                  onTap: () {},
                ),

                _actionCard(
                  icon:
                      Icons.analytics,
                  title:
                      "Analytics",
                  onTap: () {},
                ),

                _actionCard(
                  icon:
                      Icons.settings,
                  title:
                      "Settings",
                  onTap: () {},
                ),

              ],
            ),

            const SizedBox(
              height: 25,
            ),

            Text(
              "Recent Activity",
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
                color: isDark
                    ? Colors.white
                    : Colors.black,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            inventoryProvider
                    .inventoryList
                    .isEmpty
                ? Image.asset(
                    "assets/placeholders/no_data.png",
                    height: 200,
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount:
                        inventoryProvider
                            .inventoryList
                            .length,
                    itemBuilder:
                        (context, index) {
                      final item =
                          inventoryProvider
                                  .inventoryList[
                              index];

                      return Card(
                        child: ListTile(
                          leading:
                              const Icon(
                            Icons.inventory,
                          ),
                          title: Text(
                            item.sku,
                          ),
                          subtitle:
                              Text(
                            "${item.fabric} • ${item.color}",
                          ),
                          trailing:
                              Text(
                            item.quantity
                                .toString(),
                          ),
                        ),
                      );
                    },
                  ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        borderRadius:
            BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 38,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign:
                  TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}