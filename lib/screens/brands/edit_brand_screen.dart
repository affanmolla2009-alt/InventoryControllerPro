import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/brand.dart';
import '../../providers/brand_provider.dart';

class EditBrandScreen extends StatefulWidget {
  final Brand brand;

  const EditBrandScreen({
    super.key,
    required this.brand,
  });

  @override
  State<EditBrandScreen> createState() =>
      _EditBrandScreenState();
}

class _EditBrandScreenState
    extends State<EditBrandScreen> {

  final _formKey =
      GlobalKey<FormState>();

  late TextEditingController
      _businessController;

  late TextEditingController
      _ownerController;

  late TextEditingController
      _addressController;

  late TextEditingController
      _phoneController;

  late TextEditingController
      _emailController;

  late TextEditingController
      _gstController;

  late TextEditingController
      _footerController;

  late TextEditingController
      _logoController;

  late bool _defaultBrand;

  late Color _themeColor;

  @override
  void initState() {

    super.initState();

    _businessController =
        TextEditingController(
      text:
          widget.brand.businessName,
    );

    _ownerController =
        TextEditingController(
      text:
          widget.brand.ownerName,
    );

    _addressController =
        TextEditingController(
      text:
          widget.brand.address,
    );

    _phoneController =
        TextEditingController(
      text:
          widget.brand.phone,
    );

    _emailController =
        TextEditingController(
      text:
          widget.brand.email,
    );

    _gstController =
        TextEditingController(
      text:
          widget.brand.gstNumber,
    );

    _footerController =
        TextEditingController(
      text:
          widget.brand.footer,
    );

    _logoController =
        TextEditingController(
      text:
          widget.brand.logoPath,
    );

    _defaultBrand =
        widget.brand.isDefault;

    _themeColor =
        Color(widget.brand.themeColor);
  }

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

  Future<void> _update() async {

    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final updated =
        widget.brand.copyWith(

      businessName:
          _businessController.text
              .trim(),

      ownerName:
          _ownerController.text
              .trim(),

      address:
          _addressController.text
              .trim(),

      phone:
          _phoneController.text
              .trim(),

      email:
          _emailController.text
              .trim(),

      gstNumber:
          _gstController.text
              .trim(),

      footer:
          _footerController.text
              .trim(),

      logoPath:
          _logoController.text
              .trim(),

      themeColor:
          _themeColor.value,

      isDefault:
          _defaultBrand,

    );

    await context
        .read<BrandProvider>()
        .updateBrand(
          updated,
        );

    if (!mounted) return;

    Navigator.pop(context);
  }

  Future<void> _delete() async {

    final confirm =
        await showDialog<bool>(

      context: context,

      builder: (_) {

        return AlertDialog(

          title: const Text(
            "Delete Brand",
          ),

          content: const Text(
            "Are you sure you want to permanently delete this business brand?",
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
        .read<BrandProvider>()
        .deleteBrand(
          widget.brand.id!,
        );

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Edit Business Brand",
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
                              "assets/logos/default_logo.png",
                            )

                          : AssetImage(
                              _logoController
                                  .text,
                            ) as ImageProvider,

                ),

              ),

              const SizedBox(
                height: 20,
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
                    v == null ||
                            v.isEmpty
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

              SwitchListTile(

                value: _defaultBrand,

                title: const Text(
                  "Default Brand",
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

                  onPressed:
                      _update,

                  icon: const Icon(
                    Icons.save,
                  ),

                  label: const Text(
                    "Update Brand",
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