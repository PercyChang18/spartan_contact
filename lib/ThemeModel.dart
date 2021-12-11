import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spartan_contact/theme_shared_preferences.dart';

class ThemeModel extends ChangeNotifier{
  late bool _isDark;
  late ThemeSharedPreferences themeSharedPreferences;
  bool get isDark => _isDark;

  ThemeModel(){
    _isDark = false;
    themeSharedPreferences = ThemeSharedPreferences();
    getThemePreferences();
  }
  set isDark(bool value){
    _isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePreferences() async{
    _isDark = await themeSharedPreferences.getTheme();
    notifyListeners();
  }
}