import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightMode = ThemeData(
    /// NAME         SIZE  WEIGHT  SPACING
    /// headline1    96.0  light   -1.5
    /// headline2    60.0  light   -0.5
    /// headline3    48.0  regular  0.0
    /// headline4    34.0  regular  0.25
    /// headline5    24.0  regular  0.0
    /// headline6    20.0  medium   0.15
    /// subtitle1    16.0  regular  0.15
    /// subtitle2    14.0  medium   0.1
    /// body1        16.0  regular  0.5   (bodyText1)
    /// body2        14.0  regular  0.25  (bodyText2)
    /// button       14.0  medium   1.25
    /// caption      12.0  regular  0.4
    /// overline     10.0  regular  1.5
    /// ```

    fontFamily: 'Changa',
    textTheme: TextTheme(headline3: TextStyle(height: 1)),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 20,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),

    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      ///using this color as the main color sor the app
      primary: lightPrimaryColor,

      /// the same above color with opacity
      onPrimary: lightOnPrimaryColorWithOpacity,

      secondary: const Color(0xff03dac6),
      onSecondary: Colors.black,
      error: const Color(0xffb00020),
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      //used for some white
      onSurface: Colors.black,
    ),
  );

  ///dark mode///
  static ThemeData darkMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 20,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,

      ///using this color as the main color sor the app
      primary: lightPrimaryColor,

      /// the same above color with opacity
      onPrimary: lightOnPrimaryColorWithOpacity,

      secondary: const Color(0xff03dac6),
      onSecondary: Colors.black,
      error: const Color(0xffcf6679),
      onError: Colors.black,
      background: const Color(0xff121212),
      onBackground: Colors.white,
      surface: const Color(0xff121212),
      onSurface: Colors.white,
    ),
  );
}
