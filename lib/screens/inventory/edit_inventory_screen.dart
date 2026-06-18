import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/inventory.dart';
import '../../providers/brand_provider.dart';
import '../../providers/inventory_provider.dart';

class EditInventoryScreen extends StatefulWidget {
  final Inventory inventory;

  const EditInventoryScreen({
    super.key,
    required this.inventory,
  });

  @override
  State<EditInventoryScreen> createState() =>
      _EditInventoryScreenState();
}

class _EditInventoryScreenState
    extends State<EditInventoryScreen> {
  final _formKey =
      GlobalKey<FormState>();

  late TextEditingController _skuController;
  late TextEditingController _fabricController;
  late TextEditingController _colorController;
  late TextEditingController _quantityController;
  late TextEditingController _notesController;

  int? _brandId;

  @override
  void initState() {
    super.initState();

    _skuController = TextEditingController(
      text: widget.inventory.sku,
    );

    _fabricController = TextEditingController(
      text: widget.inventory.fabric,
    );

    _colorController = TextEditingController(
      text: widget.inventory.color,
    );

    _quantityController =
        TextEditingController(
      text: widget.inventory.quantity
          .toString(),
    );

    _notesController =
        TextEditingController(
      text: widget.inventory.notes,
    );

    _brandId =
        widget.inventory.brandId;
  }

  @override
  void dispose() {
    _skuController.dispose();
    _fabricController.dispose();
    _colorController.dispose();
    _quantityController.dispose();
    _notesController.dispose();

    super.dispose();
  }

  Future<void> _update() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final updated =
        widget.inventory.copyWith(
      sku: _skuController.text.trim(),
      fabric:
          _fabricController.text.trim(),
      color:
          _colorController.text.trim(),
      quantity: int.parse(
        _quantityController.text,
      ),
      notes:
          _notesController.text.trim(),
      brandId: _brandId,
      updatedAt: DateTime.now(),
    );

    await context
        .read<InventoryProvider>()
        .updateInventory(
          updated,
        );

    if (!mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          "Inventory updated successfully",
        ),
      ),
    );

    Navigator.pop(context);
  }

  Future<void> _delete() async {
    final confirm =
        await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Delete Item",
          ),
          content: const Text(
            "Are you sure you want to delete this inventory item?",
          ),
          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  false,
                );
              },
              child: const Text(
                "Cancel",
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  true,
                );
              },
              child: const Text(
                "Delete",
              ),
            ),

          ],
        );
      },
    );

    if (confirm != true) {
      return;
    }

    await context
        .read<InventoryProvider>()
        .deleteInventory(
          widget.inventory.id!,
        );

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    final brandProvider =
        context.watch<BrandProvider>();

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Edit Inventory",
        ),

        actions: [

          IconButton(
            onPressed: _delete,
            icon: const Icon(
              Icons.delete,
            ),
          ),

        ],

      ),

      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(16),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              TextFormField(
                controller:
                    _skuController,
                readOnly: true,
                decoration:
                    const InputDecoration(
                  labelText: "SKU",
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              TextFormField(
                controller:
                    _fabricController,
                decoration:
                    const InputDecoration(
                  labelText: "Fabric",
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return "Enter fabric";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 16,
              ),

              TextFormField(
                controller:
                    _colorController,
                decoration:
                    const InputDecoration(
                  labelText: "Color",
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return "Enter color";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 16,
              ),

              TextFormField(
                controller:
                    _quantityController,
                keyboardType:
                    TextInputType.number,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Quantity (pcs)",
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              DropdownButtonFormField<int>(

                value: _brandId,

                decoration:
                    const InputDecoration(
                  labelText:
                      "Business Brand",
                ),

                items: brandProvider
                    .brands
                    .map(
                  (brand) {

                    return DropdownMenuItem(

                      value: brand.id,

                      child: Text(
                        brand.businessName,
                      ),

                    );

                  },
                ).toList(),

                onChanged: (value) {

                  setState(() {

                    _brandId = value;

                  });

                },

              ),

              const SizedBox(
                height: 16,
              ),

              TextFormField(
                controller:
                    _notesController,
                maxLines: 4,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Notes",
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              SizedBox(

                width:
                    double.infinity,

                height: 55,

                child:
                    ElevatedButton.icon(

                  onPressed: _update,

                  icon: const Icon(
                    Icons.save,
                  ),

                  label: const Text(
                    "Update Inventory",
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