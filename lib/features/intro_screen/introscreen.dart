
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/resources/color_manager/color_manger.dart';
import 'package:evently_app/core/resources/imagemanger/image_manger.dart';
import 'package:evently_app/core/resources/provider/theme_provider.dart';
import 'package:evently_app/core/route_manger/routemanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introduction extends StatelessWidget {


  const Introduction({super.key});

  static PageViewModel buildPage({
    required String image,
    required String title,
    required String body,
    required bool isDarkMode,
  }) {
    return PageViewModel(
      titleWidget: const SizedBox(),
      bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  ImageManager.splash_logo,
                  width: 0.5.sw,
                ),
                SizedBox(height: 16.h),
                Image.asset(
                  image,
                  width: 0.9.sw,
                  fit: BoxFit.contain,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : AppColorLight.mainText,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : AppColorLight.secondaryText,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        
      decoration: const PageDecoration(pageColor: Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    bool isDarkMode = themeProvider.apptheme == ThemeMode.dark;

    final pages = [
      buildPage(
        image: ImageManager.intro2,
        title: 'Find Events That Inspire You'.tr(),
        body:
            'Dive into a world of events crafted to fit your unique interests. Whether you are into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'.tr(),
        isDarkMode: isDarkMode,
      ),
      buildPage(
        image: ImageManager.intro3,
        title: 'Effortless Event Planning'.tr(),
        body:
            'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'.tr(),
        isDarkMode: isDarkMode,
      ),
      buildPage(
        image: ImageManager.intro4,
        title: 'Connect with Friends & Share Moments'.tr(),
        body:
            'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'.tr(),
        isDarkMode: isDarkMode,
      ),
     
    ];

    return Scaffold(
      backgroundColor: isDarkMode ? AppColorDark.mainText : AppColorLight.stroke,
      body: IntroductionScreen(
        pages: pages,
        showNextButton: true,
        showBackButton: true,
        showSkipButton: true,
        skip: Text(
           "skip".tr(),
          style: TextStyle(
            color: isDarkMode ? Colors.white :AppColorLight.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        next: Text(
          "next".tr(),
          style: TextStyle(color: isDarkMode ? Colors.white : AppColorLight.mainColor),
        ),
        back: Text(
          "back".tr(),
          style: TextStyle(color: isDarkMode ? Colors.white : AppColorLight.mainColor),
        ),
        done: Text(
          "done".tr(),
          style: TextStyle(color: isDarkMode ? Colors.white : AppColorLight.mainColor),
        ),
        globalBackgroundColor: isDarkMode ? AppColorDark.background : AppColorLight.stroke,
        dotsDecorator: DotsDecorator(
          size: Size(8.w, 8.h),
          activeSize: Size(22.w, 8.h),
          color: Colors.grey,
          activeColor: isDarkMode ? Colors.white :AppColorLight.mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
        ),
        onDone: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('intro_seen', true);
          if (!context.mounted) return;
          Navigator.pushReplacementNamed(context,Routemanger.loginRoute);
        },
      ),
    );
  }
}
