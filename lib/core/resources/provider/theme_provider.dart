import 'package:flutter/material.dart';

class AppThemProvider extends ChangeNotifier {
  ThemeMode  apptheme=ThemeMode.light;
    bool  get isdark => apptheme==ThemeMode.dark;
  void changeThemMode(ThemeMode newthem)
  {
    if(apptheme==newthem)
    {
      return;
    }
    apptheme=newthem;
    notifyListeners();
  }
}