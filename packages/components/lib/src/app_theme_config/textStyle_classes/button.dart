import 'package:flutter/material.dart';

class Button {
  Button({
    required this.large,
    required this.medium,
    required this.small,
    required this.xs,
  });

  TextStyle large;
  TextStyle medium;
  TextStyle small;
  TextStyle xs;

  // TextStyle large = const TextStyle(
  //   color: Colors.black,
  //   fontSize: 17,
  //   fontStyle: FontStyle.normal,
  //   fontWeight: FontWeight.w500,
  //   // height: 1.4,
  // );
  // TextStyle medium = const TextStyle(
  //   color: Colors.black,
  //   fontSize: 15,
  //   fontStyle: FontStyle.normal,
  //   fontWeight: FontWeight.w500,
  //   // height: 1.4,
  // );
  // TextStyle small = const TextStyle(
  //   color: Colors.black,
  //   fontSize: 14,
  //   fontStyle: FontStyle.normal,
  //   fontWeight: FontWeight.w500,
  //   // height: 1.4,
  // );
  // TextStyle xs = const TextStyle(
  //   color: Colors.black,
  //   fontSize: 12,
  //   fontStyle: FontStyle.normal,
  //   fontWeight: FontWeight.w500,
  //   // height: 1.4,
  // );
}
