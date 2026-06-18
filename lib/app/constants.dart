class AppConstants {
  const AppConstants._();

  // =====================================================
  // Application
  // =====================================================

  static const String appName = 'Inventory Controller Pro';

  static const String appShortName = 'Inventory Controller';

  static const String packageName =
      'com.inventorycontroller.pro';

  static const String developer =
      'Affan Ali Molla';

  static const String publisher =
      'Affan Ali Molla';

  static const String version =
      '1.0.0';

  // =====================================================
  // Assets
  // =====================================================

  static const String appIcon =
      'assets/icons/app_icon.png';

  static const String launcherForeground =
      'assets/icons/launcher_foreground.png';

  static const String launcherBackground =
      'assets/icons/launcher_background.png';

  static const String notificationIcon =
      'assets/icons/notification.png';

  static const String defaultLogo =
      'assets/logos/default_logo.png';

  static const String emptyInventoryImage =
      'assets/images/empty_inventory.png';

  static const String emptyBrandImage =
      'assets/images/empty_brand.png';

  static const String dashboardImage =
      'assets/images/dashboard.png';

  static const String reportImage =
      'assets/images/report.png';

  // =====================================================
  // Onboarding
  // =====================================================

  static const String onboarding1 =
      'assets/illustrations/onboarding1.png';

  static const String onboarding2 =
      'assets/illustrations/onboarding2.png';

  static const String onboarding3 =
      'assets/illustrations/onboarding3.png';

  // =====================================================
  // Placeholders
  // =====================================================

  static const String noData =
      'assets/placeholders/no_data.png';

  static const String noImage =
      'assets/placeholders/no_image.png';

  static const String noLogo =
      'assets/placeholders/no_logo.png';

  // =====================================================
  // Sounds
  // =====================================================

  static const String clickSound =
      'assets/sounds/click.mp3';

  static const String successSound =
      'assets/sounds/success.mp3';

  static const String errorSound =
      'assets/sounds/error.mp3';

  static const String deleteSound =
      'assets/sounds/delete.mp3';

  static const String notificationSound =
      'assets/sounds/notification.mp3';

  // =====================================================
  // Animations
  // =====================================================

  static const String loadingAnimation =
      'assets/animations/loading.json';

  static const String successAnimation =
      'assets/animations/success.json';

  static const String emptyAnimation =
      'assets/animations/empty.json';

  // =====================================================
  // Excel Templates
  // =====================================================

  static const String blankTemplate =
      'assets/templates/blank_template.xlsx';

  static const String inventoryTemplate =
      'assets/templates/inventory_template.xlsx';

  // =====================================================
  // Inventory
  // =====================================================

  static const int lowStockLimit = 5;

  static const int maxQuantity = 999999999;

  static const int minQuantity = 0;

  static const int skuLength = 8;

  static const String skuPrefix = 'SKU';

  // =====================================================
  // Reports
  // =====================================================

  static const String excelExtension = '.xlsx';

  static const String pngExtension = '.png';

  static const String pdfExtension = '.pdf';

  static const String dateFormat =
      'dd-MM-yyyy';

  static const String dateTimeFormat =
      'dd-MM-yyyy HH:mm:ss';

  // =====================================================
  // Notification
  // =====================================================

  static const String notificationChannelId =
      'inventory_controller_channel';

  static const String notificationChannelName =
      'Inventory Notifications';

  // =====================================================
  // Export Folder Names
  // =====================================================

  static const String exportExcelFolder =
      'Exports/Excel';

  static const String exportPngFolder =
      'Exports/PNG';

  static const String reportsFolder =
      'Reports';

  static const String sharedFolder =
      'Shared';

  static const String templatesFolder =
      'Templates';

  static const String backupFolder =
      'Backup';

  // =====================================================
  // Animation Duration
  // =====================================================

  static const Duration splashDuration =
      Duration(seconds: 3);

  static const Duration animationDuration =
      Duration(milliseconds: 300);

  static const Duration pageTransition =
      Duration(milliseconds: 250);

  // =====================================================
  // Pagination
  // =====================================================

  static const int pageSize = 20;

  // =====================================================
  // Validation
  // =====================================================

  static const int maxBusinessName = 100;

  static const int maxFabric = 100;

  static const int maxColor = 50;

  static const int maxNotes = 500;

  // =====================================================
  // Future Features
  // =====================================================

  static const bool barcodeEnabled = false;

  static const bool qrEnabled = false;

  static const bool aiEnabled = false;

  static const bool cloudEnabled = false;
}