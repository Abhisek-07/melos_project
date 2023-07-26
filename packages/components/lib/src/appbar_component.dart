import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.svgBackIconAsset,
    this.onBackButtonPress,
    this.showBackIcon = true,
  });

  final String title;
  final String? svgBackIconAsset;
  final void Function()? onBackButtonPress;
  final bool showBackIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // backgroundColor: themeNotifier.theme.appColors.grayScaleWhite,
      automaticallyImplyLeading: false,
      title: Row(
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
                child: Padding(
                  padding: const EdgeInsets.all(padding4),
                  child: SvgPicture.asset(
                    svgBackIconAsset ?? 'assets/icons/back_icon.svg',
                    height: 36,
                    width: 36,
                  ),
                ),
              ),
            ),
          if (showBackIcon)
            const SizedBox(
              width: 16,
            ),
          Text(
            title,
            // 'Choose Category',
            // style: themeNotifier.theme.textStyles.headings.h5,
          ),
        ],
      ),
    );
  }
}
