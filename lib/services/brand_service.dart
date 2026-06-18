import 'dart:io';

import '../models/brand.dart';
import 'storage_service.dart';

class BrandService {
  BrandService._();

  static final BrandService instance =
      BrandService._();

  final StorageService _storageService =
      StorageService.instance;

  Brand? _defaultBrand;

  /// Set default brand
  Future<void> setDefaultBrand(
    Brand brand,
  ) async {
    _defaultBrand = brand;
  }

  /// Get default brand
  Future<Brand?> getDefaultBrand()
      async {
    return _defaultBrand;
  }

  /// Check default brand exists
  Future<bool> hasDefaultBrand()
      async {
    return _defaultBrand != null;
  }

  /// Save logo to app storage
  Future<File> saveLogo({
    required File sourceFile,
    required String fileName,
  }) async {
    final logoDirectory =
        await _storageService
            .getLogosDirectory();

    final destination = File(
      "${logoDirectory.path}/$fileName",
    );

    return await sourceFile.copy(
      destination.path,
    );
  }

  /// Delete logo
  Future<void> deleteLogo(
    String logoPath,
  ) async {
    final file = File(logoPath);

    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Verify logo exists
  Future<bool> logoExists(
    String logoPath,
  ) async {
    return await File(
      logoPath,
    ).exists();
  }

  /// Create empty brand
  Brand createBrand() {
    return Brand(
      id: null,
      businessName: "",
      ownerName: "",
      logoPath: "",
      address: "",
      phone: "",
      email: "",
      gstNumber: "",
      footer: "",
      themeColor: "#1976D2",
      isDefault: false,
    );
  }

  /// Validate brand information
  bool validateBrand(
    Brand brand,
  ) {
    if (brand.businessName
        .trim()
        .isEmpty) {
      return false;
    }

    if (brand.ownerName
        .trim()
        .isEmpty) {
      return false;
    }

    return true;
  }

  /// Export header for reports
  Map<String, String> exportHeader(
    Brand brand,
  ) {
    return {
      "businessName":
          brand.businessName,
      "ownerName":
          brand.ownerName,
      "address":
          brand.address,
      "phone":
          brand.phone,
      "email":
          brand.email,
      "gstNumber":
          brand.gstNumber,
      "footer":
          brand.footer,
      "logoPath":
          brand.logoPath,
    };
  }
}