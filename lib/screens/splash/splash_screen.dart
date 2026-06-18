import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../providers/settings_provider.dart';
import '../../providers/brand_provider.dart';
import '../../providers/inventory_provider.dart';
import '../dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _initializeApp();
  }

  Future<void> _initializeApp() async {

    await context
        .read<ThemeProvider>()
        .loadTheme();

    await context
        .read<SettingsProvider>()
        .loadSettings();

    await context
        .read<BrandProvider>()
        .loadBrands();

    await context
        .read<InventoryProvider>()
        .loadInventory();

    Timer(
      const Duration(
        seconds: 3,
      ),
      () {

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const DashboardScreen(),
          ),
        );

      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {

    return Scaffold(

      body: Container(

        width: double.infinity,

        height: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [

              Color(0xff1565C0),

              Color(0xff0D47A1),

            ],

          ),

        ),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Image.asset(

              "assets/icons/app_icon.png",

              width: 120,

              height: 120,

            ),

            const SizedBox(
              height: 25,
            ),

            const Text(

              "Inventory Controller Pro",

              style: TextStyle(

                fontSize: 26,

                fontWeight:
                    FontWeight.bold,

                color: Colors.white,

              ),

            ),

            const SizedBox(
              height: 10,
            ),

            const Text(

              "Professional Inventory Management",

              style: TextStyle(

                color: Colors.white70,

                fontSize: 15,

              ),

            ),

            const SizedBox(
              height: 50,
            ),

            const CircularProgressIndicator(

              color: Colors.white,

            ),

            const SizedBox(
              height: 20,
            ),

            const Text(

              "Loading...",

              style: TextStyle(

                color: Colors.white,

                fontSize: 14,

              ),

            ),

          ],

        ),

      ),

    );
  }
}