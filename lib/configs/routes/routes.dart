import 'package:flutter/material.dart';
import 'package:quickeee/features/flash_drop/presentation/pages/luxury_flash_drop.dart';
import 'package:quickeee/features/splash/splash_screen.dart';

abstract class Routes {
  static const splashScreen = '/';
  /*
    >>> Luxury Flash Drop
  */
  static const luxuryFlashDrop = '/luxuryFlashDrop';
  /*
    <<< Luxury Flash Drop
  */

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => routes[settings.name]!,
      settings: settings,
    );
  }

  static Map<String, Widget> routes = {
    splashScreen: const SplashScreen(),
    luxuryFlashDrop: const LuxuryFlashDropWrapper(),
  };
}
