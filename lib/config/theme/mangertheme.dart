
  import 'package:evently_app/core/resources/color_manager/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Mangertheme {
static ThemeData light=ThemeData(
scaffoldBackgroundColor: AppColorLight.background,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorLight.mainColor,
      foregroundColor: AppColorLight.white,
      textStyle: TextStyle(
        fontWeight: FontWeight(500),
        fontSize: 20.sp,
        color: AppColorLight.white

      )
    )
  )
);
static ThemeData dark=ThemeData(
    scaffoldBackgroundColor:AppColorDark.background
);
}