import 'package:cleanly/models/app_theme.dart';
import 'package:flutter/material.dart';

import 'styling.dart';

final darkTheme = AppTheme(
    'darkTheme',
    'Dark',
    ThemeData(
      primaryColor: AppStyles.black,
      brightness: Brightness.dark,
      backgroundColor: AppStyles.lightGray,
      dividerColor: AppStyles.lightGray,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppStyles.black,
        backgroundColor: AppStyles.lightPurple,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppStyles.lightPurple,
        secondary: AppStyles.lightGray,
      ).copyWith(secondary: AppStyles.lightPurple),
    ));

final lightTheme = AppTheme(
    'lightTheme',
    'Light',
    ThemeData(
      primaryColor: AppStyles.white,
      brightness: Brightness.light,
      backgroundColor: AppStyles.white60,
      dividerColor: AppStyles.lightGray,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppStyles.white,
        backgroundColor: AppStyles.lightPurple,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppStyles.lightPurple,
        secondary: AppStyles.lightGray,
      ),
    ));
