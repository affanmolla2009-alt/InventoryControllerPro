import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    )!;
  }

  static const supportedLocales = [
    Locale('en'),
    Locale('hi'),
  ];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'Inventory Controller Pro',
      'dashboard': 'Dashboard',
      'inventory': 'Inventory',
      'brands': 'Brands',
      'reports': 'Reports',
      'settings': 'Settings',
      'search': 'Search',
      'add': 'Add',
      'edit': 'Edit',
      'delete': 'Delete',
      'save': 'Save',
      'cancel': 'Cancel',
      'export_excel': 'Export Excel',
      'export_png': 'Export PNG',
      'import_excel': 'Import Excel',
      'backup': 'Backup',
      'restore': 'Restore',
      'low_stock': 'Low Stock',
      'quantity': 'Quantity',
      'sku': 'SKU',
      'barcode': 'Barcode',
      'brand': 'Brand',
      'success': 'Success',
      'error': 'Error',
      'loading': 'Loading...',
      'no_data': 'No Data Found',
    },
    'hi': {
      'app_name': 'इन्वेंटरी कंट्रोलर प्रो',
      'dashboard': 'डैशबोर्ड',
      'inventory': 'इन्वेंटरी',
      'brands': 'ब्रांड',
      'reports': 'रिपोर्ट',
      'settings': 'सेटिंग्स',
      'search': 'खोजें',
      'add': 'जोड़ें',
      'edit': 'संपादित करें',
      'delete': 'हटाएँ',
      'save': 'सहेजें',
      'cancel': 'रद्द करें',
      'export_excel': 'एक्सेल निर्यात',
      'export_png': 'पीएनजी निर्यात',
      'import_excel': 'एक्सेल आयात',
      'backup': 'बैकअप',
      'restore': 'पुनर्स्थापित करें',
      'low_stock': 'कम स्टॉक',
      'quantity': 'मात्रा',
      'sku': 'एसकेयू',
      'barcode': 'बारकोड',
      'brand': 'ब्रांड',
      'success': 'सफल',
      'error': 'त्रुटि',
      'loading': 'लोड हो रहा है...',
      'no_data': 'कोई डेटा नहीं मिला',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['en']![key] ??
        key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales
        .any(
          (supportedLocale) =>
              supportedLocale.languageCode ==
              locale.languageCode,
        );
  }

  @override
  Future<AppLocalizations> load(
    Locale locale,
  ) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(
    LocalizationsDelegate<AppLocalizations> old,
  ) {
    return false;
  }
}