import 'package:flutter/material.dart';
import 'package:quickeee/features/flash_drop/presentation/pages/flash_drop_screen.dart';
import 'package:quickeee/features/splash/splash_screen.dart';

abstract class Routes {
  static const splashScreen = '/';
  /*
    >>> Flash Drop
  */
  static const flashDrop = '/FlashDrop';
  /*
    <<< Flash Drop
  */

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => routes[settings.name]!,
      settings: settings,
    );
  }

  static Map<String, Widget> routes = {
    splashScreen: const SplashScreen(),
    flashDrop: const FlashDropScreenWrapper(),
  };
}
