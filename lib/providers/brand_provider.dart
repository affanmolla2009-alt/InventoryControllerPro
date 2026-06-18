import 'package:flutter/foundation.dart';

import '../models/brand.dart';
import '../repositories/brand_repository.dart';

class BrandProvider extends ChangeNotifier {
  BrandProvider({
    required BrandRepository repository,
  }) : _repository = repository;

  final BrandRepository _repository;

  List<Brand> _brands = [];

  bool _isLoading = false;

  Brand? _selectedBrand;

  List<Brand> get brands => _brands;

  bool get isLoading => _isLoading;

  Brand? get selectedBrand => _selectedBrand;

  Future<void> loadBrands() async {
    _isLoading = true;

    notifyListeners();

    _brands = await _repository.getAllBrands();

    if (_brands.isNotEmpty &&
        _selectedBrand == null) {
      _selectedBrand = _brands.firstWhere(
        (brand) => brand.isDefault,
        orElse: () => _brands.first,
      );
    }

    _isLoading = false;

    notifyListeners();
  }

  Future<void> addBrand(
    Brand brand,
  ) async {
    await _repository.insertBrand(
      brand,
    );

    await loadBrands();
  }

  Future<void> updateBrand(
    Brand brand,
  ) async {
    await _repository.updateBrand(
      brand,
    );

    await loadBrands();
  }

  Future<void> deleteBrand(
    int id,
  ) async {
    await _repository.deleteBrand(
      id,
    );

    await loadBrands();
  }

  void selectBrand(
    Brand brand,
  ) {
    _selectedBrand = brand;

    notifyListeners();
  }

  Future<void> setDefaultBrand(
    Brand brand,
  ) async {
    for (final item in _brands) {
      if (item.id == brand.id) {
        await _repository.updateBrand(
          item.copyWith(
            isDefault: true,
          ),
        );
      } else {
        await _repository.updateBrand(
          item.copyWith(
            isDefault: false,
          ),
        );
      }
    }

    await loadBrands();
  }

  Brand? findById(
    int id,
  ) {
    try {
      return _brands.firstWhere(
        (brand) => brand.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  bool get hasBrands =>
      _brands.isNotEmpty;

  int get totalBrands =>
      _brands.length;

  void clearSelection() {
    _selectedBrand = null;

    notifyListeners();
  }

  Future<void> refresh() async {
    await loadBrands();
  }
}