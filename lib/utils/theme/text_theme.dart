import 'package:flutter/material.dart';
import 'package:mr_garage/utils/global.colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme systemTextTheme = TextTheme(
    labelLarge: const TextStyle().copyWith(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: GlobalColors.textColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: GlobalColors.thirdColor,
    ),
  );
}
