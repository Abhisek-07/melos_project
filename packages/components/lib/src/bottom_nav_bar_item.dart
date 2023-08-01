import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:utils/utils.dart';

class BottomNavBarItem extends BottomNavigationBarItem {
  BottomNavBarItem({
    String? activeIconPath,
    String? iconPath,
    String? label,
    Color? activeColor,
    Color? inactiveColor,
    required AppTheme appTheme,
  }) : super(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: padding8),
            child: SvgPicture.asset(
              activeIconPath ?? 'assets/icons/capital.svg',
              colorFilter: ColorFilter.mode(
                  appTheme.appDefaults.grayScaleBlack, BlendMode.srcIn),
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: padding8),
            child: SvgPicture.asset(
              iconPath ?? 'assets/icons/capital.svg',
              colorFilter: ColorFilter.mode(
                  appTheme.appDefaults.grayScale70, BlendMode.srcIn),
            ),
          ),
          label: label ?? 'Component',
        );
}
