import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/inventory.dart';
import '../../providers/brand_provider.dart';
import '../../providers/inventory_provider.dart';
import '../../services/sku_generator.dart';

class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({
    super.key,
  });

  @override
  State<AddInventoryScreen> createState() =>
      _AddInventoryScreenState();
}

class _AddInventoryScreenState
    extends State<AddInventoryScreen> {
  final _formKey =
      GlobalKey<FormState>();

  final _skuController =
      TextEditingController();

  final _fabricController =
      TextEditingController();

  final _colorController =
      TextEditingController();

  final _quantityController =
      TextEditingController(
    text: "0",
  );

  final _notesController =
      TextEditingController();

  int? _brandId;

  @override
  void initState() {
    super.initState();

    _generateSku();
  }

  void _generateSku() {
    _skuController.text =
        SkuGenerator.generate();
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

  Future<void> _save() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final inventory = Inventory(
      id: null,
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
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await context
        .read<InventoryProvider>()
        .addInventory(
          inventory,
        );

    if (!mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          "Inventory added successfully",
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final brandProvider =
        context.watch<BrandProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Inventory",
        ),
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
                    InputDecoration(
                  labelText: "SKU",
                  suffixIcon:
                      IconButton(
                    onPressed:
                        _generateSku,
                    icon: const Icon(
                      Icons.refresh,
                    ),
                  ),
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
                  labelText:
                      "Fabric",
                ),
                validator:
                    (value) {
                  if (value ==
                          null ||
                      value
                          .trim()
                          .isEmpty) {
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
                  labelText:
                      "Color",
                ),
                validator:
                    (value) {
                  if (value ==
                          null ||
                      value
                          .trim()
                          .isEmpty) {
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
                validator:
                    (value) {
                  if (value ==
                          null ||
                      value
                          .isEmpty) {
                    return "Enter quantity";
                  }

                  return null;
                },
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
                items:
                    brandProvider.brands
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
                onChanged:
                    (value) {
                  setState(() {
                    _brandId =
                        value;
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
                  onPressed: _save,
                  icon: const Icon(
                    Icons.save,
                  ),
                  label: const Text(
                    "Save Inventory",
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