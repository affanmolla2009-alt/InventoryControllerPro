import 'package:flutter/foundation.dart';

import '../models/inventory.dart';
import '../repositories/inventory_repository.dart';
import '../services/notification_service.dart';

class InventoryProvider extends ChangeNotifier {
  InventoryProvider({
    required InventoryRepository repository,
  }) : _repository = repository;

  final InventoryRepository _repository;

  List<Inventory> _inventoryList = [];

  bool _isLoading = false;

  String _searchQuery = "";

  int _lowStockThreshold = 5;

  List<Inventory> get inventoryList =>
      _inventoryList;

  bool get isLoading => _isLoading;

  String get searchQuery =>
      _searchQuery;

  int get lowStockThreshold =>
      _lowStockThreshold;

  List<Inventory> get filteredInventory {
    if (_searchQuery.isEmpty) {
      return _inventoryList;
    }

    final query =
        _searchQuery.toLowerCase();

    return _inventoryList.where(
      (item) {
        return item.sku
                .toLowerCase()
                .contains(query) ||
            item.fabric
                .toLowerCase()
                .contains(query) ||
            item.color
                .toLowerCase()
                .contains(query);
      },
    ).toList();
  }

  Future<void> loadInventory() async {
    _isLoading = true;

    notifyListeners();

    _inventoryList =
        await _repository.getAllInventory();

    _isLoading = false;

    notifyListeners();
  }

  Future<void> addInventory(
    Inventory inventory,
  ) async {
    await _repository.insertInventory(
      inventory,
    );

    await loadInventory();

    await _checkLowStock(
      inventory,
    );
  }

  Future<void> updateInventory(
    Inventory inventory,
  ) async {
    await _repository.updateInventory(
      inventory,
    );

    await loadInventory();

    await _checkLowStock(
      inventory,
    );
  }

  Future<void> deleteInventory(
    int id,
  ) async {
    await _repository.deleteInventory(
      id,
    );

    await loadInventory();
  }

  Future<void> increaseQuantity(
    Inventory inventory,
  ) async {
    final updated =
        inventory.copyWith(
      quantity:
          inventory.quantity + 1,
    );

    await updateInventory(
      updated,
    );
  }

  Future<void> decreaseQuantity(
    Inventory inventory,
  ) async {
    if (inventory.quantity <= 0) {
      return;
    }

    final updated =
        inventory.copyWith(
      quantity:
          inventory.quantity - 1,
    );

    await updateInventory(
      updated,
    );
  }

  void setSearchQuery(
    String value,
  ) {
    _searchQuery = value;

    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = "";

    notifyListeners();
  }

  void setLowStockThreshold(
    int value,
  ) {
    _lowStockThreshold = value;

    notifyListeners();
  }

  int get totalProducts =>
      _inventoryList.length;

  int get totalQuantity {
    int total = 0;

    for (final item
        in _inventoryList) {
      total += item.quantity;
    }

    return total;
  }

  List<Inventory> get lowStockItems {
    return _inventoryList.where(
      (item) {
        return item.quantity <=
            _lowStockThreshold;
      },
    ).toList();
  }

  Future<void> _checkLowStock(
    Inventory inventory,
  ) async {
    if (inventory.quantity <=
        _lowStockThreshold) {
      await NotificationService
          .instance
          .showLowStockNotification(
        inventory: inventory,
        threshold:
            _lowStockThreshold,
      );
    }
  }
}