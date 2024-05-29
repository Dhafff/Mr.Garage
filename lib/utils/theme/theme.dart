import 'package:flutter/material.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/utils/theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData systemTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Open Sans',
    brightness: Brightness.light,
    primaryColor: GlobalColors.mainColor,
    textTheme: AppTextTheme.systemTextTheme,
  );
}
