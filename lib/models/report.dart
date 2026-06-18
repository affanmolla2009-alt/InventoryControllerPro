import 'package:flutter/foundation.dart';

@immutable
class Report {
  const Report({
    this.id,
    required this.title,
    required this.reportType,
    required this.brandId,
    required this.brandName,
    required this.startDate,
    required this.endDate,
    required this.totalItems,
    required this.totalQuantity,
    required this.lowStockItems,
    required this.outOfStockItems,
    required this.excelPath,
    required this.pngPath,
    required this.generatedAt,
    required this.isShared,
  });

  final int? id;

  final String title;

  /// daily
  /// weekly
  /// monthly
  /// yearly
  /// custom
  final String reportType;

  final int? brandId;

  final String brandName;

  final DateTime startDate;

  final DateTime endDate;

  final int totalItems;

  final int totalQuantity;

  final int lowStockItems;

  final int outOfStockItems;

  final String excelPath;

  final String pngPath;

  final DateTime generatedAt;

  final bool isShared;

  Report copyWith({
    int? id,
    String? title,
    String? reportType,
    int? brandId,
    String? brandName,
    DateTime? startDate,
    DateTime? endDate,
    int? totalItems,
    int? totalQuantity,
    int? lowStockItems,
    int? outOfStockItems,
    String? excelPath,
    String? pngPath,
    DateTime? generatedAt,
    bool? isShared,
  }) {
    return Report(
      id: id ?? this.id,
      title: title ?? this.title,
      reportType: reportType ?? this.reportType,
      brandId: brandId ?? this.brandId,
      brandName: brandName ?? this.brandName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalItems: totalItems ?? this.totalItems,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      lowStockItems: lowStockItems ?? this.lowStockItems,
      outOfStockItems: outOfStockItems ?? this.outOfStockItems,
      excelPath: excelPath ?? this.excelPath,
      pngPath: pngPath ?? this.pngPath,
      generatedAt: generatedAt ?? this.generatedAt,
      isShared: isShared ?? this.isShared,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'report_type': reportType,
      'brand_id': brandId,
      'brand_name': brandName,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'total_items': totalItems,
      'total_quantity': totalQuantity,
      'low_stock_items': lowStockItems,
      'out_of_stock_items': outOfStockItems,
      'excel_path': excelPath,
      'png_path': pngPath,
      'generated_at': generatedAt.toIso8601String(),
      'is_shared': isShared ? 1 : 0,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      id: map['id'] as int?,
      title: map['title'] as String? ?? '',
      reportType: map['report_type'] as String? ?? '',
      brandId: map['brand_id'] as int?,
      brandName: map['brand_name'] as String? ?? '',
      startDate: DateTime.parse(map['start_date'] as String),
      endDate: DateTime.parse(map['end_date'] as String),
      totalItems: map['total_items'] as int? ?? 0,
      totalQuantity: map['total_quantity'] as int? ?? 0,
      lowStockItems: map['low_stock_items'] as int? ?? 0,
      outOfStockItems: map['out_of_stock_items'] as int? ?? 0,
      excelPath: map['excel_path'] as String? ?? '',
      pngPath: map['png_path'] as String? ?? '',
      generatedAt: DateTime.parse(map['generated_at'] as String),
      isShared: (map['is_shared'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report.fromMap(json);
  }

  bool get hasExcel => excelPath.isNotEmpty;

  bool get hasPng => pngPath.isNotEmpty;

  @override
  String toString() {
    return 'Report(id: $id, title: $title, reportType: $reportType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Report &&
        other.id == id &&
        other.title == title &&
        other.reportType == reportType &&
        other.brandId == brandId &&
        other.brandName == brandName &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.totalItems == totalItems &&
        other.totalQuantity == totalQuantity &&
        other.lowStockItems == lowStockItems &&
        other.outOfStockItems == outOfStockItems &&
        other.excelPath == excelPath &&
        other.pngPath == pngPath &&
        other.generatedAt == generatedAt &&
        other.isShared == isShared;
  }

  @override
  int get hashCode => Object.hash(
        id,
        title,
        reportType,
        brandId,
        brandName,
        startDate,
        endDate,
        totalItems,
        totalQuantity,
        lowStockItems,
        outOfStockItems,
        excelPath,
        pngPath,
        generatedAt,
        isShared,
      );
}