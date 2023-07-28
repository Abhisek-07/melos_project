import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: appTheme.appDefaults.grayScaleWhite,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: backgroundColor ?? appTheme.appDefaults.grayScaleWhite,
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.symmetric(
            horizontal: showBackIcon ? padding12 : padding16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showBackIcon)
              Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: SizedBox(
                  width: spacing48,
                  height: spacing48,
                  // padding: const EdgeInsets.symmetric(horizontal: padding16),
                  child: InkWell(
                    onTap: onBackButtonPress ??
                        () {
                          // optionsNotifier.resetSelectedIndexInListVewOnBackButtonPress();
                          Navigator.pop(context);
                        },
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
                width: spacing16,
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
