import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String brandName;
  final String contactPerson;
  final String phoneNumber;
  final String email;
  final int totalProducts;
  final DateTime createdAt;
  final String? logoPath;

  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const BrandCard({
    super.key,
    required this.brandName,
    required this.contactPerson,
    required this.phoneNumber,
    required this.email,
    required this.totalProducts,
    required this.createdAt,
    this.logoPath,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      elevation: 2,

      child: InkWell(

        borderRadius:
            BorderRadius.circular(12),

        onTap: onTap,

        child: Padding(

          padding: const EdgeInsets.all(14),

          child: Row(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              ClipRRect(

                borderRadius:
                    BorderRadius.circular(10),

                child: logoPath == null

                    ? Image.asset(

                        "assets/placeholders/no_logo.png",

                        width: 70,

                        height: 70,

                        fit: BoxFit.cover,

                      )

                    : Image.asset(

                        logoPath!,

                        width: 70,

                        height: 70,

                        fit: BoxFit.cover,

                        errorBuilder:
                            (_, __, ___) {

                          return Image.asset(

                            "assets/placeholders/no_logo.png",

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

                      brandName,

                      style: const TextStyle(

                        fontSize: 19,

                        fontWeight:
                            FontWeight.bold,

                      ),

                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Contact : $contactPerson",
                    ),

                    Text(
                      "Phone : $phoneNumber",
                    ),

                    Text(
                      "Email : $email",
                    ),

                    const SizedBox(height: 8),

                    Container(

                      padding:
                          const EdgeInsets.symmetric(

                        horizontal: 10,

                        vertical: 5,

                      ),

                      decoration: BoxDecoration(

                        color:
                            Colors.blue.shade100,

                        borderRadius:
                            BorderRadius.circular(
                                20),

                      ),

                      child: Text(

                        "$totalProducts Products",

                        style: TextStyle(

                          color: Colors.blue.shade900,

                          fontWeight:
                              FontWeight.bold,

                        ),

                      ),

                    ),

                    const SizedBox(height: 8),

                    Text(

                      "Created : ${createdAt.day}/${createdAt.month}/${createdAt.year}",

                      style: const TextStyle(
                        fontSize: 12,
                      ),

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