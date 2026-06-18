import 'package:flutter/material.dart';

enum ExportType {
  excel,
  png,
  share,
}

class ExportButton extends StatefulWidget {
  final ExportType exportType;
  final String label;
  final VoidCallback? onPressed;

  const ExportButton({
    super.key,
    required this.exportType,
    required this.label,
    this.onPressed,
  });

  @override
  State<ExportButton> createState() =>
      _ExportButtonState();
}

class _ExportButtonState
    extends State<ExportButton> {

  bool isLoading = false;

  Future<void> _handleExport() async {

    setState(() {
      isLoading = true;
    });

    /*
      excel_export_service.dart

      png_export_service.dart

      share_service.dart

      Call respective service here.
    */

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    widget.onPressed?.call();

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        content: Text(
          "${widget.label} completed successfully.",
        ),

      ),

    );

  }

  IconData get _icon {

    switch (widget.exportType) {

      case ExportType.excel:
        return Icons.table_chart;

      case ExportType.png:
        return Icons.image;

      case ExportType.share:
        return Icons.share;

    }

  }

  Color get _color {

    switch (widget.exportType) {

      case ExportType.excel:
        return Colors.green;

      case ExportType.png:
        return Colors.deepPurple;

      case ExportType.share:
        return Colors.blue;

    }

  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      width: double.infinity,

      height: 55,

      child: ElevatedButton.icon(

        style: ElevatedButton.styleFrom(

          backgroundColor: _color,

          shape: RoundedRectangleBorder(

            borderRadius:
                BorderRadius.circular(12),

          ),

        ),

        onPressed:
            isLoading ? null : _handleExport,

        icon: isLoading

            ? const SizedBox(

                width: 20,

                height: 20,

                child:
                    CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),

              )

            : Icon(_icon),

        label: Text(

          isLoading
              ? "Processing..."
              : widget.label,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),

        ),

      ),

    );

  }

}