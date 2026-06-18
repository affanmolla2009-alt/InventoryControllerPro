import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final bool showTrend;
  final bool isPositiveTrend;
  final String trendText;
  final VoidCallback? onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.subtitle,
    this.iconColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.showTrend = false,
    this.isPositiveTrend = true,
    this.trendText = "",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 2,

      shape: RoundedRectangleBorder(

        borderRadius:
            BorderRadius.circular(16),

      ),

      child: InkWell(

        borderRadius:
            BorderRadius.circular(16),

        onTap: onTap,

        child: Padding(

          padding:
              const EdgeInsets.all(16),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Row(

                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  Container(

                    padding:
                        const EdgeInsets.all(
                      10,
                    ),

                    decoration:
                        BoxDecoration(

                      color:
                          iconColor.withOpacity(
                        0.12,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                    ),

                    child: Icon(

                      icon,

                      size: 28,

                      color: iconColor,

                    ),

                  ),

                  if (showTrend)

                    Row(

                      children: [

                        Icon(

                          isPositiveTrend
                              ? Icons
                                  .trending_up
                              : Icons
                                  .trending_down,

                          size: 18,

                          color:
                              isPositiveTrend
                                  ? Colors.green
                                  : Colors.red,

                        ),

                        const SizedBox(
                          width: 4,
                        ),

                        Text(

                          trendText,

                          style:
                              TextStyle(

                            color:
                                isPositiveTrend
                                    ? Colors
                                        .green
                                    : Colors.red,

                            fontWeight:
                                FontWeight.bold,

                          ),

                        ),

                      ],

                    ),

                ],

              ),

              const Spacer(),

              Text(

                value,

                style: const TextStyle(

                  fontSize: 30,

                  fontWeight:
                      FontWeight.bold,

                ),

              ),

              const SizedBox(height: 6),

              Text(

                title,

                style: TextStyle(

                  fontSize: 16,

                  color:
                      Colors.grey.shade700,

                ),

              ),

              if (subtitle != null)

                Padding(

                  padding:
                      const EdgeInsets.only(
                    top: 4,
                  ),

                  child: Text(

                    subtitle!,

                    style: TextStyle(

                      color:
                          Colors.grey.shade600,

                      fontSize: 13,

                    ),

                  ),

                ),

            ],

          ),

        ),

      ),

    );

  }

}