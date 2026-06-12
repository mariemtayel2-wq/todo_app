
  import 'package:evently_app/core/resources/color_manager/color_manger.dart';
import 'package:flutter/material.dart';

abstract class Mangertheme {
static ThemeData light=ThemeData(
scaffoldBackgroundColor: AppColorLight.background
);
static ThemeData dark=ThemeData(
    scaffoldBackgroundColor:AppColorDark.background
);
}