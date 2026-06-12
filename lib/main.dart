// ignore_for_file: empty_constructor_bodies

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/config/theme/mangertheme.dart';
import 'package:evently_app/core/resources/provider/localization_provider.dart';
import 'package:evently_app/core/resources/provider/theme_provider.dart';
import 'package:evently_app/core/route_manger/routemanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/language',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocalizationProvider()),
          ChangeNotifierProvider(create: (_) => AppThemProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LocalizationProvider>(context);


    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: languageProvider.currentLocale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme: Mangertheme.light,
          darkTheme: Mangertheme.dark,
          themeMode:ThemeMode.light,
          routes: Routemanger.routes,
          initialRoute: Routemanger.splashRoute,
        );
      },
    );
  }
}