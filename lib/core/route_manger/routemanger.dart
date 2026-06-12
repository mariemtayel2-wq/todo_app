
import 'package:evently_app/features/intro_screen/introscreen.dart';
import 'package:evently_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/login/login.dart';
import '../../features/register screen/register.dart';
import '../../features/settings/setting.dart';

class Routemanger {
 static const String splashRoute = 'splash';
  static const String introductionRoute = 'introduction';
static const String settingRoute = 'setting';
static const String loginRoute = 'login';
static const String registerRoute = 'register';


  static Map<String, WidgetBuilder> get routes => {
    splashRoute: (context) => const SplashScreen(),
    introductionRoute: (context) => const Introduction(),
    settingRoute: (context) => const Setting(),
    loginRoute: (context) =>  const Login(),
    registerRoute: (context) => const Register(),

  };
}
