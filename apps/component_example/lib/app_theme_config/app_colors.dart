import 'package:flutter/material.dart';

class AppColors {
  AppColors();

  // brand colors
  final Color brandPrime = const Color.fromARGB(255, 148, 94, 218);
  final Color brandSecond = const Color.fromARGB(255, 220, 201, 198);
  final Color brandThird = const Color.fromARGB(255, 234, 174, 216);
  final Color brandFourth = const Color.fromARGB(255, 255, 50, 22);
  final Color brandFifth = const Color.fromARGB(255, 214, 255, 224);
  final Color brandCTA = Colors.black;
  final Color primeScale1 = const Color.fromARGB(255, 241, 234, 250);
  final Color primeScale2 = const Color.fromARGB(255, 213, 187, 245);
  final Color primeScale3 = const Color.fromARGB(255, 127, 85, 181);
  final Color primeScale4 = const Color.fromARGB(255, 77, 29, 124);
  final Color primeScale5 = const Color.fromARGB(255, 51, 9, 78);

  // gradient colors
  final LinearGradient gradientPrime1 = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0844, 0.3196, 0.5443, 0.7783, 1.0],
    colors: [
      Color(0xFF361065),
      Color(0xFF55288C),
      Color(0xFF7248A8),
      Color(0xFFA070DE),
      Color(0xFFC497FF),
    ],
  );
  final LinearGradient gradientPrime2 = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(213 * 3.1415927 / 180),
    stops: [0.0, 1.0],
    colors: [
      Color(0xFFE1C9FF),
      Color(0xFFA575E3),
    ],
  );
  final LinearGradient gradientPrime3 = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(43 * 3.1415927 / 180),
    stops: [0.0, 0.8249],
    colors: [
      Color(0xFFD7BEF3),
      Color(0xFFF2ECFB),
    ],
  );
  final LinearGradient gradientSecond = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(44 * 3.1415927 / 180),
    stops: [0.0, 0.5812],
    colors: [
      Color(0xFFF1BAE1),
      Color(0xFFF7EBF3),
    ],
  );
  final LinearGradient gradientThird = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(46 * 3.1415927 / 180),
    stops: [0.0, 0.7738],
    colors: [
      Color(0xFFD7C1BE),
      Color(0xFFFBF4F3),
    ],
  );
  final LinearGradient gradientFourth = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(46 * 3.1415927 / 180),
    stops: [0.3125, 0.7738],
    colors: [
      Color(0xFFF65D4A),
      Color(0xFFE260A3),
    ],
  );
  final LinearGradient gradientError = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    transform: GradientRotation(34 * 3.1415927 / 180),
    stops: [0.0, 1.0],
    colors: [
      Color(0xFFF35E48),
      Color(0xFFFF9485),
    ],
  );
  final LinearGradient gradientAlert = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    transform: GradientRotation(21 * 3.1415927 / 180),
    stops: [0.0, 1.0],
    colors: [
      Color(0xFFFF8F00),
      Color(0xFFFED197),
    ],
  );
  final LinearGradient gradientSuccess = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    transform: GradientRotation(128 * 3.1415927 / 180),
    stops: [0.0, 1.0],
    colors: [
      Color(0xFF00B67A),
      Color(0xFF23EDAA),
    ],
  );

  // grayscale colors
  final Color grayScaleBlack = Colors.black;
  final Color grayScale90 = const Color.fromARGB(255, 82, 82, 82);
  final Color grayScale80 = const Color.fromARGB(255, 103, 103, 103);
  final Color grayScale70 = const Color.fromARGB(255, 147, 147, 147);
  final Color grayScale60 = const Color.fromARGB(255, 190, 190, 190);
  final Color grayScale50 = const Color.fromARGB(255, 224, 224, 224);
  final Color grayScale40 = const Color.fromARGB(255, 233, 233, 233);
  final Color grayScale30 = const Color.fromARGB(255, 241, 241, 241);
  final Color grayScale20 = const Color.fromARGB(255, 251, 251, 251);
  final Color grayScaleWhite = Colors.white;

  // systemLink colors
  final Color systemTextLink = const Color.fromARGB(255, 94, 22, 156);
  final Color systemTextSuccess = const Color.fromARGB(255, 0, 168, 113);
  final Color systemTextAlert = const Color.fromARGB(255, 248, 121, 4);
  final Color systemTextError = const Color.fromARGB(255, 241, 58, 32);
}
