import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ThemeService {
  static late final TextStyles textStyles;
  late final AppColors appColors;
  late final ThemeData themeData;

  static void initAppStyles() {
    textStyles = TextStyles(
      headings: Headings(
        h1: h1,
        h2: h2,
        h3: h3,
        h4: h4,
        h5: h5,
        h6: h6,
      ),
      bodyBold: BodyBold(
        large: large,
        medium: medium,
        small: small,
        xs: xs,
        xxs: xxs,
      ),
      bodyMedium: BodyMedium(
        large: large,
        medium: medium,
        small: small,
        xs: xs,
        xxs: xxs,
      ),
      body: Body(
        large: large,
        medium: medium,
        small: small,
        xs: xs,
        xxs: xxs,
      ),
      bodyLink: BodyLink(
        large: large,
        medium: medium,
        small: small,
      ),
      button: Button(
        large: large,
        medium: medium,
        small: small,
        xs: xs,
      ),
    );
  }
}
