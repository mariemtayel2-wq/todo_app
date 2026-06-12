import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/resources/imagemanger/image_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/color_manager/color_manger.dart';
import '../../core/route_manger/routemanger.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageManager.splash_logo,
              width: 0.5.sw,
            ),
            SizedBox(height: 16.h),
            Image.asset(
            ImageManager.intro1,
              width: 0.9.sw,
              fit: BoxFit.contain,
            ),
            Text(
            "Personalize Your Experience",
              style: TextStyle(
                color:  AppColorLight.mainText,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
        
            Text(
              "Choose your preferred theme and language to get started with a comfortable"
                  ", tailored experience that suits your style.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:  AppColorLight.secondaryText,
                  fontSize: 20.sp,
                ),
              ),
            
            Row(
              children: [
                Text("language".tr(),
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColorLight.mainColor,
        
                ),)
              ],
            )
            ,
            Row(
              children: [
                Text("theme".tr(),
                  style:TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColorLight.mainColor,
        
                  ),)
        
              ],
            )
            ,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(0.9.sw, 48.h),
                backgroundColor: AppColorLight.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              ),
                onPressed: ()async {
                  final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('intro_seen', true);
              if (!context.mounted) return;
                  Navigator.pushReplacementNamed(context, Routemanger.introductionRoute);
            },
                child:
                Text("Let’s start".tr()),
            )
          ],
        ),
      ),
    );
  }
}
