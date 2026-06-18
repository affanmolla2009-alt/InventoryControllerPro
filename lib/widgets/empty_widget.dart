import 'package:flutter/material.dart';

enum EmptyWidgetType {
  noData,
  noImage,
  noInventory,
  noBrand,
}

class EmptyWidget extends StatelessWidget {
  final EmptyWidgetType type;
  final String? title;
  final String? description;
  final String? buttonText;
  final VoidCallback? onPressed;

  const EmptyWidget({
    super.key,
    required this.type,
    this.title,
    this.description,
    this.buttonText,
    this.onPressed,
  });

  String get imagePath {
    switch (type) {
      case EmptyWidgetType.noData:
        return "assets/placeholders/no_data.png";

      case EmptyWidgetType.noImage:
        return "assets/placeholders/no_image.png";

      case EmptyWidgetType.noInventory:
        return "assets/images/empty_inventory.png";

      case EmptyWidgetType.noBrand:
        return "assets/images/empty_brand.png";
    }
  }

  String get defaultTitle {
    switch (type) {
      case EmptyWidgetType.noData:
        return "No Data Found";

      case EmptyWidgetType.noImage:
        return "No Image Available";

      case EmptyWidgetType.noInventory:
        return "Inventory is Empty";

      case EmptyWidgetType.noBrand:
        return "No Brands Added";
    }
  }

  String get defaultDescription {
    switch (type) {
      case EmptyWidgetType.noData:
        return "There is currently no data to display.";

      case EmptyWidgetType.noImage:
        return "No image has been assigned.";

      case EmptyWidgetType.noInventory:
        return "Start adding products to build your inventory.";

      case EmptyWidgetType.noBrand:
        return "Create your first brand to organize products.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Image.asset(
              imagePath,
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 24),

            Text(
              title ?? defaultTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              description ?? defaultDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),

            if (buttonText != null &&
                onPressed != null) ...[

              const SizedBox(height: 28),

              SizedBox(
                width: 200,
                height: 48,

                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(buttonText!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}