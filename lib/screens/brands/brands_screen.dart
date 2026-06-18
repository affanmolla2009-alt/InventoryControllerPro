import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/brand_provider.dart';
import 'add_brand_screen.dart';
import 'brand_preview.dart';
import 'edit_brand_screen.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<BrandProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Business Brands",
        ),
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddBrandScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),

      body: provider.brands.isEmpty

          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [

                  Image.asset(
                    "assets/images/empty_brand.png",
                    width: 220,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "No Business Brand Added",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            )

          : ListView.builder(

              padding:
                  const EdgeInsets.all(12),

              itemCount:
                  provider.brands.length,

              itemBuilder:
                  (context, index) {

                final brand =
                    provider.brands[index];

                return Card(

                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),

                  elevation: 3,

                  child: ListTile(

                    leading:
                        CircleAvatar(

                      backgroundImage:

                          brand.logoPath
                                  .isEmpty

                              ? const AssetImage(
                                  "assets/logos/default_logo.png",
                                )

                              : AssetImage(
                                  brand.logoPath,
                                ) as ImageProvider,

                    ),

                    title: Text(
                      brand.businessName,
                    ),

                    subtitle: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        Text(
                          brand.ownerName,
                        ),

                        Text(
                          brand.address,
                        ),

                        if (brand.isDefault)

                          const Padding(

                            padding:
                                EdgeInsets.only(
                              top: 4,
                            ),

                            child: Chip(
                              label: Text(
                                "Default Brand",
                              ),
                            ),

                          ),

                      ],

                    ),

                    isThreeLine: true,

                    trailing: PopupMenuButton(

                      itemBuilder:
                          (context) {

                        return [

                          const PopupMenuItem(

                            value: 1,

                            child: Text(
                              "Preview",
                            ),

                          ),

                          const PopupMenuItem(

                            value: 2,

                            child: Text(
                              "Edit",
                            ),

                          ),

                          const PopupMenuItem(

                            value: 3,

                            child: Text(
                              "Set Default",
                            ),

                          ),

                          const PopupMenuItem(

                            value: 4,

                            child: Text(
                              "Delete",
                            ),

                          ),

                        ];

                      },

                      onSelected:
                          (value) {

                        switch (value) {

                          case 1:

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    BrandPreview(
                                  brand: brand,
                                ),

                              ),

                            );

                            break;

                          case 2:

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    EditBrandScreen(
                                  brand: brand,
                                ),

                              ),

                            );

                            break;

                          case 3:

                            provider
                                .setDefaultBrand(
                              brand.id!,
                            );

                            break;

                          case 4:

                            provider
                                .deleteBrand(
                              brand.id!,
                            );

                            break;

                        }

                      },

                    ),

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                              BrandPreview(
                            brand: brand,
                          ),

                        ),

                      );

                    },

                  ),

                );

              },

            ),

    );
  }
}