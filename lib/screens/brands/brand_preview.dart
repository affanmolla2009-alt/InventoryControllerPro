import 'package:flutter/material.dart';

import '../../models/brand.dart';

class BrandPreview extends StatelessWidget {
  final Brand brand;

  const BrandPreview({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Brand Preview",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            CircleAvatar(
              radius: 60,
              backgroundImage: brand.logoPath.isEmpty
                  ? const AssetImage(
                      "assets/logos/default_logo.png",
                    )
                  : AssetImage(
                      brand.logoPath,
                    ) as ImageProvider,
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              brand.businessName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            Text(
              "Owner: ${brand.ownerName}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                ),
                title: const Text(
                  "Address",
                ),
                subtitle: Text(
                  brand.address.isEmpty
                      ? "-"
                      : brand.address,
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                ),
                title: const Text(
                  "Phone",
                ),
                subtitle: Text(
                  brand.phone.isEmpty
                      ? "-"
                      : brand.phone,
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.email,
                ),
                title: const Text(
                  "Email",
                ),
                subtitle: Text(
                  brand.email.isEmpty
                      ? "-"
                      : brand.email,
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.receipt_long,
                ),
                title: const Text(
                  "GST Number",
                ),
                subtitle: Text(
                  brand.gstNumber.isEmpty
                      ? "-"
                      : brand.gstNumber,
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.description,
                ),
                title: const Text(
                  "Footer",
                ),
                subtitle: Text(
                  brand.footer.isEmpty
                      ? "-"
                      : brand.footer,
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Color(
                    brand.themeColor,
                  ),
                ),
                title: const Text(
                  "Theme Color",
                ),
                subtitle: Text(
                  "#${brand.themeColor.toRadixString(16).toUpperCase()}",
                ),
              ),
            ),

            if (brand.isDefault)

              Padding(
                padding:
                    const EdgeInsets.only(
                  top: 12,
                ),
                child: Chip(
                  avatar: const Icon(
                    Icons.check_circle,
                  ),
                  label: const Text(
                    "Default Business Brand",
                  ),
                ),
              ),

            const SizedBox(
              height: 35,
            ),

            const Divider(),

            const SizedBox(
              height: 15,
            ),

            const Text(
              "Export Preview",
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(
                18,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius:
                    BorderRadius.circular(
                  12,
                ),
              ),
              child: Column(
                children: [

                  CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        brand.logoPath.isEmpty
                            ? const AssetImage(
                                "assets/logos/default_logo.png",
                              )
                            : AssetImage(
                                brand.logoPath,
                              ) as ImageProvider,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Text(
                    brand.businessName,
                    style:
                        const TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  Text(
                    brand.address,
                    textAlign:
                        TextAlign.center,
                  ),

                  Text(
                    brand.phone,
                  ),

                  Text(
                    brand.email,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  const Divider(),

                  const SizedBox(
                    height: 15,
                  ),

                  const Text(
                    "Inventory Report",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  Text(
                    brand.footer,
                    textAlign:
                        TextAlign.center,
                  ),

                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

          ],
        ),
      ),
    );
  }
}