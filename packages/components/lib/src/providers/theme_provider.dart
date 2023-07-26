import 'package:components/src/app_theme_config/app_colors.dart';
import 'package:components/src/app_theme_config/app_theme.dart';
// import 'package:components/src/app_theme_config/textStyle_classes/body.dart';
// import 'package:components/src/app_theme_config/textStyle_classes/body_bold.dart';
// import 'package:components/src/app_theme_config/textStyle_classes/body_medium.dart';
// import 'package:components/src/app_theme_config/textStyle_classes/button.dart';
// import 'package:components/src/app_theme_config/textStyle_classes/headings.dart';
// import 'package:components/src/app_theme_config/textStyle_classes/body_link.dart';
import 'package:components/src/app_theme_config/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends ChangeNotifier {
  late AppTheme appTheme;

  AppTheme get theme => appTheme;

  Future<void> initAppTheme(
      TextStyles textStyles, AppColors appColors, ThemeData themeData) async {
    // TextStyles textStyles =
    // TextStyles(
    //     headings: Headings(),
    //     bodyBold: BodyBold(),
    //     bodyMedium: BodyMedium(),
    //     body: Body(),
    //     bodyLink: BodyLink(),
    //     button: Button());
    // AppColors appColors = AppColors();
    // ThemeData themeData = ThemeData(
    //   useMaterial3: true,
    //   colorScheme: ColorScheme.fromSeed(
    //     seedColor: const Color.fromARGB(255, 95, 21, 152),
    //   ),
    // );

    appTheme = AppTheme(
      textStyles: textStyles,
      appColors: appColors,
      themedata: themeData,
    );
  }
}

final themeProvider = ChangeNotifierProvider((ref) {
  return ThemeNotifier();
});
