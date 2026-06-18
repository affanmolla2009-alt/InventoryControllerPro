import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/brand.dart';
import '../../providers/brand_provider.dart';

class AddBrandScreen extends StatefulWidget {
  const AddBrandScreen({super.key});

  @override
  State<AddBrandScreen> createState() =>
      _AddBrandScreenState();
}

class _AddBrandScreenState
    extends State<AddBrandScreen> {
  final _formKey =
      GlobalKey<FormState>();

  final _businessController =
      TextEditingController();

  final _ownerController =
      TextEditingController();

  final _addressController =
      TextEditingController();

  final _phoneController =
      TextEditingController();

  final _emailController =
      TextEditingController();

  final _gstController =
      TextEditingController();

  final _footerController =
      TextEditingController();

  final _logoController =
      TextEditingController();

  bool _defaultBrand = false;

  Color _themeColor =
      Colors.blue;

  @override
  void dispose() {
    _businessController.dispose();
    _ownerController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _gstController.dispose();
    _footerController.dispose();
    _logoController.dispose();

    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final brand = Brand(
      id: null,
      businessName:
          _businessController.text.trim(),
      ownerName:
          _ownerController.text.trim(),
      logoPath:
          _logoController.text.trim(),
      address:
          _addressController.text.trim(),
      phone:
          _phoneController.text.trim(),
      email:
          _emailController.text.trim(),
      gstNumber:
          _gstController.text.trim(),
      footer:
          _footerController.text.trim(),
      themeColor:
          _themeColor.value,
      isDefault:
          _defaultBrand,
    );

    await context
        .read<BrandProvider>()
        .addBrand(brand);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Business Brand",
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              GestureDetector(
                onTap: () {
                  // image picker service
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage:
                      _logoController
                              .text
                              .isEmpty
                          ? const AssetImage(
                                  "assets/logos/default_logo.png")
                              as ImageProvider
                          : AssetImage(
                              _logoController
                                  .text,
                            ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Tap to select logo",
              ),

              const SizedBox(
                height: 25,
              ),

              TextFormField(
                controller:
                    _businessController,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Business Name",
                ),
                validator: (v) =>
                    v!.isEmpty
                        ? "Required"
                        : null,
              ),

              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller:
                    _ownerController,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Owner Name",
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller:
                    _addressController,
                maxLines: 2,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Address",
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller:
                    _phoneController,
                keyboardType:
                    TextInputType.phone,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Phone",
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller:
                    _emailController,
                keyboardType:
                    TextInputType.emailAddress,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Email",
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller:
                    _gstController,
                decoration:
                    const InputDecoration(
                  labelText:
                      "GST Number",
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller:
                    _footerController,
                maxLines: 2,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Footer Text",
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              DropdownButtonFormField<Color>(
                value: _themeColor,
                decoration:
                    const InputDecoration(
                  labelText:
                      "Theme Color",
                ),
                items: const [

                  DropdownMenuItem(
                    value: Colors.blue,
                    child: Text("Blue"),
                  ),

                  DropdownMenuItem(
                    value: Colors.green,
                    child: Text("Green"),
                  ),

                  DropdownMenuItem(
                    value: Colors.red,
                    child: Text("Red"),
                  ),

                  DropdownMenuItem(
                    value: Colors.orange,
                    child: Text("Orange"),
                  ),

                  DropdownMenuItem(
                    value: Colors.purple,
                    child: Text("Purple"),
                  ),

                ],
                onChanged: (color) {
                  setState(() {
                    _themeColor =
                        color!;
                  });
                },
              ),

              const SizedBox(
                height: 20,
              ),

              SwitchListTile(
                value: _defaultBrand,
                title: const Text(
                  "Set as Default Brand",
                ),
                onChanged: (value) {
                  setState(() {
                    _defaultBrand =
                        value;
                  });
                },
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
                  icon: const Icon(
                    Icons.save,
                  ),
                  label: const Text(
                    "Save Brand",
                  ),
                  onPressed: _save,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}