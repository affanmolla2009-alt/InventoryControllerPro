import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double progress;
  final String? percentage;
  final bool isIncrease;
  final VoidCallback? onTap;

  const StatisticCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color = Colors.blue,
    this.progress = 0.0,
    this.percentage,
    this.isIncrease = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double safeProgress =
        progress.clamp(0.0, 1.0);

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
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Row(
                children: [

                  Container(
                    padding:
                        const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color:
                          color.withOpacity(0.12),

                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),

                    child: Icon(
                      icon,
                      color: color,
                      size: 28,
                    ),
                  ),

                  const Spacer(),

                  if (percentage != null)

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: isIncrease
                            ? Colors.green.shade100
                            : Colors.red.shade100,

                        borderRadius:
                            BorderRadius.circular(
                          20,
                        ),
                      ),

                      child: Row(
                        children: [

                          Icon(
                            isIncrease
                                ? Icons.trending_up
                                : Icons.trending_down,
                            size: 16,
                            color: isIncrease
                                ? Colors.green
                                : Colors.red,
                          ),

                          const SizedBox(width: 4),

                          Text(
                            percentage!,
                            style: TextStyle(
                              color: isIncrease
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),

                ],
              ),

              const SizedBox(height: 20),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 18),

              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10),

                child: LinearProgressIndicator(
                  value: safeProgress,
                  minHeight: 8,
                  backgroundColor:
                      Colors.grey.shade200,
                  valueColor:
                      AlwaysStoppedAnimation(
                    color,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Align(
                alignment:
                    Alignment.centerRight,

                child: Text(
                  "${(safeProgress * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight:
                        FontWeight.w600,
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