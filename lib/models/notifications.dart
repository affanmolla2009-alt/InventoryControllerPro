import 'package:flutter/foundation.dart';

@immutable
class InventoryNotification {
  const InventoryNotification({
    this.id,
    required this.title,
    required this.message,
    required this.type,
    this.sku,
    this.brandId,
    required this.quantity,
    required this.priority,
    required this.isRead,
    required this.createdAt,
  });

  final int? id;

  final String title;

  final String message;

  /// low_stock
  /// out_of_stock
  /// export
  /// import
  /// backup
  /// system
  /// reminder
  final String type;

  final String? sku;

  final int? brandId;

  final int quantity;

  /// low
  /// medium
  /// high
  final String priority;

  final bool isRead;

  final DateTime createdAt;

  bool get isLowStock =>
      type == 'low_stock';

  bool get isOutOfStock =>
      type == 'out_of_stock';

  bool get isHighPriority =>
      priority == 'high';

  InventoryNotification copyWith({
    int? id,
    String? title,
    String? message,
    String? type,
    String? sku,
    int? brandId,
    int? quantity,
    String? priority,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return InventoryNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      sku: sku ?? this.sku,
      brandId: brandId ?? this.brandId,
      quantity: quantity ?? this.quantity,
      priority: priority ?? this.priority,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'sku': sku,
      'brand_id': brandId,
      'quantity': quantity,
      'priority': priority,
      'is_read': isRead ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory InventoryNotification.fromMap(
    Map<String, dynamic> map,
  ) {
    return InventoryNotification(
      id: map['id'] as int?,
      title: map['title'] as String? ?? '',
      message: map['message'] as String? ?? '',
      type: map['type'] as String? ?? '',
      sku: map['sku'] as String?,
      brandId: map['brand_id'] as int?,
      quantity: map['quantity'] as int? ?? 0,
      priority:
          map['priority'] as String? ?? 'low',
      isRead: (map['is_read'] ?? 0) == 1,
      createdAt: DateTime.parse(
        map['created_at'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory InventoryNotification.fromJson(
    Map<String, dynamic> json,
  ) {
    return InventoryNotification.fromMap(
      json,
    );
  }

  @override
  String toString() {
    return 'InventoryNotification(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is InventoryNotification &&
        other.id == id &&
        other.title == title &&
        other.message == message &&
        other.type == type &&
        other.sku == sku &&
        other.brandId == brandId &&
        other.quantity == quantity &&
        other.priority == priority &&
        other.isRead == isRead &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      message,
      type,
      sku,
      brandId,
      quantity,
      priority,
      isRead,
      createdAt,
    );
  }
}