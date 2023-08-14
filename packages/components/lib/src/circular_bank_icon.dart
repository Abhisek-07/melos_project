// import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:utils/utils.dart';

class CircularBankIcon extends StatelessWidget {
  const CircularBankIcon({
    super.key,
    required this.bankIcon,
    this.size = IconSize.medium,
  })  : networkUrl = '',
        svgIcon = '',
        linearGradientColors = null;

  const CircularBankIcon.network({
    super.key,
    required this.networkUrl,
    this.size = IconSize.medium,
  })  : bankIcon = '',
        svgIcon = '',
        linearGradientColors = null;

  const CircularBankIcon.svg({
    super.key,
    required this.svgIcon,
    this.size = IconSize.medium,
    this.linearGradientColors,
  })  : bankIcon = '',
        networkUrl = '';

  final String bankIcon;
  final IconSize size;
  final String networkUrl;
  final String svgIcon;

  final List<Color>? linearGradientColors;

  @override
  Widget build(BuildContext context) {
    final double radius = getIconSize(size) / 2;

    if (networkUrl.isNotEmpty) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        backgroundImage: NetworkImage(networkUrl),
      );
    } else if (svgIcon.isNotEmpty) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        child: Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: linearGradientColors ?? gradientColorsForBankIcon[0],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),
          child: Center(
            child: SvgPicture.asset(svgIcon),
          ),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        backgroundImage: AssetImage(bankIcon),
      );
    }
  }
}
