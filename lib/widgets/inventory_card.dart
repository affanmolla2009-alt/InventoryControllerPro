import 'package:flutter/material.dart';

class InventoryCard extends StatelessWidget {
  final String sku;
  final String productName;
  final String brand;
  final String category;
  final String color;
  final String size;
  final int quantity;
  final double price;
  final String? imagePath;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const InventoryCard({
    super.key,
    required this.sku,
    required this.productName,
    required this.brand,
    required this.category,
    required this.color,
    required this.size,
    required this.quantity,
    required this.price,
    this.imagePath,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  bool get isLowStock => quantity <= 10;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      elevation: 2,

      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(14),

          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              ClipRRect(

                borderRadius:
                    BorderRadius.circular(8),

                child: imagePath == null

                    ? Image.asset(
                        "assets/placeholders/no_image.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      )

                    : Image.asset(
                        imagePath!,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) {

                          return Image.asset(
                            "assets/placeholders/no_image.png",
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          );

                        },
                      ),

              ),

              const SizedBox(width: 14),

              Expanded(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(

                      productName,

                      style: const TextStyle(

                        fontSize: 18,

                        fontWeight:
                            FontWeight.bold,

                      ),

                    ),

                    const SizedBox(height: 4),

                    Text("SKU : $sku"),

                    Text("Brand : $brand"),

                    Text("Category : $category"),

                    Text("Color : $color"),

                    Text("Size : $size"),

                    const SizedBox(height: 8),

                    Row(

                      children: [

                        Container(

                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),

                          decoration:
                              BoxDecoration(

                            color: isLowStock
                                ? Colors.red.shade100
                                : Colors.green.shade100,

                            borderRadius:
                                BorderRadius.circular(
                                    20),

                          ),

                          child: Text(

                            "Qty : $quantity",

                            style: TextStyle(

                              color: isLowStock
                                  ? Colors.red
                                  : Colors.green,

                              fontWeight:
                                  FontWeight.bold,

                            ),

                          ),

                        ),

                        const SizedBox(width: 10),

                        Text(

                          "₹ ${price.toStringAsFixed(2)}",

                          style: const TextStyle(

                            fontWeight:
                                FontWeight.bold,

                            fontSize: 16,

                          ),

                        ),

                      ],

                    ),

                  ],

                ),

              ),

              PopupMenuButton<String>(

                onSelected: (value) {

                  switch (value) {

                    case "edit":
                      if (onEdit != null) {
                        onEdit!();
                      }
                      break;

                    case "delete":
                      if (onDelete != null) {
                        onDelete!();
                      }
                      break;

                  }

                },

                itemBuilder: (context) => [

                  const PopupMenuItem(

                    value: "edit",

                    child: Row(

                      children: [

                        Icon(Icons.edit),

                        SizedBox(width: 8),

                        Text("Edit"),

                      ],

                    ),

                  ),

                  const PopupMenuItem(

                    value: "delete",

                    child: Row(

                      children: [

                        Icon(Icons.delete),

                        SizedBox(width: 8),

                        Text("Delete"),

                      ],

                    ),

                  ),

                ],

              ),

            ],

          ),

        ),

      ),

    );

  }

}