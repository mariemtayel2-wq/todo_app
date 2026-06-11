
import 'package:flutter/material.dart';

class Routemanger {
 static const String splashRoute = 'splash';
  static const String introductionRoute = 'introduction';
  static const String profileRoute = 'profile';
  static const String homeRoute = 'home';

  static Map<String, WidgetBuilder> get routes => {
    // splashRoute: (context) => const SplashScreen(),
    // introductionRoute: (context) => const Introduction(),
    // homeRoute: (context) => const HomeScreen(),
  };
}
