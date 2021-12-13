import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spartan_contact/theme_shared_preferences.dart';

/// Not implemented in final product.
/// @author Vikranthreddy Jakamukala
/// @version 12/12/2021
class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPreferences themeSharedPreferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    themeSharedPreferences = ThemeSharedPreferences();
    getThemePreferences();
  }
  set isDark(bool value) {
    _isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePreferences() async {
    _isDark = await themeSharedPreferences.getTheme();
    notifyListeners();
  }
}
