import 'package:flutter/material.dart';

class CircularBankIcon extends StatelessWidget {
  const CircularBankIcon(
      {super.key, required this.bankIcon, this.size = 'medium'});

  final String bankIcon;
  final String size;

  double _getSizeValue() {
    switch (size) {
      case 'low':
        return 32;
      case 'medium':
        return 48;
      case 'high':
        return 64;
      default:
        return 48;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double radius = _getSizeValue() / 2;

    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(bankIcon),
    );
  }
}
