import 'package:flutter/material.dart';

enum CircularBankIconSize { low, medium, high }

class CircularBankIcon extends StatelessWidget {
  const CircularBankIcon(
      {super.key,
      required this.bankIcon,
      this.size = CircularBankIconSize.medium})
      : networkUrl = '';

  const CircularBankIcon.network(
      {super.key,
      required this.networkUrl,
      this.size = CircularBankIconSize.medium})
      : bankIcon = '';

  final String bankIcon;
  final CircularBankIconSize size;
  final String networkUrl;

  double _getSizeValue() {
    switch (size) {
      case CircularBankIconSize.low:
        return 32;
      case CircularBankIconSize.medium:
        return 48;
      case CircularBankIconSize.high:
        return 64;
      default:
        return 48;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double radius = _getSizeValue() / 2;

    return networkUrl.isNotEmpty
        ? CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(networkUrl),
          )
        : CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(bankIcon),
          );
  }
}
