import 'package:flutter/material.dart';

class LowStockChip extends StatelessWidget {
  final int quantity;
  final int lowStockLimit;

  const LowStockChip({
    super.key,
    required this.quantity,
    this.lowStockLimit = 10,
  });

  Color get _backgroundColor {
    if (quantity <= 0) {
      return Colors.red.shade100;
    }

    if (quantity <= lowStockLimit) {
      return Colors.orange.shade100;
    }

    return Colors.green.shade100;
  }

  Color get _textColor {
    if (quantity <= 0) {
      return Colors.red;
    }

    if (quantity <= lowStockLimit) {
      return Colors.orange;
    }

    return Colors.green;
  }

  IconData get _icon {
    if (quantity <= 0) {
      return Icons.cancel;
    }

    if (quantity <= lowStockLimit) {
      return Icons.warning;
    }

    return Icons.check_circle;
  }

  String get _label {
    if (quantity <= 0) {
      return "Out of Stock";
    }

    if (quantity <= lowStockLimit) {
      return "Low Stock";
    }

    return "In Stock";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [

          Icon(
            _icon,
            size: 16,
            color: _textColor,
          ),

          const SizedBox(width: 6),

          Text(
            _label,
            style: TextStyle(
              color: _textColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 8),

          Text(
            "($quantity)",
            style: TextStyle(
              color: _textColor,
            ),
          ),

        ],
      ),
    );
  }
}