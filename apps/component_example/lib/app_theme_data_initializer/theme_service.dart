import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ThemeService {
  static late final TextStyles textStyles;
  static late final AppColors appColors;
  static late final ThemeData themeData;

  static Future<void> initAppStyles() async {
    /// textStyles
    textStyles = TextStyles(
      headings: Headings(
        h1: const TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.8,
          height: 1.4,
        ),
        h2: const TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.72,
          height: 1.4,
        ),
        h3: const TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.64,
          height: 1.4,
        ),
        h4: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.48,
          height: 1.4,
        ),
        h5: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.4,
          height: 1.4,
        ),
        h6: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.36,
          height: 1.4,
        ),
      ),
      bodyBold: BodyBold(
        large: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          height: 1.4,
        ),
        medium: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          height: 1.4,
        ),
        small: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          height: 1.4,
        ),
        xs: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          height: 1.4,
        ),
        xxs: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          height: 1.4,
        ),
      ),
      bodyMedium: BodyMedium(
        large: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        medium: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        small: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        xs: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        xxs: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
      ),
      body: Body(
        large: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        medium: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        small: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        xs: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        xxs: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
      ),
      bodyLink: BodyLink(
        large: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
          decoration: TextDecoration.underline,
        ),
        medium: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
          decoration: TextDecoration.underline,
        ),
        small: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          height: 1.4,
          decoration: TextDecoration.underline,
        ),
      ),
      button: Button(
        large: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          // height: 1.4,
        ),
        medium: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          // height: 1.4,
        ),
        small: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          // height: 1.4,
        ),
        xs: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          // height: 1.4,
        ),
      ),
    );

    /// AppColors
    // appColors = AppColors.fromJson(json);
    appColors = AppColors(
      // brand colors
      brandPrime: const Color.fromARGB(255, 148, 94, 218),
      brandSecond: const Color.fromARGB(255, 220, 201, 198),
      brandThird: const Color.fromARGB(255, 234, 174, 216),
      brandFourth: const Color.fromARGB(255, 255, 50, 22),
      brandFifth: const Color.fromARGB(255, 214, 255, 224),
      brandCTA: Colors.black,
      primeScale1: const Color.fromARGB(255, 241, 234, 250),
      primeScale2: const Color.fromARGB(255, 213, 187, 245),
      primeScale3: const Color.fromARGB(255, 127, 85, 181),
      primeScale4: const Color.fromARGB(255, 77, 29, 124),
      primeScale5: const Color.fromARGB(255, 51, 9, 78),

      // gradient colors
      gradientPrime1: [
        const Color(0xFF361065),
        const Color(0xFF55288C),
        const Color(0xFF7248A8),
        const Color(0xFFA070DE),
        const Color(0xFFC497FF),
      ],
      gradientPrime2: [
        const Color(0xFFE1C9FF),
        const Color(0xFFA575E3),
      ],
      gradientPrime3: [
        const Color(0xFFD7BEF3),
        const Color(0xFFF2ECFB),
      ],
      gradientSecond: [
        const Color(0xFFF1BAE1),
        const Color(0xFFF7EBF3),
      ],
      gradientThird: [
        const Color(0xFFD7C1BE),
        const Color(0xFFFBF4F3),
      ],
      gradientFourth: [
        const Color(0xFFF65D4A),
        const Color(0xFFE260A3),
      ],
      gradientError: [
        const Color(0xFFF35E48),
        const Color(0xFFFF9485),
      ],
      gradientAlert: [
        const Color(0xFFFF8F00),
        const Color(0xFFFED197),
      ],
      gradientSuccess: [
        const Color(0xFF00B67A),
        const Color(0xFF23EDAA),
      ],
      // grayscale colors
      grayScaleBlack: Colors.black,
      grayScale90: const Color.fromARGB(255, 82, 82, 82),
      grayScale80: const Color.fromARGB(255, 103, 103, 103),
      grayScale70: const Color.fromARGB(255, 147, 147, 147),
      grayScale60: const Color.fromARGB(255, 190, 190, 190),
      grayScale50: const Color.fromARGB(255, 224, 224, 224),
      grayScale40: const Color.fromARGB(255, 233, 233, 233),
      grayScale30: const Color.fromARGB(255, 241, 241, 241),
      grayScale20: const Color.fromARGB(255, 251, 251, 251),
      grayScaleWhite: Colors.white,

      // systemLink colors
      systemTextLink: const Color.fromARGB(255, 94, 22, 156),
      systemTextSuccess: const Color.fromARGB(255, 0, 168, 113),
      systemTextAlert: const Color.fromARGB(255, 248, 121, 4),
      systemTextError: const Color.fromARGB(255, 241, 58, 32),
    );

    /// themeData
    themeData = ThemeData();
  }
}
