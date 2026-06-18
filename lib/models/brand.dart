import 'package:flutter/foundation.dart';

@immutable
class Brand {
  const Brand({
    this.id,
    required this.businessName,
    required this.ownerName,
    required this.logoPath,
    required this.address,
    required this.phone,
    required this.email,
    required this.gstNumber,
    required this.footer,
    required this.themeColor,
    required this.isDefault,
  });

  final int? id;

  final String businessName;

  final String ownerName;

  final String logoPath;

  final String address;

  final String phone;

  final String email;

  final String gstNumber;

  final String footer;

  final String themeColor;

  final bool isDefault;

  Brand copyWith({
    int? id,
    String? businessName,
    String? ownerName,
    String? logoPath,
    String? address,
    String? phone,
    String? email,
    String? gstNumber,
    String? footer,
    String? themeColor,
    bool? isDefault,
  }) {
    return Brand(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      ownerName: ownerName ?? this.ownerName,
      logoPath: logoPath ?? this.logoPath,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gstNumber: gstNumber ?? this.gstNumber,
      footer: footer ?? this.footer,
      themeColor: themeColor ?? this.themeColor,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'business_name': businessName,
      'owner_name': ownerName,
      'logo_path': logoPath,
      'address': address,
      'phone': phone,
      'email': email,
      'gst_number': gstNumber,
      'footer': footer,
      'theme_color': themeColor,
      'is_default': isDefault ? 1 : 0,
    };
  }

  factory Brand.fromMap(
    Map<String, dynamic> map,
  ) {
    return Brand(
      id: map['id'] as int?,
      businessName: map['business_name'] as String? ?? '',
      ownerName: map['owner_name'] as String? ?? '',
      logoPath: map['logo_path'] as String? ?? '',
      address: map['address'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      email: map['email'] as String? ?? '',
      gstNumber: map['gst_number'] as String? ?? '',
      footer: map['footer'] as String? ?? '',
      themeColor: map['theme_color'] as String? ?? '#1565C0',
      isDefault: (map['is_default'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  factory Brand.fromJson(
    Map<String, dynamic> json,
  ) {
    return Brand.fromMap(json);
  }

  @override
  String toString() {
    return 'Brand(id: $id, businessName: $businessName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Brand &&
        other.id == id &&
        other.businessName == businessName &&
        other.ownerName == ownerName &&
        other.logoPath == logoPath &&
        other.address == address &&
        other.phone == phone &&
        other.email == email &&
        other.gstNumber == gstNumber &&
        other.footer == footer &&
        other.themeColor == themeColor &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      businessName,
      ownerName,
      logoPath,
      address,
      phone,
      email,
      gstNumber,
      footer,
      themeColor,
      isDefault,
    );
  }
}