import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.svgBackIconAsset,
    this.onBackButtonPress,
    this.titleStyle,
    required this.appTheme,
    this.showBackIcon = true,
    this.backgroundColor,
  });

  final String title;
  final String? svgBackIconAsset;
  final void Function()? onBackButtonPress;
  final bool showBackIcon;
  final AppTheme appTheme;
  final TextStyle? titleStyle;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: backgroundColor ?? appTheme.appDefaults.grayScaleWhite,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(padding8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showBackIcon)
              Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: InkWell(
                  onTap: onBackButtonPress ??
                      () {
                        // optionsNotifier.resetSelectedIndexInListVewOnBackButtonPress();
                        Navigator.pop(context);
                      },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: padding8),
                    child: Center(
                      child: SvgPicture.asset(
                        svgBackIconAsset ?? 'assets/icons/back_icon.svg',
                        height: spacing40,
                        width: spacing40,
                      ),
                    ),
                  ),
                ),
              ),
            if (showBackIcon)
              const SizedBox(
                width: spacing8,
              ),
            Text(
              title,
              // 'Choose Category',
              style: titleStyle ?? appTheme.textStyles.headings.h5,
            ),
          ],
        ),
      ),
    );
  }
}
