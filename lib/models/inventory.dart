import 'package:flutter/foundation.dart';

@immutable
class Inventory {
  const Inventory({
    this.id,
    required this.sku,
    required this.fabric,
    required this.color,
    required this.quantity,
    this.notes = '',
    this.brandId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;

  final String sku;

  final String fabric;

  final String color;

  final int quantity;

  final String notes;

  final int? brandId;

  final DateTime createdAt;

  final DateTime updatedAt;

  bool get isLowStock => quantity < 5;

  bool get isOutOfStock => quantity <= 0;

  Inventory copyWith({
    int? id,
    String? sku,
    String? fabric,
    String? color,
    int? quantity,
    String? notes,
    int? brandId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Inventory(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      fabric: fabric ?? this.fabric,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      notes: notes ?? this.notes,
      brandId: brandId ?? this.brandId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sku': sku,
      'fabric': fabric,
      'color': color,
      'quantity': quantity,
      'notes': notes,
      'brand_id': brandId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory Inventory.fromMap(
    Map<String, dynamic> map,
  ) {
    return Inventory(
      id: map['id'] as int?,
      sku: map['sku'] as String,
      fabric: map['fabric'] as String,
      color: map['color'] as String,
      quantity: map['quantity'] as int,
      notes: map['notes'] as String? ?? '',
      brandId: map['brand_id'] as int?,
      createdAt: DateTime.parse(
        map['created_at'] as String,
      ),
      updatedAt: DateTime.parse(
        map['updated_at'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory Inventory.fromJson(
    Map<String, dynamic> json,
  ) {
    return Inventory.fromMap(json);
  }

  @override
  String toString() {
    return 'Inventory(id: $id, sku: $sku, fabric: $fabric, color: $color, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Inventory &&
        other.id == id &&
        other.sku == sku &&
        other.fabric == fabric &&
        other.color == color &&
        other.quantity == quantity &&
        other.notes == notes &&
        other.brandId == brandId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      sku,
      fabric,
      color,
      quantity,
      notes,
      brandId,
      createdAt,
      updatedAt,
    );
  }
}