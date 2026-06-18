import 'package:flutter/material.dart';

import 'router.dart';
import 'themes.dart';

class InventoryControllerApp extends StatelessWidget {
  const InventoryControllerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Controller Pro',

      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      theme: AppThemes.lightTheme,

      darkTheme: AppThemes.darkTheme,

      onGenerateRoute: AppRouter.generateRoute,

      initialRoute: AppRouter.splashRoute,
    );
  }
}