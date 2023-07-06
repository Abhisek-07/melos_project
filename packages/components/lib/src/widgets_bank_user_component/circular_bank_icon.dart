import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

// enum CircularBankIconSize { low, medium, high }

class CircularBankIcon extends StatelessWidget {
  const CircularBankIcon(
      {super.key, required this.bankIcon, this.size = IconSize.medium})
      : networkUrl = '';

  const CircularBankIcon.network(
      {super.key, required this.networkUrl, this.size = IconSize.medium})
      : bankIcon = '';

  final String bankIcon;
  final IconSize size;
  final String networkUrl;

  // double _getSizeValue() {
  //   switch (size) {
  //     case CircularBankIconSize.low:
  //       return 32;
  //     case CircularBankIconSize.medium:
  //       return 48;
  //     case CircularBankIconSize.high:
  //       return 64;
  //     default:
  //       return 48;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final double radius = getIconSize(size) / 2;

    return networkUrl.isNotEmpty
        ? CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: radius,
            backgroundImage: NetworkImage(networkUrl),
          )
        : CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: radius,
            backgroundImage: AssetImage(bankIcon),
          );
  }
}
