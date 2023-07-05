import 'package:flutter/material.dart';

class CircularBankIcon extends StatelessWidget {
  const CircularBankIcon(
      {super.key, required this.bankIcon, this.size = 'medium'})
      : networkUrl = '';

  const CircularBankIcon.network(
      {super.key, required this.networkUrl, this.size = 'medium'})
      : bankIcon = '';

  final String bankIcon;
  final String size;
  final String networkUrl;

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
