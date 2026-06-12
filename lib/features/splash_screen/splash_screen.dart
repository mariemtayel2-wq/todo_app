
// ignore_for_file: use_build_context_synchronously

import 'package:evently_app/core/resources/color_manager/color_manger.dart';
import 'package:evently_app/core/resources/imagemanger/image_manger.dart';
import 'package:evently_app/core/resources/provider/theme_provider.dart';
import 'package:evently_app/core/route_manger/routemanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateNext();
  }

  void navigateNext() async {
    await Future.delayed(const Duration(seconds: 10));
    if (!mounted) return;

    await SharedPreferences.getInstance();
    final prefs = await SharedPreferences.getInstance();
    bool introSeen = prefs.getBool('intro_seen') ?? false;

    Navigator.pushReplacementNamed(
      context,
        introSeen ? Routemanger.loginRoute : Routemanger.settingRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.apptheme == ThemeMode.dark
          ? AppColorDark.background
          : AppColorLight.background,
      body:
     Center(
       child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageManager.splash_logo,
                    width: 0.6.sw,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 250.h),
                 
                  Image.asset(
                    ImageManager.splash_branding,
                    width: 0.45.sw,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
     ),
     
        
      
    );
  }
}
