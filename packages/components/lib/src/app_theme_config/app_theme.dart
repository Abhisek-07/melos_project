import 'package:component_example/app_theme_config/app_colors.dart';
import 'package:component_example/app_theme_config/textstyles.dart';
import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'app_theme.freezed.dart';

// part 'app_theme.g.dart';

// @freezed
// class AppTheme with _$AppTheme {
//   factory AppTheme({
//     required Color primaryColor,
//     required Color secondaryColor,
//     required Color backgroundColor,
//     required List<Color>  primeGradient1,
//     required List<Color> primeGradient2,
//     required List<Color> primeGradient3,
//     required List<Color> secondGradient,
//     required List<Color> thirdGradient,
//     required List<Color> fourthGradient,
//     required TextStyle title,
//     required TextStyle body,
//     required double borderRadiusSmall,
//     required double borderRadiusMedium,
//     required double borderRadiusLarge,

//   }) = _AppTheme;

//   factory AppTheme.fromJson(Map<String, dynamic> json) =>
//       _$AppThemeFromJson(json);
// }

class AppTheme {
  AppTheme({
    required this.textStyles,
    required this.appColors,
    required this.themedata,
  });

  TextStyles textStyles;
  AppColors appColors;
  ThemeData themedata;
}
