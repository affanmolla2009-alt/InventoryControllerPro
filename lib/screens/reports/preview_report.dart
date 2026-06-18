import 'package:flutter/material.dart';

class PreviewReport extends StatelessWidget {
  const PreviewReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report Preview",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius:
                BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center,

            children: [

              Image.asset(
                "assets/logos/default_logo.png",
                height: 90,
              ),

              const SizedBox(height: 15),

              const Text(
                "Inventory Controller Pro",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Company Address",
              ),

              const Text(
                "+91 XXXXXXXXXX",
              ),

              const Text(
                "company@email.com",
              ),

              const Text(
                "GSTIN : XXXXXXXXXXXXXXX",
              ),

              const SizedBox(height: 20),

              const Divider(),

              const SizedBox(height: 10),

              const Text(
                "MONTHLY INVENTORY REPORT",
                style: TextStyle(
                  fontWeight:
                      FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "Generated : ${DateTime.now()}",
                textAlign:
                    TextAlign.center,
              ),

              const SizedBox(height: 20),

              Table(
                border:
                    TableBorder.all(),

                columnWidths:
                    const {

                  0: FlexColumnWidth(2),

                  1: FlexColumnWidth(2),

                  2: FlexColumnWidth(2),

                  3: FlexColumnWidth(1),

                },

                children: const [

                  TableRow(

                    decoration:
                        BoxDecoration(
                      color:
                          Color(
                        0xFFE0E0E0,
                      ),
                    ),

                    children: [

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "SKU",
                          textAlign:
                              TextAlign
                                  .center,
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "Fabric",
                          textAlign:
                              TextAlign
                                  .center,
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "Color",
                          textAlign:
                              TextAlign
                                  .center,
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "Qty",
                          textAlign:
                              TextAlign
                                  .center,
                        ),
                      ),

                    ],

                  ),

                  TableRow(

                    children: [

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "SKU001",
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "Cotton",
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "Black",
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "120",
                        ),
                      ),

                    ],

                  ),

                  TableRow(

                    children: [

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "SKU002",
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "Denim",
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "Blue",
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.all(
                                8),
                        child: Text(
                          "85",
                        ),
                      ),

                    ],

                  ),

                ],

              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(
                        15),

                decoration: BoxDecoration(
                  color: Colors.grey
                      .shade100,
                  borderRadius:
                      BorderRadius.circular(
                          8),
                ),

                child: const Column(

                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    Text(
                      "Summary",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Total Products : 2",
                    ),

                    Text(
                      "Total Quantity : 205",
                    ),

                    Text(
                      "Low Stock Items : 0",
                    ),

                  ],

                ),

              ),

              const SizedBox(height: 35),

              const Divider(),

              const SizedBox(height: 15),

              const Text(
                "Thank you for using Inventory Controller Pro.",
                textAlign:
                    TextAlign.center,
              ),

              const SizedBox(height: 5),

              const Text(
                "Generated automatically by the application.",
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}