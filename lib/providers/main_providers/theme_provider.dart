import 'package:flutter/material.dart';
import 'package:water/shared/style/my_theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData mode = MyThemeData.lightMode;

  void changeThemeMode(ThemeData newTheme) {
    mode = newTheme;
    notifyListeners();
  }
}
