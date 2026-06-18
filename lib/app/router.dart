import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';

class AppRouter {
  const AppRouter._();

  static const String splashRoute = '/';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute<void>(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(
                'Page Not Found',
              ),
            ),
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}